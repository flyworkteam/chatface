import 'dart:async';
import 'dart:typed_data';

import 'package:chatface/Services/realtime_gateway.dart';
import 'package:chatface/config/stt_config.dart';
import 'package:chatface/utils/print.dart';
import 'package:record/record.dart';

enum StreamingSttStatus { idle, starting, ready, streaming, stopping, error }

class StreamingSttService {
  StreamingSttService(this._gateway) {
    _sttEvents = _gateway.sttEvents.listen(_handleGatewayEvent);
  }

  final RealtimeGatewayService _gateway;
  final AudioRecorder _recorder = AudioRecorder();
  late final StreamSubscription<SttStreamEvent> _sttEvents;

  final _statusController = StreamController<StreamingSttStatus>.broadcast();
  StreamingSttStatus _status = StreamingSttStatus.idle;

  StreamingSttStatus get status => _status;
  Stream<StreamingSttStatus> get statuses => _statusController.stream;

  final BytesBuilder _buffer = BytesBuilder(copy: false);
  StreamSubscription<Uint8List>? _audioSubscription;
  Completer<bool>? _startCompleter;
  DateTime? _startedAt;
  int _sequence = 0;
  int _streamedMs = 0;

  Future<bool> start() async {
    if (!SttConfig.streamingEnabled) {
      Print.warning('Streaming STT disabled via config.', tag: 'StreamingSTT');
      return false;
    }

    if (_status == StreamingSttStatus.starting ||
        _status == StreamingSttStatus.streaming) {
      return true;
    }

    _updateStatus(StreamingSttStatus.starting);
    _startCompleter = Completer<bool>();
    _sequence = 0;
    _streamedMs = 0;
    _startedAt = null;
    _buffer.clear();

    _gateway.startSttStream(sampleRate: SttConfig.sampleRate);
    return _startCompleter!.future;
  }

  Future<void> stop({bool closeStream = true}) async {
    if (_status == StreamingSttStatus.idle) {
      return;
    }
    _updateStatus(StreamingSttStatus.stopping);
    await _audioSubscription?.cancel();
    _audioSubscription = null;
    if (await _recorder.isRecording()) {
      await _recorder.stop();
    }
    _buffer.clear();
    _startedAt = null;
    _sequence = 0;
    _streamedMs = 0;
    if (closeStream) {
      _gateway.stopSttStream(close: true);
    }
    _updateStatus(StreamingSttStatus.idle);
  }

  Future<void> dispose() async {
    await stop(closeStream: false);
    await _sttEvents.cancel();
    await _statusController.close();
    await _recorder.dispose();
  }

  void _handleGatewayEvent(SttStreamEvent event) {
    if (event is SttStreamReadyEvent) {
      _startCompleter?.complete(true);
      _startCompleter = null;
      _updateStatus(StreamingSttStatus.ready);
      _beginRecording();
    } else if (event is SttStreamErrorEvent) {
      _startCompleter?.complete(false);
      _startCompleter = null;
      _updateStatus(StreamingSttStatus.error);
    } else if (event is SttStreamStoppedEvent) {
      _updateStatus(StreamingSttStatus.idle);
    }
  }

  Future<void> _beginRecording() async {
    if (_status == StreamingSttStatus.streaming) {
      return;
    }

    final hasPermission = await _recorder.hasPermission();
    if (!hasPermission) {
      Print.warning(
        'Record permission missing during streaming STT start.',
        tag: 'StreamingSTT',
      );
      _updateStatus(StreamingSttStatus.error);
      return;
    }

    final config = RecordConfig(
      encoder: AudioEncoder.pcm16bits,
      sampleRate: SttConfig.sampleRate,
      numChannels: 1,
      bitRate: SttConfig.sampleRate * 16,
      autoGain: SttConfig.autoGainEnabled,
      echoCancel: SttConfig.echoCancellationEnabled,
      noiseSuppress: SttConfig.noiseSuppressionEnabled,
      androidConfig: const AndroidRecordConfig(
        audioSource: AndroidAudioSource.voiceCommunication,
        audioManagerMode: AudioManagerMode.modeInCommunication,
      ),
    );

    final stream = await _recorder.startStream(config);

    _startedAt = DateTime.now();
    _audioSubscription = stream.listen(
      _handleAudioChunk,
      onError: (Object error, StackTrace stack) {
        Print.error(
          'Streaming STT recorder error: $error',
          tag: 'StreamingSTT',
          st: stack,
        );
        _updateStatus(StreamingSttStatus.error);
      },
      onDone: () {
        if (_status == StreamingSttStatus.streaming) {
          _updateStatus(StreamingSttStatus.ready);
        }
      },
      cancelOnError: true,
    );
    _updateStatus(StreamingSttStatus.streaming);
  }

  void _handleAudioChunk(Uint8List data) {
    if (_status != StreamingSttStatus.streaming) {
      return;
    }
    _buffer.add(data);
    final combined = _buffer.takeBytes();
    final chunkBytes = SttConfig.pcmBytesPerChunk();
    var offset = 0;
    while (offset + chunkBytes <= combined.length) {
      final chunk = combined.sublist(offset, offset + chunkBytes);
      offset += chunkBytes;
      _dispatchChunk(Uint8List.fromList(chunk));
    }
    if (offset < combined.length) {
      _buffer.add(combined.sublist(offset));
    }
  }

  void _dispatchChunk(Uint8List chunk) {
    final now = DateTime.now();
    _streamedMs += SttConfig.chunkMs;
    final elapsed = _startedAt == null
        ? 0
        : now.difference(_startedAt!).inMilliseconds;
    final ahead = _streamedMs - elapsed;
    if (ahead > SttConfig.maxLagMs) {
      Print.warning(
        'Dropping STT chunk due to back-pressure ($ahead ms ahead)',
        tag: 'StreamingSTT',
      );
      return;
    }
    _gateway.sendSttAudioChunk(bytes: chunk, sequence: _sequence++);
  }

  void _updateStatus(StreamingSttStatus status) {
    if (_status == status) {
      return;
    }
    _status = status;
    _statusController.add(status);
  }
}
