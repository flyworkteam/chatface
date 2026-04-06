import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:chatface/Models/ai_message_model.dart';
import 'package:chatface/Riverpod/Providers/all_providers.dart';
import 'package:chatface/utils/app_config.dart';
import 'package:chatface/utils/print.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

typedef EventListener<T> = Stream<T>;

class RealtimeGatewayService {
  RealtimeGatewayService(this.ref);

  final Ref ref;
  WebSocketChannel? _channel;
  StreamSubscription? _subscription;
  Timer? _heartbeat;
  int _reconnectAttempts = 0;

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

  Future<void> connect({
    required String sessionId,
    required String token,
    required String language,
    required String mode,
  }) async {
    await disconnect();

    final baseUrl = AppConfig.realtimeBaseUrl();
    final separator = baseUrl.contains('?') ? '&' : '?';
    final url =
        '$baseUrl${separator}sessionId=$sessionId&token=$token&language=$language&mode=$mode';

    try {
      _channel = WebSocketChannel.connect(Uri.parse(url));
      _subscription = _channel!.stream.listen(
        _handleMessage,
        onDone: _handleDisconnect,
        onError: (error) => _handleError(error.toString()),
      );
      _startHeartbeat();
      _reconnectAttempts = 0;
      Print.info('Realtime gateway connected');
    } catch (e) {
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
          final handledSttError = _dispatchSttError(
            payload: jsonData,
            message: message,
            code: errorType,
          );
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
              (jsonData['clientMessageId'] ?? jsonData['client_message_id'])
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
    _handleError('Realtime disconnected');
  }

  void _handleError(String message) {
    Print.error(message, tag: 'RealtimeGateway');
    _errorStreamController.add(message);
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

  void _startHeartbeat() {
    _heartbeat?.cancel();
    _heartbeat = Timer.periodic(const Duration(seconds: 20), (_) {
      _send({'type': 'ping'});
    });
  }

  Future<void> disconnect() async {
    _heartbeat?.cancel();
    _heartbeat = null;

    await _subscription?.cancel();
    _subscription = null;

    await _channel?.sink.close();
    _channel = null;
  }

  Future<void> _scheduleReconnect({
    required String sessionId,
    required String token,
    required String language,
    required String mode,
  }) async {
    if (_reconnectAttempts > 4) return;
    final delay = Duration(seconds: 2 << _reconnectAttempts);
    _reconnectAttempts += 1;

    Future.delayed(delay, () {
      connect(
        sessionId: sessionId,
        token: token,
        language: language,
        mode: mode,
      );
    });
  }

  Future<void> saveResumeToken(String? token) async {
    if (token == null) return;
    await ref
        .read(AllProviders.secureStorageServiceProvider)
        .saveWebSocketResumeToken(token);
  }

  void dispose() {
    disconnect();
    _assistantStreamController.close();
    _ttsStreamController.close();
    _errorStreamController.close();
    _memoryStreamController.close();
    _ackStreamController.close();
    _conversationMarkerController.close();
    _sttStreamController.close();
    _languageStreamController.close();
  }
}

class LanguageUpdatedEvent {
  const LanguageUpdatedEvent({required this.language, required this.sessionId});

  final String language;
  final String sessionId;
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
