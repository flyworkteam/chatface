import 'dart:async';

import 'package:chatface/Models/ai_message_model.dart';
import 'package:chatface/Models/ai_session_model.dart';
import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Riverpod/Providers/ai_session_provider.dart';
import 'package:chatface/Riverpod/Providers/all_providers.dart';
import 'package:chatface/Riverpod/Providers/tts_playback_provider.dart';
import 'package:chatface/utils/print.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';

final chatControllerProvider = NotifierProvider<ChatController, ChatState>(
  ChatController.new,
);

class ChatState {
  const ChatState({
    required this.messages,
    required this.isTyping,
    required this.isConnected,
    required this.pagingState,
    this.historyLoaded = false,
    this.session,
    this.persona,
    this.memoryUpdates = const [],
  });

  final List<AiMessage> messages;
  final bool isTyping;
  final bool isConnected;
  final PagingState<int?, AiMessage> pagingState;
  final bool historyLoaded;
  final AiSession? session;
  final PersonaProfile? persona;
  final List<MemoryUpdateEvent> memoryUpdates;

  ChatState copyWith({
    List<AiMessage>? messages,
    bool? isTyping,
    bool? isConnected,
    PagingState<int?, AiMessage>? pagingState,
    bool? historyLoaded,
    AiSession? session,
    PersonaProfile? persona,
    List<MemoryUpdateEvent>? memoryUpdates,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      isTyping: isTyping ?? this.isTyping,
      isConnected: isConnected ?? this.isConnected,
      pagingState: pagingState ?? this.pagingState,
      historyLoaded: historyLoaded ?? this.historyLoaded,
      session: session ?? this.session,
      persona: persona ?? this.persona,
      memoryUpdates: memoryUpdates ?? this.memoryUpdates,
    );
  }

  static ChatState initial() => ChatState(
    messages: const [],
    isTyping: false,
    isConnected: false,
    pagingState: PagingState<int?, AiMessage>(),
    historyLoaded: false,
    memoryUpdates: const [],
  );
}

class ChatController extends Notifier<ChatState> {
  static const _pageSize = 30;
  String? _historySessionId;

  @override
  ChatState build() {
    ref.onDispose(() {
      _assistantSub?.cancel();
      _ttsSub?.cancel();
      _errorSub?.cancel();
      _ackSub?.cancel();
      _memorySub?.cancel();
      _markerSub?.cancel();
    });
    return ChatState.initial();
  }

  final _uuid = const Uuid();

  StreamSubscription<AssistantEvent>? _assistantSub;
  StreamSubscription<TtsEvent>? _ttsSub;
  StreamSubscription<String>? _errorSub;
  StreamSubscription<String>? _ackSub;
  StreamSubscription<MemoryUpdateEvent>? _memorySub;
  StreamSubscription<AiMessage>? _markerSub;
  StringBuffer? _streamingBuffer;
  int? _streamingMessageId;
  bool _isFetchingPage = false;

  void _updatePagingFromMessages({bool? hasNextPage}) {
    final updatedMessages = List<AiMessage>.from(state.messages);
    final currentKey = updatedMessages.isEmpty ? null : updatedMessages.last.id;
    state = state.copyWith(
      pagingState: state.pagingState.copyWith(
        pages: <List<AiMessage>>[updatedMessages],
        keys: <int?>[currentKey],
        hasNextPage: hasNextPage ?? state.pagingState.hasNextPage,
      ),
    );
  }

  Future<void> startChat(PersonaProfile persona, {String mode = 'chat'}) async {
    final existing = ref.read(aiSessionProvider);
    AiSession? session;

    if (existing.hasValue &&
        existing.value?.personaId == persona.id &&
        existing.value?.mode == mode) {
      session = existing.value;
    } else {
      session = await ref
          .read(aiSessionProvider.notifier)
          .startSession(
            persona: persona,
            language: persona.defaultLanguage,
            mode: mode,
          );
    }

    if (session == null) {
      Print.error('Failed to obtain AI session for ${persona.id}');
      return;
    }

    await _attachSession(session, persona: persona);
  }

  Future<void> _attachSession(
    AiSession session, {
    PersonaProfile? persona,
  }) async {
    final token = await ref
        .read(AllProviders.secureStorageServiceProvider)
        .getAccessToken();
    if (token == null) {
      Print.error('Cannot connect realtime without access token');
      return;
    }

    final gateway = ref.read(AllProviders.realtimeGatewayProvider);
    await gateway.connect(
      sessionId: session.id,
      token: token,
      language: session.languageCode,
      mode: session.mode,
    );

    _assistantSub?.cancel();
    _assistantSub = gateway.assistantEvents.listen(
      _handleAssistantEvent,
      onError: (error) {
        Print.error('Assistant stream error: $error');
      },
    );
    _ttsSub?.cancel();
    _ttsSub = gateway.ttsEvents.listen((event) {
      ref.read(ttsPlaybackProvider.notifier).handleEvent(event);
    });
    _errorSub?.cancel();
    _errorSub = gateway.errorEvents.listen((message) {
      Print.error(message);
      state = state.copyWith(isConnected: false);
    });
    _ackSub?.cancel();
    _ackSub = gateway.ackEvents.listen(_handleAckEvent);
    _memorySub?.cancel();
    _memorySub = gateway.memoryEvents.listen(_handleMemoryEvent);
    _markerSub?.cancel();
    _markerSub = gateway.conversationMarkers.listen(_handleConversationMarker);

    state = state.copyWith(
      session: session,
      persona: persona ?? state.persona,
      isConnected: true,
      historyLoaded: false,
      messages: const [],
      pagingState: PagingState<int?, AiMessage>(),
    );

    _historySessionId = session.id;
    await _loadNextPage();
  }

  void fetchNextPage() {
    unawaited(_loadNextPage());
  }

  Future<void> _loadNextPage() async {
    final sessionId = _historySessionId;
    if (sessionId == null || _isFetchingPage) {
      return;
    }

    final pagingState = state.pagingState;
    if (!pagingState.hasNextPage) {
      return;
    }

    _isFetchingPage = true;
    final beforeId = state.messages.isEmpty ? null : state.messages.last.id;
    state = state.copyWith(
      pagingState: pagingState.copyWith(isLoading: true, error: null),
    );

    try {
      final page = await ref
          .read(AllProviders.aiRepositoryProvider)
          .fetchConversationMessages(
            sessionId: sessionId,
            limit: _pageSize,
            beforeId: beforeId,
          );

      final updatedMessages = List<AiMessage>.from(state.messages);
      if (beforeId == null) {
        updatedMessages
          ..clear()
          ..addAll(page.messages);
      } else {
        updatedMessages.addAll(page.messages);
      }

      final currentKey = updatedMessages.isEmpty
          ? null
          : updatedMessages.last.id;
      state = state.copyWith(
        messages: updatedMessages,
        pagingState: state.pagingState.copyWith(
          pages: <List<AiMessage>>[updatedMessages],
          keys: <int?>[currentKey],
          hasNextPage: page.nextBeforeId != null,
          isLoading: false,
          error: null,
        ),
        historyLoaded: true,
      );
    } catch (error, stackTrace) {
      state = state.copyWith(
        pagingState: state.pagingState.copyWith(isLoading: false, error: error),
      );
      Print.error('Failed to load chat history: $error', st: stackTrace);
    } finally {
      _isFetchingPage = false;
    }
  }

  void _handleAssistantEvent(AssistantEvent event) {
    if (event.type == 'assistant_delta') {
      _streamingBuffer ??= StringBuffer();
      _streamingBuffer!.write(event.delta ?? '');
      _applyStreamingBuffer(event);
      state = state.copyWith(isTyping: true);
    } else if (event.type == 'assistant_done') {
      _finalizeStreamingMessage(event);
      state = state.copyWith(isTyping: false);
    }
  }

  void _applyStreamingBuffer(AssistantEvent event) {
    final bufferContent = _streamingBuffer?.toString() ?? '';
    if (bufferContent.isEmpty) return;

    final provisionalId =
        _streamingMessageId ??
        event.messageId ??
        DateTime.now().millisecondsSinceEpoch;
    _streamingMessageId ??= provisionalId;

    final existingIndex = state.messages.indexWhere(
      (message) => message.id == _streamingMessageId,
    );

    final streamingMessage = AiMessage(
      id: _streamingMessageId!,
      text: bufferContent,
      role: 'assistant',
      createdAt: existingIndex >= 0
          ? state.messages[existingIndex].createdAt
          : DateTime.now(),
      isStreaming: true,
      conversationStatus: 'active',
    );

    final updatedMessages = List<AiMessage>.from(state.messages);
    if (existingIndex >= 0) {
      updatedMessages[existingIndex] = streamingMessage;
    } else {
      updatedMessages.insert(0, streamingMessage);
    }

    state = state.copyWith(messages: updatedMessages);
    _updatePagingFromMessages();
  }

  void _finalizeStreamingMessage(AssistantEvent event) {
    if (_streamingBuffer == null) return;
    final placeholderId =
        _streamingMessageId ?? DateTime.now().millisecondsSinceEpoch;
    final resolvedId = event.messageId ?? placeholderId;
    final existingIndex = state.messages.indexWhere(
      (message) => message.id == placeholderId,
    );

    final finalizedMessage = AiMessage(
      id: resolvedId,
      text: _streamingBuffer.toString(),
      role: 'assistant',
      createdAt: existingIndex >= 0
          ? state.messages[existingIndex].createdAt
          : DateTime.now(),
      isStreaming: false,
      conversationStatus: 'active',
    );

    final updatedMessages = List<AiMessage>.from(state.messages);
    if (existingIndex >= 0) {
      updatedMessages[existingIndex] = finalizedMessage;
    } else {
      updatedMessages.insert(0, finalizedMessage);
    }

    state = state.copyWith(messages: updatedMessages);
    _updatePagingFromMessages();

    _streamingBuffer = null;
    _streamingMessageId = null;
  }

  void sendUserMessage({
    String? text,
    List<AiAttachment> attachments = const [],
    String? conversationType,
    String conversationStatus = 'active',
    bool insertLocally = true,
  }) {
    final session = state.session;
    if (session == null) return;

    final trimmed = text?.trim() ?? '';
    final hasContent = trimmed.isNotEmpty || attachments.isNotEmpty;
    final isEndingEvent = conversationStatus == 'ended';
    if (!hasContent && !isEndingEvent) {
      return;
    }

    final resolvedConversationType = conversationType ?? session.mode;

    final gateway = ref.read(AllProviders.realtimeGatewayProvider);
    final clientId = _uuid.v4();
    gateway.sendUserMessage(
      trimmed,
      clientMessageId: clientId,
      conversationType: resolvedConversationType,
      conversationStatus: conversationStatus,
      attachments: attachments
          .map((attachment) => attachment.toJson())
          .toList(),
    );

    if (isEndingEvent || !insertLocally) {
      return;
    }

    final now = DateTime.now();
    final message = AiMessage(
      id: now.millisecondsSinceEpoch,
      text: trimmed,
      role: 'user',
      createdAt: now,
      clientMessageId: clientId,
      isDelivered: false,
      attachments: attachments,
      conversationType: resolvedConversationType,
      conversationStatus: conversationStatus,
      metadata: {
        'conversationType': resolvedConversationType,
        'conversationStatus': conversationStatus,
      },
    );

    final updatedMessages = List<AiMessage>.from(state.messages)
      ..insert(0, message);
    state = state.copyWith(messages: updatedMessages);
    _updatePagingFromMessages();
  }

  void markConversationEnded({String? conversationType}) {
    sendUserMessage(
      conversationType: conversationType,
      conversationStatus: 'ended',
      insertLocally: false,
    );
  }

  void requestTts(int messageId) {
    final session = state.session;
    if (session == null) return;

    ref.read(AllProviders.realtimeGatewayProvider).requestTts(messageId);
  }

  void _handleAckEvent(String clientMessageId) {
    final index = state.messages.indexWhere(
      (message) => message.clientMessageId == clientMessageId,
    );
    if (index == -1) return;
    final updatedMessages = List<AiMessage>.from(state.messages);
    updatedMessages[index] = updatedMessages[index].copyWith(isDelivered: true);
    state = state.copyWith(messages: updatedMessages);
    _updatePagingFromMessages();
  }

  void _handleMemoryEvent(MemoryUpdateEvent event) {
    final updates = List<MemoryUpdateEvent>.from(state.memoryUpdates);
    updates.add(event);
    if (updates.length > 5) {
      updates.removeAt(0);
    }
    state = state.copyWith(memoryUpdates: updates);
  }

  void _handleConversationMarker(AiMessage message) {
    final activeSessionId = state.session?.id;
    final markerSessionId = message.metadata['sessionId']?.toString();
    if (activeSessionId != null &&
        markerSessionId != null &&
        markerSessionId != activeSessionId) {
      return;
    }

    final existingIndex = state.messages.indexWhere(
      (existing) => existing.id == message.id,
    );
    final updatedMessages = List<AiMessage>.from(state.messages);
    if (existingIndex >= 0) {
      updatedMessages[existingIndex] = message;
    } else {
      updatedMessages.insert(0, message);
    }

    state = state.copyWith(messages: updatedMessages);
    _updatePagingFromMessages();
  }
}
