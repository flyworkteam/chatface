import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart' as ap;
import 'package:chatface/utils/app_config.dart';
import 'package:chatface/utils/print.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class TtsPlaybackService {
  static const Duration _visemeFetchTimeout = Duration(milliseconds: 350);

  TtsPlaybackService() {
    _player = ap.AudioPlayer();
    _initializePlayer();
  }

  TtsPlaybackService.test();

  void _initializePlayer() {
    final player = _player;
    if (player == null) {
      return;
    }
    _completeSubscription = player.onPlayerComplete.listen(
      (_) => _handlePlaybackComplete(),
    );
    if (_preferBytesOnCurrentPlatform) {
      player.setPlayerMode(ap.PlayerMode.lowLatency).catchError((_) {});
    }
  }

  ap.AudioPlayer? _player;
  final _completions = StreamController<String>.broadcast();
  final _visualStateController =
      StreamController<TtsPlaybackVisualState>.broadcast();
  final Queue<_QueuedChunk> _queue = Queue<_QueuedChunk>();
  StreamSubscription<void>? _completeSubscription;
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 8),
      receiveTimeout: const Duration(seconds: 12),
      headers: const {'Content-Type': 'application/json'},
    ),
  );

  _QueuedChunk? _currentChunk;
  bool _isProcessing = false;
  bool _isDisposed = false;
  DateTime? _lastStartedAt;
  bool _startDelayScheduled = false;
  double _volume = 1;
  final List<Timer> _visemeTimers = [];

  Stream<String> get completedPlayback => _completions.stream;
  Stream<TtsPlaybackVisualState> get visualStates =>
      _visualStateController.stream;

  Future<void> setOutputEnabled(bool enabled) async {
    if (_isDisposed) return;
    _volume = enabled ? 1 : 0;
    final player = _player;
    if (player == null) return;
    try {
      await player.setVolume(_volume);
    } catch (_) {}
  }

  Future<void> setAudioContext(ap.AudioContext context) async {
    if (_isDisposed) return;
    final player = _player;
    if (player == null) return;
    try {
      await player.setAudioContext(context);
    } catch (_) {}
  }

  Future<void> playChunk({
    required String messageId,
    required String sequence,
    String? audioBase64,
    String? audioUrl,
    List<dynamic>? mouthCues,
    int? offsetMs,
    String? playbackId,
  }) async {
    final primarySource = _buildPrimarySource(
      audioUrl: audioUrl,
      audioBase64: audioBase64,
    );
    final fallbackSource = _buildFallbackSource(
      audioUrl: audioUrl,
      audioBase64: audioBase64,
    );
    final resolvedAudioUrl = (audioUrl != null && audioUrl.isNotEmpty)
        ? _resolveAudioUrl(audioUrl)
        : null;
    if (primarySource == null) {
      _emitCompletion(sequence);
      return;
    }

    if (resolvedAudioUrl != null) {
      debugPrint('TTS audio URL received: $resolvedAudioUrl');
    }

    final chunk = _QueuedChunk(
      messageId: messageId,
      sequence: sequence,
      playbackId: playbackId ?? messageId,
      source: primarySource,
      fallbackSource: fallbackSource,
      audioUrl: resolvedAudioUrl,
      offsetMs: offsetMs,
      serverMouthCues: mouthCues,
    );
    _queue.add(chunk);
    unawaited(_processQueue());
  }

  Future<void> stop({String? playbackId}) async {
    if (_isDisposed) return;

    final currentChunk = _currentChunk;
    final matchesCurrent =
        playbackId == null || (currentChunk?.playbackId == playbackId);
    if (matchesCurrent && currentChunk != null) {
      final sequence = currentChunk.sequence;
      _currentChunk = null;
      _isProcessing = false;
      _clearVisemeTimers();
      _emitVisualState(
        TtsPlaybackVisualState.stopped(
          playbackId: currentChunk.playbackId,
          sequence: currentChunk.sequence,
        ),
      );
      try {
        await _player?.stop();
      } catch (_) {}
      _emitCompletion(sequence);
    }

    if (_queue.isNotEmpty) {
      final remaining = Queue<_QueuedChunk>();
      for (final chunk in _queue) {
        final matches = playbackId == null || chunk.playbackId == playbackId;
        if (matches) {
          _emitCompletion(chunk.sequence);
        } else {
          remaining.add(chunk);
        }
      }
      _queue
        ..clear()
        ..addAll(remaining);
    }

    _processQueue();
  }

  Future<void> dispose() async {
    if (_isDisposed) return;
    await stop();
    _isDisposed = true;
    _clearVisemeTimers();
    await _completeSubscription?.cancel();
    await _player?.dispose();
    await _completions.close();
    await _visualStateController.close();
  }

  Future<void> _processQueue() async {
    if (_isDisposed || _isProcessing || _queue.isEmpty) {
      return;
    }

    if (_preferBytesOnCurrentPlatform && _lastStartedAt != null) {
      final elapsed = DateTime.now().difference(_lastStartedAt!);
      const minGap = Duration(milliseconds: 120);
      if (elapsed < minGap) {
        if (!_startDelayScheduled) {
          _startDelayScheduled = true;
          Timer(minGap - elapsed, () {
            _startDelayScheduled = false;
            unawaited(_processQueue());
          });
        }
        return;
      }
    }

    final chunk = _queue.removeFirst();
    _currentChunk = chunk;
    _isProcessing = true;
    _prepareVisemes(chunk);
    if (_currentChunk != chunk || _isDisposed) {
      return;
    }
    _lastStartedAt = DateTime.now();
    _scheduleVisemes(chunk);
    _emitVisualState(
      TtsPlaybackVisualState.started(
        playbackId: chunk.playbackId,
        sequence: chunk.sequence,
      ),
    );
    _playSource(chunk.source);
  }

  void _handlePlaybackComplete() {
    if (_isDisposed) return;
    if (_currentChunk != null) {
      _clearVisemeTimers();
      _emitVisualState(
        TtsPlaybackVisualState.stopped(
          playbackId: _currentChunk!.playbackId,
          sequence: _currentChunk!.sequence,
        ),
      );
      _emitCompletion(_currentChunk!.sequence);
      _currentChunk = null;
    }
    _isProcessing = false;
    unawaited(_processQueue());
  }

  void _handlePlaybackError(dynamic error) {
    if (_isDisposed) return;
    final chunk = _currentChunk;
    if (chunk != null &&
        chunk.fallbackSource != null &&
        !chunk.didUseFallback) {
      chunk.didUseFallback = true;
      _playSource(chunk.fallbackSource!);
      return;
    }

    if (chunk != null) {
      _clearVisemeTimers();
      _emitVisualState(
        TtsPlaybackVisualState.stopped(
          playbackId: chunk.playbackId,
          sequence: chunk.sequence,
        ),
      );
      _emitCompletion(chunk.sequence);
      _currentChunk = null;
    }
    _isProcessing = false;
    unawaited(_processQueue());
  }

  void _emitCompletion(String sequence) {
    if (_completions.isClosed) return;
    _completions.add(sequence);
  }

  void _emitVisualState(TtsPlaybackVisualState state) {
    if (_visualStateController.isClosed) return;
    _visualStateController.add(state);
  }

  ap.Source? _buildPrimarySource({String? audioUrl, String? audioBase64}) {
    if (_preferBytesOnCurrentPlatform) {
      if (audioBase64 != null && audioBase64.isNotEmpty) {
        return _buildBytesSource(audioBase64);
      }
      if (audioUrl != null && audioUrl.isNotEmpty) {
        return ap.UrlSource(_resolveAudioUrl(audioUrl));
      }
      return null;
    }

    if (audioUrl != null && audioUrl.isNotEmpty) {
      return ap.UrlSource(_resolveAudioUrl(audioUrl));
    }
    if (audioBase64 != null && audioBase64.isNotEmpty) {
      return _buildBytesSource(audioBase64);
    }
    return null;
  }

  ap.Source? _buildFallbackSource({String? audioUrl, String? audioBase64}) {
    if (_preferBytesOnCurrentPlatform) {
      return null;
    }

    if (audioUrl != null &&
        audioUrl.isNotEmpty &&
        audioBase64 != null &&
        audioBase64.isNotEmpty) {
      return _buildBytesSource(audioBase64);
    }
    return null;
  }

  ap.BytesSource _buildBytesSource(String audioBase64) {
    return ap.BytesSource(base64Decode(audioBase64), mimeType: 'audio/mpeg');
  }

  void _playSource(ap.Source source) {
    Print.info(
      'Playback started at ${DateTime.now().toIso8601String()}',
      tag: 'TTSPlayback',
    );
    final player = _player;
    if (player == null) {
      _handlePlaybackError(StateError('Audio player is not initialized'));
      return;
    }
    try {
      player
          .play(source, volume: _volume)
          .catchError((error) => _handlePlaybackError(error));
    } catch (error) {
      _handlePlaybackError(error);
    }
  }

  String _resolveAudioUrl(String url) {
    final parsed = Uri.tryParse(url);
    if (parsed != null && parsed.hasScheme) {
      return url;
    }

    final base = AppConfig.apiBaseUrl();
    final baseUri = Uri.parse(base);
    if (url.startsWith('/')) {
      final resolvedAbsolute = baseUri.replace(path: url);
      return resolvedAbsolute.toString();
    }
    final resolved = baseUri.resolve(url);
    return resolved.toString();
  }

  bool get _preferBytesOnCurrentPlatform {
    if (kIsWeb) return false;
    return defaultTargetPlatform == TargetPlatform.iOS;
  }

  void _prepareVisemes(_QueuedChunk chunk) {
    if (chunk.visemesLoaded) {
      return;
    }
    chunk.visemesLoaded = true;

    final parsedFromEvent = _parseVisemes(
      chunk.serverMouthCues,
      offsetMs: chunk.offsetMs,
    );
    if (parsedFromEvent.isNotEmpty) {
      chunk.visemes = parsedFromEvent;
      return;
    }

    final audioUrl = chunk.audioUrl;
    if (audioUrl == null || audioUrl.isEmpty) {
      return;
    }

    final resolvedAudioUrl = _resolveAudioUrl(audioUrl);
    if (!_isPubliclyReachableAudioUrl(resolvedAudioUrl)) {
      Print.info(
        'Skipping remote viseme fetch for non-public audio URL: '
        '$resolvedAudioUrl',
      );
      return;
    }

    unawaited(() async {
      try {
        Print.info('Requesting visemes for audio URL: $resolvedAudioUrl');
        final response = await _dio
            .post(
              'https://viseme.fly-work.com/viseme',
              data: {'audioUrl': resolvedAudioUrl},
            )
            .timeout(_visemeFetchTimeout);
        Print.info('Viseme response: ${response.data}');
        chunk.visemes = _parseVisemeResponse(
          response.data,
          offsetMs: chunk.offsetMs,
        );
        Print.info('Received ${chunk.visemes.length} visemes');
        if (_currentChunk?.sequence == chunk.sequence &&
            chunk.visemes.isNotEmpty) {
          _scheduleVisemes(chunk);
        }
      } on TimeoutException {
        Print.info(
          'Viseme fetch timed out after '
          '${_visemeFetchTimeout.inMilliseconds}ms for $resolvedAudioUrl',
        );
      } catch (_) {
        // Fall back to idle mouth if viseme service is unavailable.
      }
    }());
  }

  List<_VisemeCue> _parseVisemeResponse(dynamic raw, {int? offsetMs}) {
    dynamic payload = raw;
    if (payload is String) {
      payload = jsonDecode(payload);
    }

    if (payload is List) {
      return _parseVisemes(payload, offsetMs: offsetMs);
    }
    if (payload is Map<String, dynamic>) {
      final candidates = [
        payload['visemes'],
        payload['mouthCues'],
        payload['cues'],
        payload['data'],
      ];
      for (final candidate in candidates) {
        if (candidate is List) {
          return _parseVisemes(candidate, offsetMs: offsetMs);
        }
      }
    }

    return const [];
  }

  List<_VisemeCue> _parseVisemes(List<dynamic>? rawCues, {int? offsetMs}) {
    if (rawCues == null || rawCues.isEmpty) {
      return const [];
    }

    final offsetSeconds = (offsetMs ?? 0) / 1000;
    final cues = <_VisemeCue>[];

    for (final entry in rawCues) {
      if (entry is! Map) {
        continue;
      }
      final map = Map<String, dynamic>.from(entry);
      final rawTime =
          map['time'] ?? map['start'] ?? map['offset'] ?? map['startTime'];
      final rawId =
          map['id'] ?? map['viseme'] ?? map['visemeId'] ?? map['value'];
      final time = _asDouble(rawTime);
      final visemeId = _asInt(rawId);
      if (time == null || visemeId == null) {
        continue;
      }
      cues.add(
        _VisemeCue(
          id: visemeId,
          timeSeconds: (time + offsetSeconds).clamp(0, double.infinity),
        ),
      );
    }

    cues.sort((a, b) => a.timeSeconds.compareTo(b.timeSeconds));
    return cues;
  }

  void _scheduleVisemes(_QueuedChunk chunk) {
    _clearVisemeTimers();

    final cues = chunk.visemes;
    if (cues.isEmpty) {
      debugPrint(
        'No visemes available for ${chunk.sequence}; using fallback mouth loop.',
      );
      _startFallbackVisemeLoop(chunk);
      return;
    }

    for (var i = 0; i < cues.length; i++) {
      final cue = cues[i];
      final nextCue = i + 1 < cues.length ? cues[i + 1] : null;
      final durationMs = nextCue == null
          ? 200
          : ((nextCue.timeSeconds - cue.timeSeconds) * 1000).round().clamp(
              60,
              400,
            );

      final timer = Timer(
        Duration(milliseconds: (cue.timeSeconds * 1000).round()),
        () {
          if (_currentChunk?.sequence != chunk.sequence) {
            return;
          }
          _emitVisualState(
            TtsPlaybackVisualState.viseme(
              playbackId: chunk.playbackId,
              sequence: chunk.sequence,
              visemeId: cue.id.toDouble(),
              durationMs: durationMs.toDouble(),
            ),
          );
        },
      );
      _visemeTimers.add(timer);
    }
  }

  void _startFallbackVisemeLoop(_QueuedChunk chunk) {
    const fallbackVisemes = <double>[0, 8, 1, 18, 2, 20, 11, 8];
    var index = 0;
    _emitVisualState(
      TtsPlaybackVisualState.viseme(
        playbackId: chunk.playbackId,
        sequence: chunk.sequence,
        visemeId: fallbackVisemes[index],
        durationMs: 140,
      ),
    );
    final timer = Timer.periodic(const Duration(milliseconds: 140), (_) {
      if (_currentChunk?.sequence != chunk.sequence) {
        return;
      }
      index = (index + 1) % fallbackVisemes.length;
      _emitVisualState(
        TtsPlaybackVisualState.viseme(
          playbackId: chunk.playbackId,
          sequence: chunk.sequence,
          visemeId: fallbackVisemes[index],
          durationMs: 140,
        ),
      );
    });
    _visemeTimers.add(timer);
  }

  void _clearVisemeTimers() {
    for (final timer in _visemeTimers) {
      timer.cancel();
    }
    _visemeTimers.clear();
  }

  double? _asDouble(dynamic value) {
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

  int? _asInt(dynamic value) {
    if (value is int) return value;
    if (value is num) return value.round();
    if (value is String) return int.tryParse(value);
    return null;
  }

  bool _isPubliclyReachableAudioUrl(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null || !uri.hasScheme) {
      return false;
    }

    final host = uri.host.toLowerCase();
    if (host == 'localhost' || host == '127.0.0.1') {
      return false;
    }
    if (host.startsWith('10.') ||
        host.startsWith('192.168.') ||
        host.startsWith('169.254.')) {
      return false;
    }
    final private172 = RegExp(r'^172\.(1[6-9]|2\d|3[0-1])\.');
    if (private172.hasMatch(host)) {
      return false;
    }
    return true;
  }
}

class _QueuedChunk {
  _QueuedChunk({
    required this.messageId,
    required this.sequence,
    required this.playbackId,
    required this.source,
    this.fallbackSource,
    this.audioUrl,
    this.serverMouthCues,
    this.offsetMs,
  });

  final String messageId;
  final String sequence;
  final String playbackId;
  final ap.Source source;
  final ap.Source? fallbackSource;
  final String? audioUrl;
  final List<dynamic>? serverMouthCues;
  final int? offsetMs;
  bool didUseFallback = false;
  bool visemesLoaded = false;
  List<_VisemeCue> visemes = const [];
}

class _VisemeCue {
  const _VisemeCue({required this.id, required this.timeSeconds});

  final int id;
  final double timeSeconds;
}

class TtsPlaybackVisualState {
  const TtsPlaybackVisualState({
    required this.playbackId,
    required this.sequence,
    required this.isTalking,
    required this.visemeId,
    required this.durationMs,
  });

  factory TtsPlaybackVisualState.started({
    required String playbackId,
    required String sequence,
  }) {
    return TtsPlaybackVisualState(
      playbackId: playbackId,
      sequence: sequence,
      isTalking: true,
      visemeId: 0,
      durationMs: 200,
    );
  }

  factory TtsPlaybackVisualState.viseme({
    required String playbackId,
    required String sequence,
    required double visemeId,
    required double durationMs,
  }) {
    return TtsPlaybackVisualState(
      playbackId: playbackId,
      sequence: sequence,
      isTalking: true,
      visemeId: visemeId,
      durationMs: durationMs,
    );
  }

  factory TtsPlaybackVisualState.stopped({
    required String playbackId,
    required String sequence,
  }) {
    return TtsPlaybackVisualState(
      playbackId: playbackId,
      sequence: sequence,
      isTalking: false,
      visemeId: 0,
      durationMs: 200,
    );
  }

  final String playbackId;
  final String sequence;
  final bool isTalking;
  final double visemeId;
  final double durationMs;
}
