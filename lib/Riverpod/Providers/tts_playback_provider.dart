import 'dart:async';

import 'package:chatface/Models/ai_message_model.dart';
import 'package:chatface/Riverpod/Providers/all_providers.dart';
import 'package:chatface/Services/tts_playback_service.dart';
import 'package:riverpod/riverpod.dart';

final ttsPlaybackProvider =
    NotifierProvider.autoDispose<TtsPlaybackNotifier, TtsPlaybackState>(
      TtsPlaybackNotifier.new,
    );

class TtsPlaybackState {
  const TtsPlaybackState({
    this.active = const {},
    this.activeSequences = const {},
    this.avatarSpeech = const AvatarSpeechState(),
    this.lastPlaybackEndedAt,
  });

  final Map<int, TtsPlaybackInfo> active;
  final Set<String> activeSequences;
  final AvatarSpeechState avatarSpeech;
  final DateTime? lastPlaybackEndedAt;

  bool isPlaying(int messageId) => active.containsKey(messageId);
  bool get hasActivePlayback =>
      active.isNotEmpty || activeSequences.isNotEmpty || avatarSpeech.isTalking;

  TtsPlaybackState copyWith({
    Map<int, TtsPlaybackInfo>? active,
    Set<String>? activeSequences,
    AvatarSpeechState? avatarSpeech,
    DateTime? lastPlaybackEndedAt,
    bool clearLastPlaybackEndedAt = false,
  }) {
    return TtsPlaybackState(
      active: active ?? this.active,
      activeSequences: activeSequences ?? this.activeSequences,
      avatarSpeech: avatarSpeech ?? this.avatarSpeech,
      lastPlaybackEndedAt: clearLastPlaybackEndedAt
          ? null
          : lastPlaybackEndedAt ?? this.lastPlaybackEndedAt,
    );
  }
}

class AvatarSpeechState {
  const AvatarSpeechState({
    this.isTalking = false,
    this.visemeId = 0,
    this.durationMs = 200,
    this.playbackId,
    this.sequence,
  });

  final bool isTalking;
  final double visemeId;
  final double durationMs;
  final String? playbackId;
  final String? sequence;

  AvatarSpeechState copyWith({
    bool? isTalking,
    double? visemeId,
    double? durationMs,
    String? playbackId,
    String? sequence,
    bool clearIdentity = false,
  }) {
    return AvatarSpeechState(
      isTalking: isTalking ?? this.isTalking,
      visemeId: visemeId ?? this.visemeId,
      durationMs: durationMs ?? this.durationMs,
      playbackId: clearIdentity ? null : playbackId ?? this.playbackId,
      sequence: clearIdentity ? null : sequence ?? this.sequence,
    );
  }
}

class TtsPlaybackInfo {
  const TtsPlaybackInfo({
    required this.playbackId,
    required this.sequence,
    required this.startedAt,
  });

  final String playbackId;
  final String sequence;
  final DateTime startedAt;
}

class TtsPlaybackNotifier extends Notifier<TtsPlaybackState> {
  TtsPlaybackNotifier();

  late final TtsPlaybackService _service = ref.read(
    AllProviders.ttsPlaybackServiceProvider,
  );
  StreamSubscription<String>? _subscription;
  StreamSubscription<TtsPlaybackVisualState>? _visualSubscription;

  @override
  TtsPlaybackState build() {
    _subscription = _service.completedPlayback.listen(_handleCompletion);
    _visualSubscription = _service.visualStates.listen(_handleVisualState);
    ref.onDispose(() {
      _subscription?.cancel();
      _visualSubscription?.cancel();
    });
    return const TtsPlaybackState();
  }

  Future<void> handleEvent(TtsEvent event) async {
    switch (event.type) {
      case 'tts_started':
        final updatedSequences = Set<String>.from(state.activeSequences)
          ..add(event.sequence);
        state = state.copyWith(
          activeSequences: updatedSequences,
          clearLastPlaybackEndedAt: true,
        );
        break;
      case 'tts_chunk':
        if (event.audioBase64 != null || event.audioUrl != null) {
          final playbackKey =
              event.playbackId ?? event.messageId?.toString() ?? event.sequence;
          final updatedSequences = Set<String>.from(state.activeSequences)
            ..add(event.sequence);
          await _service.playChunk(
            messageId: event.messageId?.toString() ?? playbackKey,
            sequence: event.sequence,
            audioBase64: event.audioBase64,
            audioUrl: event.audioUrl,
            mouthCues: event.mouthCues,
            offsetMs: event.offsetMs,
            playbackId: event.playbackId,
          );
          final updated = Map<int, TtsPlaybackInfo>.from(state.active);
          if (event.messageId != null) {
            updated[event.messageId!] = TtsPlaybackInfo(
              playbackId: playbackKey,
              sequence: event.sequence,
              startedAt: DateTime.now(),
            );
          }
          state = state.copyWith(
            active: updated,
            activeSequences: updatedSequences,
            clearLastPlaybackEndedAt: true,
          );
        }
        break;
      case 'tts_done':
        // tts_done means backend finished streaming chunks, not that local
        // playback should be interrupted immediately.
        break;
      case 'tts_suppressed':
        await _service.stop(playbackId: event.playbackId);
        _removeEntry(event.messageId, sequence: event.sequence);
        break;
    }
  }

  void _handleCompletion(String sequence) {
    final updated = Map<int, TtsPlaybackInfo>.from(state.active)
      ..removeWhere((_, info) => info.sequence == sequence);
    final updatedSequences = Set<String>.from(state.activeSequences)
      ..remove(sequence);
    final shouldResetSpeech = state.avatarSpeech.sequence == sequence;
    if (updated.length != state.active.length ||
        updatedSequences.length != state.activeSequences.length ||
        shouldResetSpeech) {
      state = state.copyWith(
        active: updated,
        activeSequences: updatedSequences,
        lastPlaybackEndedAt: DateTime.now(),
        avatarSpeech: shouldResetSpeech
            ? const AvatarSpeechState()
            : state.avatarSpeech,
      );
    }
  }

  void _removeEntry(int? messageId, {String? sequence}) {
    var activeChanged = false;
    Map<int, TtsPlaybackInfo>? updatedActive;
    if (messageId != null && state.active.containsKey(messageId)) {
      updatedActive = Map<int, TtsPlaybackInfo>.from(state.active)
        ..remove(messageId);
      activeChanged = true;
    }

    var sequencesChanged = false;
    Set<String>? updatedSequences;
    if (sequence != null && state.activeSequences.contains(sequence)) {
      updatedSequences = Set<String>.from(state.activeSequences)
        ..remove(sequence);
      sequencesChanged = true;
    }

    if (!activeChanged && !sequencesChanged) {
      return;
    }

    final nextActive = updatedActive ?? state.active;
    final nextSequences = updatedSequences ?? state.activeSequences;
    final didPlaybackEnd =
        nextActive.isEmpty &&
        nextSequences.isEmpty &&
        !state.avatarSpeech.isTalking;

    state = state.copyWith(
      active: updatedActive,
      activeSequences: updatedSequences,
      lastPlaybackEndedAt: didPlaybackEnd ? DateTime.now() : null,
    );
  }

  void _handleVisualState(TtsPlaybackVisualState visualState) {
    state = state.copyWith(
      avatarSpeech: AvatarSpeechState(
        isTalking: visualState.isTalking,
        visemeId: visualState.visemeId,
        durationMs: visualState.durationMs,
        playbackId: visualState.playbackId,
        sequence: visualState.sequence,
      ),
    );
  }
}
