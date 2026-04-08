import 'dart:async';
import 'dart:convert';

import 'package:chatface/Models/ai_message_model.dart';
import 'package:chatface/Riverpod/Providers/all_providers.dart';
import 'package:chatface/utils/app_config.dart';
import 'package:chatface/utils/print.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

typedef EventListener<T> = Stream<T>;

const Object _diagnosticsNoChange = Object();

class RealtimeGatewayService with WidgetsBindingObserver {
  RealtimeGatewayService(this.ref) {
    WidgetsBinding.instance.addObserver(this);
  }

  final Ref ref;
  WebSocketChannel? _channel;
  StreamSubscription? _subscription;
  Timer? _heartbeat;
  Timer? _reconnectTimer;
  Completer<void>? _sessionReadyCompleter;
  int _reconnectAttempts = 0;
  RealtimeConnectRequest? _activeRequest;
  final ValueNotifier<RealtimeDiagnosticsSnapshot> _diagnostics = ValueNotifier(
    RealtimeDiagnosticsSnapshot.initial(
      apiBaseUrl: AppConfig.apiBaseUrl(),
      realtimeBaseUrl: AppConfig.realtimeBaseUrl(),
    ),
  );

  final _assistantStreamController =
      StreamController<AssistantEvent>.broadcast();
  final _ttsStreamController = StreamController<TtsEvent>.broadcast();
  final _errorStreamController = StreamController<String>.broadcast();
  final _memoryStreamController =
      StreamController<MemoryUpdateEvent>.broadcast();
  final _ackStreamController = StreamController<String>.broadcast();
  final _conversationMarkerController = StreamController<AiMessage>.broadcast();
  final _sttStreamController = StreamController<SttStreamEvent>.broadcast();
  final _languageStreamController =
      StreamController<LanguageUpdatedEvent>.broadcast();
  final _ttsLookupFailureController =
      StreamController<TtsLookupFailureEvent>.broadcast();

  EventListener<AssistantEvent> get assistantEvents =>
      _assistantStreamController.stream;
  EventListener<TtsEvent> get ttsEvents => _ttsStreamController.stream;
  EventListener<String> get errorEvents => _errorStreamController.stream;
  EventListener<MemoryUpdateEvent> get memoryEvents =>
      _memoryStreamController.stream;
  EventListener<String> get ackEvents => _ackStreamController.stream;
  EventListener<AiMessage> get conversationMarkers =>
      _conversationMarkerController.stream;
  EventListener<SttStreamEvent> get sttEvents => _sttStreamController.stream;
  EventListener<LanguageUpdatedEvent> get languageEvents =>
      _languageStreamController.stream;
  EventListener<TtsLookupFailureEvent> get ttsLookupFailures =>
      _ttsLookupFailureController.stream;
  ValueListenable<RealtimeDiagnosticsSnapshot> get diagnosticsListenable =>
      _diagnostics;

  Future<void> connect({
    required String sessionId,
    required String token,
    required String language,
    required String mode,
  }) async {
    _activeRequest = RealtimeConnectRequest(
      sessionId: sessionId,
      token: token,
      language: language,
      mode: mode,
    );
    await disconnect(preserveReconnectContext: true);

    final baseUri = Uri.parse(AppConfig.realtimeBaseUrl());
    final queryParameters = <String, String>{
      ...baseUri.queryParameters,
      'sessionId': sessionId,
      'token': token,
      'language': language,
      'mode': mode,
    };
    final url = baseUri.replace(queryParameters: queryParameters);

    _updateDiagnostics(
      status: RealtimeConnectionStatus.connecting,
      sessionId: sessionId,
      language: language,
      mode: mode,
      websocketUrl: _redactRealtimeUrl(url),
      sessionReady: false,
      lastError: null,
      lastEventType: 'connect_requested',
      reconnectAttempts: _reconnectAttempts,
    );

    try {
      final channel = WebSocketChannel.connect(url);
      final sessionReadyCompleter = Completer<void>();

      _channel = channel;
      _sessionReadyCompleter = sessionReadyCompleter;
      _subscription = _channel!.stream.listen(
        _handleMessage,
        onDone: _handleDisconnect,
        onError: (error) => _handleError(error.toString()),
      );
      await channel.ready.timeout(
        const Duration(seconds: 12),
        onTimeout: () =>
            throw TimeoutException('Timed out while opening realtime socket'),
      );
      _updateDiagnostics(
        status: RealtimeConnectionStatus.socketReady,
        lastEventType: 'socket_open',
      );
      await sessionReadyCompleter.future.timeout(
        const Duration(seconds: 12),
        onTimeout: () =>
            throw TimeoutException('Timed out waiting for realtime session'),
      );

      _startHeartbeat();
      _reconnectAttempts = 0;
      Print.info('Realtime gateway connected');
    } catch (e) {
      await disconnect(preserveReconnectContext: true);
      _handleError('Failed to connect: $e');
      _scheduleReconnect(
        sessionId: sessionId,
        token: token,
        language: language,
        mode: mode,
      );
    }
  }

  void sendUserMessage(
    String? message, {
    String? clientMessageId,
    String? conversationType,
    String? conversationStatus,
    List<Map<String, dynamic>>? attachments,
  }) {
    final payload = <String, dynamic>{
      'type': 'user_message',
      'text': ?message,
      'clientMessageId': ?clientMessageId,
      'conversationType': ?conversationType,
      'conversationStatus': ?conversationStatus,
      if (attachments != null && attachments.isNotEmpty)
        'attachments': attachments,
    };
    _send(payload);
  }

  void requestTts(int messageId, {String? playbackId}) {
    final payload = {
      'type': 'request_tts',
      'messageId': messageId,
      ...?(playbackId == null ? null : {'playbackId': playbackId}),
    };

    _send(payload);
  }

  void sendSttTranscript({
    required String text,
    String? transcriptId,
    bool isFinal = true,
    String? conversationType,
    String? conversationStatus,
  }) {
    final payload = <String, dynamic>{
      'type': 'stt_transcript',
      'text': text,
      'isFinal': isFinal,
      'transcriptId': ?transcriptId,
      'conversationType': ?conversationType,
      'conversationStatus': ?conversationStatus,
    };
    _send(payload);
  }

  void startSttStream({int? sampleRate, String encoding = 'pcm16'}) {
    final payload = <String, dynamic>{
      'type': 'stt_stream_start',
      'encoding': encoding,
      'sampleRate': ?sampleRate,
    };
    _send(payload);
  }

  void sendSttAudioChunk({
    required Uint8List bytes,
    String? transcriptId,
    int? sequence,
    bool markStop = false,
    bool isFinal = false,
  }) {
    if (bytes.isEmpty) {
      return;
    }
    final payload = <String, dynamic>{
      'type': 'stt_audio_chunk',
      'audio': base64Encode(bytes),
      'sequence': ?sequence,
      'transcriptId': ?transcriptId,
      if (markStop) 'vad': 'stop',
      if (isFinal) 'isFinal': true,
    };
    _send(payload);
  }

  void stopSttStream({String? transcriptId, bool close = false}) {
    final payload = <String, dynamic>{
      'type': 'stt_stream_stop',
      'transcriptId': ?transcriptId,
      if (close) 'close': true,
    };
    _send(payload);
  }

  void sendUpdateLanguage(String languageCode) {
    final payload = <String, dynamic>{
      'type': 'update_language',
      'language': languageCode,
    };
    _send(payload);
  }

  void _send(Map<String, dynamic> payload) {
    _sendRaw(jsonEncode(payload));
  }

  void _sendRaw(Object payload) {
    final channel = _channel;
    if (channel == null) {
      _handleError('Realtime channel not connected');
      return;
    }
    final sessionReadyCompleter = _sessionReadyCompleter;
    if (sessionReadyCompleter == null || !sessionReadyCompleter.isCompleted) {
      _handleError('Realtime channel not ready');
      return;
    }

    channel.sink.add(payload);
  }

  void _handleMessage(dynamic data) {
    try {
      final Map<String, dynamic>? jsonData = _normalizePayload(data);
      if (jsonData == null) {
        return;
      }

      final rawType = jsonData['type'];
      final type = rawType is String ? rawType.trim() : '';
      if (type.isNotEmpty) {
        _updateDiagnostics(lastEventType: type.toLowerCase());
      }
      switch (type.toLowerCase()) {
        case 'assistant_delta':
        case 'assistant_done':
          _assistantStreamController.add(AssistantEvent.fromJson(jsonData));
          break;
        case 'tts_started':
        case 'tts_chunk':
        case 'tts_done':
        case 'tts_suppressed':
          _ttsStreamController.add(TtsEvent.fromJson(jsonData));
          break;
        case 'error':
          final message =
              jsonData['message'] as String? ?? 'Unknown realtime error';
          final errorType =
              jsonData['errorType'] as String? ??
              jsonData['code'] as String? ??
              jsonData['error_code'] as String?;
          final handledTtsLookupFailure = _dispatchTtsLookupFailure(
            payload: jsonData,
            code: errorType,
          );
          final handledSttError = _dispatchSttError(
            payload: jsonData,
            message: message,
            code: errorType,
          );
          if (handledTtsLookupFailure) {
            break;
          }
          final details = errorType == null
              ? message
              : '$message (code: $errorType)';
          _handleError(details);
          if (handledSttError) {
            break;
          }
          break;
        case 'memory_update':
          _memoryStreamController.add(MemoryUpdateEvent.fromJson(jsonData));
          break;
        case 'message_ack':
          final clientId = jsonData['clientMessageId'] as String?;
          if (clientId != null) {
            _ackStreamController.add(clientId);
          }
          break;
        case 'ack':
          final clientId =
              (jsonData['clientMessageId'] ??
                      jsonData['client_message_id'] ??
                      jsonData['messageId'] ??
                      jsonData['message_id'])
                  as String?;
          if (clientId != null) {
            _ackStreamController.add(clientId);
          }
          break;
        case 'ping':
          final nonce = jsonData['nonce'];
          _send({
            'type': 'pong',
            ...?(nonce == null ? null : {'nonce': nonce}),
          });
          break;
        case 'pong':
          break;
        case 'typing':
          // Typing indicators are optional; ignore for now to avoid noise.
          break;
        case 'conversation_marker':
          _emitConversationMarker(jsonData);
          break;
        case 'llm_error':
          final message =
              jsonData['message'] ?? jsonData['detail'] ?? 'LLM error';
          _handleError(message.toString());
          break;
        case 'stt_stream_ready':
          _sttStreamController.add(
            SttStreamReadyEvent(
              sampleRate:
                  (jsonData['sampleRate'] ?? jsonData['sample_rate']) as int? ??
                  16000,
              encoding: (jsonData['encoding'] ?? jsonData['codec'] ?? 'pcm16')
                  .toString(),
              transcriptId:
                  (jsonData['transcriptId'] ?? jsonData['transcript_id'])
                      ?.toString(),
            ),
          );
          break;
        case 'stt_stream_error':
          _sttStreamController.add(
            SttStreamErrorEvent(
              message: (jsonData['message'] ?? 'Streaming STT error')
                  .toString(),
              allowFallback: jsonData['allowFallback'] == true,
              payload: jsonData,
            ),
          );
          break;
        case 'stt_stream_stop':
          _sttStreamController.add(
            SttStreamStoppedEvent(reason: jsonData['reason']?.toString()),
          );
          break;
        case 'stt_partial':
          _sttStreamController.add(
            SttStreamPartialEvent(
              transcriptId:
                  (jsonData['transcriptId'] ?? jsonData['transcript_id'])
                      ?.toString(),
              text: (jsonData['text'] ?? '').toString(),
              metadata: jsonData['metadata'] as Map<String, dynamic>?,
              confidence: (jsonData['confidence'] as num?)?.toDouble(),
            ),
          );
          break;
        case 'stt_transcript':
          _sttStreamController.add(
            SttTranscriptEvent(
              transcriptId:
                  (jsonData['transcriptId'] ?? jsonData['transcript_id'])
                      ?.toString() ??
                  '',
              text: (jsonData['text'] ?? '').toString(),
              metadata: jsonData['metadata'] as Map<String, dynamic>?,
              isFinal: jsonData['isFinal'] != false,
            ),
          );
          break;
        case 'session_ready':
          _handleSessionReady(jsonData);
          break;
        case 'language_updated':
          _languageStreamController.add(
            LanguageUpdatedEvent(
              language: (jsonData['language'] ?? '').toString(),
              sessionId: (jsonData['sessionId'] ?? jsonData['session_id'] ?? '')
                  .toString(),
            ),
          );
          break;
        default:
          final debugPayload = jsonEncode(jsonData);
          _handleError('Unknown event: $type payload=$debugPayload');
      }
    } catch (e) {
      _handleError('Failed to parse realtime event: $e');
    }
  }

  Map<String, dynamic>? _normalizePayload(dynamic data) {
    if (data is String) {
      if (data.trim() == 'ping') {
        _send({'type': 'pong'});
        return null;
      }
      final decoded = jsonDecode(data);
      if (decoded is String) {
        if (decoded.trim() == 'ping') {
          _send({'type': 'pong'});
          return null;
        }
        return null;
      }
      if (decoded is Map<String, dynamic>) {
        return decoded;
      }
      if (decoded is Map) {
        return Map<String, dynamic>.from(decoded);
      }
    }
    if (data is Map<String, dynamic>) {
      return data;
    }
    if (data is Map) {
      return Map<String, dynamic>.from(data);
    }
    _handleError('Unknown realtime payload: $data');
    return null;
  }

  void _handleSessionReady(Map<String, dynamic> payload) {
    final sessionId = payload['sessionId'] ?? payload['session_id'];
    final completer = _sessionReadyCompleter;
    if (completer != null && !completer.isCompleted) {
      completer.complete();
    }
    _updateDiagnostics(
      status: RealtimeConnectionStatus.sessionReady,
      sessionId: sessionId?.toString(),
      sessionReady: true,
      lastEventType: 'session_ready',
      lastError: null,
    );
    Print.info('Realtime session ready: $sessionId', tag: 'RealtimeGateway');
  }

  void _emitConversationMarker(Map<String, dynamic> payload) {
    final marker = _markerFromPayload(payload);
    if (marker == null) {
      return;
    }
    _conversationMarkerController.add(marker);
  }

  AiMessage? _markerFromPayload(Map<String, dynamic> payload) {
    final messageId = payload['messageId'] ?? payload['message_id'];
    if (messageId == null) {
      return null;
    }
    final metadataRaw = Map<String, dynamic>.from(
      payload['metadata'] as Map<String, dynamic>? ?? const <String, dynamic>{},
    );
    metadataRaw.putIfAbsent('conversationStatus', () => 'ended');
    final sessionId = payload['sessionId'] ?? payload['session_id'];
    if (sessionId != null) {
      metadataRaw['sessionId'] = sessionId;
    }

    return AiMessage.fromJson({
      'id': messageId,
      'role': 'system',
      'text': payload['text'] as String? ?? '',
      'createdAt':
          payload['createdAt']?.toString() ?? DateTime.now().toIso8601String(),
      'metadata': metadataRaw,
      'attachments': const <Map<String, dynamic>>[],
    });
  }

  void _handleDisconnect() {
    _updateDiagnostics(
      status: RealtimeConnectionStatus.disconnected,
      sessionReady: false,
      lastEventType: 'socket_closed',
    );
    _failPendingSessionReady('Realtime disconnected before session was ready');
    _handleError('Realtime disconnected');
  }

  void _handleError(String message) {
    _updateDiagnostics(
      status: RealtimeConnectionStatus.error,
      lastError: message,
    );
    _failPendingSessionReady(message);
    Print.error(message, tag: 'RealtimeGateway');
    _errorStreamController.add(message);
  }

  void _failPendingSessionReady(String message) {
    final completer = _sessionReadyCompleter;
    if (completer != null && !completer.isCompleted) {
      completer.completeError(StateError(message));
    }
  }

  bool _dispatchSttError({
    required Map<String, dynamic> payload,
    required String message,
    String? code,
  }) {
    final normalizedCode = (code ?? payload['code'] ?? payload['error_code'])
        ?.toString();
    final lowerCode = normalizedCode?.toLowerCase();
    final messageLower = message.toLowerCase();
    final looksLikeSttCode = lowerCode != null && lowerCode.startsWith('stt_');
    final messageHintsStt =
        messageLower.contains('stt') || messageLower.contains('microphone');
    if (!looksLikeSttCode && !messageHintsStt) {
      return false;
    }

    final allowFallbackRaw =
        payload['allowFallback'] ?? payload['allow_fallback'];
    final allowFallback = allowFallbackRaw is bool ? allowFallbackRaw : true;
    _sttStreamController.add(
      SttStreamErrorEvent(
        message: message,
        allowFallback: allowFallback,
        payload: payload,
      ),
    );
    return true;
  }

  bool _dispatchTtsLookupFailure({
    required Map<String, dynamic> payload,
    String? code,
  }) {
    final normalizedCode = (code ?? payload['code'] ?? payload['error_code'])
        ?.toString()
        .toLowerCase();
    if (normalizedCode != 'message_not_found') {
      return false;
    }

    final messageIdRaw = payload['messageId'] ?? payload['message_id'];
    final messageId = messageIdRaw is int
        ? messageIdRaw
        : int.tryParse(messageIdRaw?.toString() ?? '');
    if (messageId == null) {
      return false;
    }

    _ttsLookupFailureController.add(
      TtsLookupFailureEvent(messageId: messageId),
    );
    return true;
  }

  void _startHeartbeat() {
    _heartbeat?.cancel();
    _heartbeat = Timer.periodic(const Duration(seconds: 20), (_) {
      _send({'type': 'ping'});
    });
  }

  Future<void> disconnect({bool preserveReconnectContext = false}) async {
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    _heartbeat?.cancel();
    _heartbeat = null;

    await _subscription?.cancel();
    _subscription = null;

    await _channel?.sink.close();
    _channel = null;
    _sessionReadyCompleter = null;
    if (!preserveReconnectContext) {
      _activeRequest = null;
    }
    _updateDiagnostics(
      status: RealtimeConnectionStatus.idle,
      sessionReady: false,
    );
  }

  Future<void> _scheduleReconnect({
    required String sessionId,
    required String token,
    required String language,
    required String mode,
  }) async {
    _reconnectTimer?.cancel();
    if (_reconnectAttempts > 4) return;
    final delay = Duration(seconds: 2 << _reconnectAttempts);
    _reconnectAttempts += 1;
    _updateDiagnostics(
      status: RealtimeConnectionStatus.reconnecting,
      reconnectAttempts: _reconnectAttempts,
      lastEventType: 'reconnect_scheduled',
    );

    _reconnectTimer = Timer(delay, () {
      _reconnectTimer = null;
      connect(
        sessionId: sessionId,
        token: token,
        language: language,
        mode: mode,
      );
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        final request = _activeRequest;
        final shouldReconnect =
            request != null &&
            (_channel == null ||
                _diagnostics.value.status == RealtimeConnectionStatus.error ||
                _diagnostics.value.status ==
                    RealtimeConnectionStatus.disconnected);
        if (shouldReconnect) {
          unawaited(
            connect(
              sessionId: request.sessionId,
              token: request.token,
              language: request.language,
              mode: request.mode,
            ),
          );
        } else if (_channel != null &&
            _diagnostics.value.status ==
                RealtimeConnectionStatus.sessionReady &&
            _heartbeat == null) {
          _startHeartbeat();
        }
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        _heartbeat?.cancel();
        _heartbeat = null;
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  Future<void> saveResumeToken(String? token) async {
    if (token == null) return;
    await ref
        .read(AllProviders.secureStorageServiceProvider)
        .saveWebSocketResumeToken(token);
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    disconnect();
    _assistantStreamController.close();
    _ttsStreamController.close();
    _errorStreamController.close();
    _memoryStreamController.close();
    _ackStreamController.close();
    _conversationMarkerController.close();
    _sttStreamController.close();
    _languageStreamController.close();
    _ttsLookupFailureController.close();
    _diagnostics.dispose();
  }

  void _updateDiagnostics({
    RealtimeConnectionStatus? status,
    String? sessionId,
    String? language,
    String? mode,
    String? websocketUrl,
    bool? sessionReady,
    Object? lastError = _diagnosticsNoChange,
    String? lastEventType,
    int? reconnectAttempts,
  }) {
    _diagnostics.value = _diagnostics.value.copyWith(
      status: status,
      sessionId: sessionId,
      language: language,
      mode: mode,
      websocketUrl: websocketUrl,
      sessionReady: sessionReady,
      lastError: lastError,
      lastEventType: lastEventType,
      reconnectAttempts: reconnectAttempts,
      updatedAt: DateTime.now(),
    );
  }

  String _redactRealtimeUrl(Uri uri) {
    final redactedQueryParameters = <String, String>{
      ...uri.queryParameters,
      if (uri.queryParameters.containsKey('token')) 'token': '<redacted>',
    };
    return uri.replace(queryParameters: redactedQueryParameters).toString();
  }
}

enum RealtimeConnectionStatus {
  idle,
  connecting,
  socketReady,
  sessionReady,
  reconnecting,
  disconnected,
  error,
}

class RealtimeConnectRequest {
  const RealtimeConnectRequest({
    required this.sessionId,
    required this.token,
    required this.language,
    required this.mode,
  });

  final String sessionId;
  final String token;
  final String language;
  final String mode;
}

class RealtimeDiagnosticsSnapshot {
  const RealtimeDiagnosticsSnapshot({
    required this.apiBaseUrl,
    required this.realtimeBaseUrl,
    required this.status,
    required this.sessionReady,
    required this.reconnectAttempts,
    this.sessionId,
    this.language,
    this.mode,
    this.websocketUrl,
    this.lastError,
    this.lastEventType,
    this.updatedAt,
  });

  factory RealtimeDiagnosticsSnapshot.initial({
    required String apiBaseUrl,
    required String realtimeBaseUrl,
  }) {
    return RealtimeDiagnosticsSnapshot(
      apiBaseUrl: apiBaseUrl,
      realtimeBaseUrl: realtimeBaseUrl,
      status: RealtimeConnectionStatus.idle,
      sessionReady: false,
      reconnectAttempts: 0,
    );
  }

  final String apiBaseUrl;
  final String realtimeBaseUrl;
  final RealtimeConnectionStatus status;
  final bool sessionReady;
  final int reconnectAttempts;
  final String? sessionId;
  final String? language;
  final String? mode;
  final String? websocketUrl;
  final String? lastError;
  final String? lastEventType;
  final DateTime? updatedAt;

  String get statusLabel => switch (status) {
    RealtimeConnectionStatus.idle => 'idle',
    RealtimeConnectionStatus.connecting => 'connecting',
    RealtimeConnectionStatus.socketReady => 'socket-open',
    RealtimeConnectionStatus.sessionReady => 'session-ready',
    RealtimeConnectionStatus.reconnecting => 'reconnecting',
    RealtimeConnectionStatus.disconnected => 'disconnected',
    RealtimeConnectionStatus.error => 'error',
  };

  RealtimeDiagnosticsSnapshot copyWith({
    RealtimeConnectionStatus? status,
    String? sessionId,
    String? language,
    String? mode,
    String? websocketUrl,
    bool? sessionReady,
    Object? lastError = _diagnosticsNoChange,
    String? lastEventType,
    int? reconnectAttempts,
    DateTime? updatedAt,
  }) {
    return RealtimeDiagnosticsSnapshot(
      apiBaseUrl: apiBaseUrl,
      realtimeBaseUrl: realtimeBaseUrl,
      status: status ?? this.status,
      sessionReady: sessionReady ?? this.sessionReady,
      reconnectAttempts: reconnectAttempts ?? this.reconnectAttempts,
      sessionId: sessionId ?? this.sessionId,
      language: language ?? this.language,
      mode: mode ?? this.mode,
      websocketUrl: websocketUrl ?? this.websocketUrl,
      lastError: identical(lastError, _diagnosticsNoChange)
          ? this.lastError
          : lastError as String?,
      lastEventType: lastEventType ?? this.lastEventType,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class LanguageUpdatedEvent {
  const LanguageUpdatedEvent({required this.language, required this.sessionId});

  final String language;
  final String sessionId;
}

class TtsLookupFailureEvent {
  const TtsLookupFailureEvent({required this.messageId});

  final int messageId;
}

abstract class SttStreamEvent {
  const SttStreamEvent();
}

class SttStreamReadyEvent extends SttStreamEvent {
  const SttStreamReadyEvent({
    required this.sampleRate,
    required this.encoding,
    this.transcriptId,
  });

  final int sampleRate;
  final String encoding;
  final String? transcriptId;
}

class SttStreamPartialEvent extends SttStreamEvent {
  const SttStreamPartialEvent({
    required this.text,
    this.transcriptId,
    this.metadata,
    this.confidence,
  });

  final String text;
  final String? transcriptId;
  final Map<String, dynamic>? metadata;
  final double? confidence;
}

class SttTranscriptEvent extends SttStreamEvent {
  const SttTranscriptEvent({
    required this.transcriptId,
    required this.text,
    required this.isFinal,
    this.metadata,
  });

  final String transcriptId;
  final String text;
  final bool isFinal;
  final Map<String, dynamic>? metadata;
}

class SttStreamErrorEvent extends SttStreamEvent {
  const SttStreamErrorEvent({
    required this.message,
    required this.allowFallback,
    this.payload,
  });

  final String message;
  final bool allowFallback;
  final Map<String, dynamic>? payload;
}

class SttStreamStoppedEvent extends SttStreamEvent {
  const SttStreamStoppedEvent({this.reason});

  final String? reason;
}
