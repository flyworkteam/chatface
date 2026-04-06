import 'dart:async';

import 'package:chatface/Riverpod/Providers/all_providers.dart';
import 'package:chatface/Services/realtime_gateway.dart';
import 'package:chatface/Services/streaming_stt_service.dart';
import 'package:chatface/config/stt_config.dart';
import 'package:chatface/utils/print.dart';
import 'package:riverpod/riverpod.dart';

class SttState {
  const SttState({
    required this.isAvailable,
    required this.isListening,
    required this.streamStatus,
    required this.usingLocalFallback,
    this.lastPartial,
    this.serverPartial,
    this.confidence,
    this.error,
    this.debugStatus,
  });

  final bool isAvailable;
  final bool isListening;
  final StreamingSttStatus streamStatus;
  final bool usingLocalFallback;
  final String? lastPartial;
  final String? serverPartial;
  final double? confidence;
  final String? error;
  final String? debugStatus;

  SttState copyWith({
    bool? isAvailable,
    bool? isListening,
    StreamingSttStatus? streamStatus,
    bool? usingLocalFallback,
    String? lastPartial,
    String? serverPartial,
    double? confidence,
    String? error,
    String? debugStatus,
  }) {
    return SttState(
      isAvailable: isAvailable ?? this.isAvailable,
      isListening: isListening ?? this.isListening,
      streamStatus: streamStatus ?? this.streamStatus,
      usingLocalFallback: usingLocalFallback ?? this.usingLocalFallback,
      lastPartial: lastPartial,
      serverPartial: serverPartial ?? this.serverPartial,
      confidence: confidence ?? this.confidence,
      error: error,
      debugStatus: debugStatus ?? this.debugStatus,
    );
  }

  static const idle = SttState(
    isAvailable: false,
    isListening: false,
    streamStatus: StreamingSttStatus.idle,
    usingLocalFallback: false,
  );
}

final sttControllerProvider = NotifierProvider<SttController, SttState>(
  SttController.new,
);

class SttController extends Notifier<SttState> {
  SttController();
  RealtimeGatewayService get _gateway =>
      ref.read(AllProviders.realtimeGatewayProvider);
  StreamingSttService get _streamingService =>
      ref.read(AllProviders.streamingSttServiceProvider);

  StreamSubscription<StreamingSttStatus>? _streamStatusSub;
  StreamSubscription<SttStreamEvent>? _sttEventSub;

  @override
  SttState build() {
    _streamStatusSub ??= _streamingService.statuses.listen(
      _handleStreamingStatus,
    );
    _sttEventSub ??= _gateway.sttEvents.listen(_handleGatewayEvent);
    ref.onDispose(() {
      _streamStatusSub?.cancel();
      _sttEventSub?.cancel();
    });
    return SttState.idle;
  }

  Future<bool> startListening({String? localeId}) async {
    Print.info('STT controller start locale=$localeId', tag: 'STT-CTRL');
    if (state.isListening) {
      return true;
    }
    if (!SttConfig.streamingEnabled) {
      state = state.copyWith(
        isAvailable: false,
        isListening: false,
        usingLocalFallback: false,
        streamStatus: StreamingSttStatus.error,
        debugStatus: 'stream_disabled',
        error: 'Streaming STT disabled',
      );
      return false;
    }

    final started = await _streamingService.start();
    state = state.copyWith(
      isAvailable: started,
      isListening: started,
      usingLocalFallback: false,
      streamStatus: started
          ? StreamingSttStatus.starting
          : StreamingSttStatus.error,
      lastPartial: null,
      debugStatus: started ? 'stream_starting' : 'stream_failed',
      error: started ? null : 'Streaming STT unavailable',
    );
    return started;
  }

  Future<void> stopListening() async {
    Print.info('STT controller stop', tag: 'STT-CTRL');
    await _streamingService.stop();
    state = state.copyWith(
      isListening: false,
      lastPartial: null,
      serverPartial: null,
      usingLocalFallback: false,
      streamStatus: StreamingSttStatus.idle,
      debugStatus: 'stopped',
    );
  }

  /// Kept for API compatibility with call session controller.
  void resetRetryState() {
    // No-op: streaming path does not require retry state reset.
  }

  void _handleStreamingStatus(StreamingSttStatus status) {
    state = state.copyWith(
      streamStatus: status,
      debugStatus: 'stream_${status.name}',
    );

    if (status == StreamingSttStatus.streaming ||
        status == StreamingSttStatus.ready) {
      state = state.copyWith(
        isAvailable: true,
        isListening: true,
        usingLocalFallback: false,
      );
    }
  }

  void _handleGatewayEvent(SttStreamEvent event) {
    if (event is SttStreamPartialEvent) {
      state = state.copyWith(
        lastPartial: event.text,
        serverPartial: event.text,
        confidence: event.confidence,
        debugStatus: 'server_partial',
      );
    } else if (event is SttTranscriptEvent) {
      state = state.copyWith(
        lastPartial: null,
        serverPartial: null,
        debugStatus: 'server_final',
      );
    } else if (event is SttStreamErrorEvent) {
      state = state.copyWith(
        error: event.message,
        debugStatus: 'stream_error',
        usingLocalFallback: false,
      );
    } else if (event is SttStreamStoppedEvent) {
      state = state.copyWith(
        isListening: false,
        streamStatus: StreamingSttStatus.idle,
        lastPartial: null,
        serverPartial: null,
        debugStatus: 'stream_stopped',
      );
    } else if (event is SttStreamReadyEvent) {
      state = state.copyWith(debugStatus: 'stream_ready');
    }
  }
}
