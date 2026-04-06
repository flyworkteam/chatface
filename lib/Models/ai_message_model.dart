enum MessageKind { user, assistant, system }

MessageKind _messageKindFromRole(String role) {
  switch (role) {
    case 'assistant':
      return MessageKind.assistant;
    case 'system':
      return MessageKind.system;
    default:
      return MessageKind.user;
  }
}

class AiAttachment {
  const AiAttachment({
    required this.url,
    this.thumbnailUrl,
    this.width,
    this.height,
    this.mimeType,
    this.sizeBytes,
    this.inlineBase64,
  });

  final String url;
  final String? thumbnailUrl;
  final int? width;
  final int? height;
  final String? mimeType;
  final int? sizeBytes;
  final String? inlineBase64;

  factory AiAttachment.fromJson(Map<String, dynamic> json) {
    return AiAttachment(
      url: json['url'] as String? ?? '',
      thumbnailUrl: json['thumbnailUrl'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      mimeType: json['mimeType'] as String?,
      sizeBytes: json['sizeBytes'] as int?,
      inlineBase64: json['inlineBase64'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (mimeType != null) 'mimeType': mimeType,
      if (sizeBytes != null) 'sizeBytes': sizeBytes,
      if (inlineBase64 != null) 'inlineBase64': inlineBase64,
    };
  }
}

class AiMessage {
  const AiMessage({
    required this.id,
    required this.text,
    required this.role,
    required this.createdAt,
    this.kind = MessageKind.user,
    this.isStreaming = false,
    this.clientMessageId,
    this.isDelivered = true,
    this.attachments = const <AiAttachment>[],
    this.conversationType = 'chat',
    this.conversationStatus = 'active',
    this.metadata = const <String, dynamic>{},
    this.isMarker = false,
  });

  final int id;
  final String text;
  final String role;
  final DateTime createdAt;
  final MessageKind kind;
  final bool isStreaming;
  final String? clientMessageId;
  final bool isDelivered;
  final List<AiAttachment> attachments;
  final String conversationType;
  final String conversationStatus;
  final Map<String, dynamic> metadata;
  final bool isMarker;

  factory AiMessage.fromJson(Map<String, dynamic> json) {
    final metadata = Map<String, dynamic>.from(
      json['metadata'] as Map<String, dynamic>? ?? const <String, dynamic>{},
    );
    final convoType = metadata['conversationType']?.toString() ?? 'chat';
    final convoStatus = metadata['conversationStatus']?.toString() ?? 'active';
    final isCall = convoType == 'voice_call' || convoType == 'video_call';

    return AiMessage(
      id: json['id'] is int ? json['id'] as int : int.parse(json['id'].toString()),
      text: json['text'] as String? ?? '',
      role: json['role'] as String? ?? 'user',
      createdAt: DateTime.tryParse(json['createdAt'] as String? ?? '') ?? DateTime.now(),
      attachments: (json['attachments'] as List?)
              ?.map((raw) => AiAttachment.fromJson(Map<String, dynamic>.from(raw as Map)))
              .toList() ??
          const <AiAttachment>[],
      metadata: metadata,
      conversationType: convoType,
      conversationStatus: convoStatus,
      isMarker: isCall && convoStatus == 'ended',
      kind: _messageKindFromRole(json['role'] as String? ?? 'user'),
    );
  }

  AiMessage copyWith({
    String? text,
    bool? isStreaming,
    bool? isDelivered,
    List<AiAttachment>? attachments,
    Map<String, dynamic>? metadata,
    String? conversationStatus,
  }) {
    return AiMessage(
      id: id,
      text: text ?? this.text,
      role: role,
      createdAt: createdAt,
      kind: kind,
      clientMessageId: clientMessageId,
      isStreaming: isStreaming ?? this.isStreaming,
      isDelivered: isDelivered ?? this.isDelivered,
      attachments: attachments ?? this.attachments,
      conversationType: conversationType,
      conversationStatus: conversationStatus ?? this.conversationStatus,
      metadata: metadata ?? this.metadata,
      isMarker: isMarker,
    );
  }
}

class ConversationMessagesPage {
  ConversationMessagesPage({
    required this.messages,
    this.nextBeforeId,
  });

  final List<AiMessage> messages;
  final int? nextBeforeId;
}

class ConversationSummary {
  ConversationSummary({
    required this.sessionId,
    required this.personaId,
    required this.personaName,
    required this.previewText,
    required this.previewType,
    required this.lastConversationType,
    required this.updatedAt,
  });

  final String sessionId;
  final String? personaId;
  final String personaName;
  final String previewText;
  final String previewType;
  final String lastConversationType;
  final DateTime updatedAt;

  factory ConversationSummary.fromJson(Map<String, dynamic> json) {
    return ConversationSummary(
      sessionId: json['sessionId']?.toString() ?? json['session_id'].toString(),
      personaId: json['persona'] is Map
          ? (json['persona']['id']?.toString())
          : json['persona_id']?.toString(),
      personaName: json['persona'] is Map
          ? (json['persona']['name'] as String? ?? 'Companion')
          : json['persona_name'] as String? ?? 'Companion',
      previewText: json['previewText'] as String? ?? json['preview_text'] as String? ?? '',
      previewType: json['previewType'] as String? ?? json['preview_type'] as String? ?? 'text',
      lastConversationType: json['lastConversationType'] as String? ??
          json['last_conversation_type'] as String? ??
          'chat',
      updatedAt: DateTime.tryParse(json['updatedAt'] as String? ?? json['updated_at'] as String? ?? '') ??
          DateTime.now(),
    );
  }
}

class AssistantEvent {
  AssistantEvent({
    required this.type,
    this.delta,
    this.messageId,
    this.latencyMs,
  });

  final String type;
  final String? delta;
  final int? messageId;
  final int? latencyMs;

  factory AssistantEvent.fromJson(Map<String, dynamic> json) {
    return AssistantEvent(
      type: json['type'] as String,
      delta: json['delta'] as String?,
      messageId: (json['messageId'] ?? json['message_id']) as int?,
      latencyMs: json['latencyMs'] as int?,
    );
  }
}

class TtsEvent {
  TtsEvent({
    required this.type,
    required this.sequence,
    this.chunkId,
    this.audioBase64,
    this.audioUrl,
    this.mouthCues,
    this.offsetMs,
    this.messageId,
    this.playbackId,
  });

  final String type;
  final String sequence;
  final String? chunkId;
  final String? audioBase64;
  final String? audioUrl;
  final List<dynamic>? mouthCues;
  final int? offsetMs;
  final int? messageId;
  final String? playbackId;

  factory TtsEvent.fromJson(Map<String, dynamic> json) {
    return TtsEvent(
      type: json['type'] as String,
      sequence: json['sequence'] as String,
      chunkId: json['chunkId'] as String?,
      audioBase64: json['audio'] as String?,
      audioUrl: (json['audioUrl'] ?? json['audio_url']) as String?,
      mouthCues: json['mouthCues'] as List<dynamic>?,
      offsetMs: json['offsetMs'] as int?,
      messageId: json['messageId'] as int?,
      playbackId: json['playbackId'] as String?,
    );
  }
}

class MemoryUpdateEvent {
  MemoryUpdateEvent({
    required this.type,
    this.summary,
    this.payload = const {},
  });

  final String type;
  final String? summary;
  final Map<String, dynamic> payload;

  factory MemoryUpdateEvent.fromJson(Map<String, dynamic> json) {
    final rawPayload =
        (json['payload'] ?? json['memory'] ?? <String, dynamic>{})
            as Map<String, dynamic>? ??
        const <String, dynamic>{};
    return MemoryUpdateEvent(
      type: json['type'] as String? ?? 'memory_update',
      summary: json['summary'] as String?,
      payload: Map<String, dynamic>.from(rawPayload),
    );
  }
}
