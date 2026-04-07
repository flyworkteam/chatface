import 'package:chatface/Models/call_session_model.dart';
import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Riverpod/Providers/ai_session_provider.dart';
import 'package:chatface/Riverpod/Providers/all_providers.dart';
import 'package:chatface/Riverpod/Providers/chat_controller_provider.dart';
import 'package:chatface/Riverpod/Providers/stt_controller_provider.dart';
import 'package:chatface/Services/tts_playback_service.dart';
import 'package:riverpod/riverpod.dart';

final callSessionControllerProvider =
    NotifierProvider<CallSessionController, CallSession?>(
      CallSessionController.new,
    );

class CallSessionController extends Notifier<CallSession?> {
  CallSessionController();

  static const Set<String> _supportedConversationLanguages = {
    'en',
    'zh',
    'de',
    'it',
    'fr',
    'ja',
    'es',
    'ru',
    'tr',
    'ko',
    'hi',
    'pt',
  };

  TtsPlaybackService get _ttsService =>
      ref.read(AllProviders.ttsPlaybackServiceProvider);

  @override
  CallSession? build() => null;

  String? _normalizeConversationLanguage(String? value) {
    final normalized = value?.trim().toLowerCase();
    if (normalized == null || normalized.isEmpty) {
      return null;
    }

    final aliased = switch (normalized) {
      'ch' || 'cn' => 'zh',
      'jp' => 'ja',
      'kr' => 'ko',
      'br' => 'pt',
      _ => normalized,
    };

    return _supportedConversationLanguages.contains(aliased) ? aliased : null;
  }

  Future<String> _resolveInitialCallLanguage(PersonaProfile persona) async {
    final storedLanguage = _normalizeConversationLanguage(
      await ref.read(AllProviders.secureStorageServiceProvider).getLanguage(),
    );
    if (storedLanguage != null) {
      return storedLanguage;
    }

    final explicitLanguage = _normalizeConversationLanguage(
      persona.selectedLanguage,
    );
    if (explicitLanguage != null) {
      return explicitLanguage;
    }

    return _normalizeConversationLanguage(persona.defaultLanguage) ?? 'en';
  }

  Future<CallSession?> startCall({
    required PersonaProfile persona,
    required CallType callType,
  }) async {
    await endCall(markEnded: false);
    await _ttsService.setOutputEnabled(true);

    final mode = callType == CallType.video ? 'video_call' : 'voice_call';
    final selectedLanguage = await _resolveInitialCallLanguage(persona);
    await ref
        .read(AllProviders.secureStorageServiceProvider)
        .saveLanguage(selectedLanguage);

    final session = await ref
        .read(aiSessionProvider.notifier)
        .startSession(persona: persona, language: selectedLanguage, mode: mode);
    if (session == null) {
      return null;
    }

    await ref.read(chatControllerProvider.notifier).attachSession(
          session,
          persona: persona.copyWith(selectedLanguage: selectedLanguage),
        );

    final sttStarted = await ref
        .read(sttControllerProvider.notifier)
        .startListening(localeId: selectedLanguage);

    if (!sttStarted) {
      await ref.read(sttControllerProvider.notifier).stopListening();
      return null;
    }

    final call = CallSession(
      sessionId: session.id,
      characterId: persona.id,
      callType: callType,
      state: CallState.active,
      startedAt: DateTime.now(),
      selectedGender: persona.gender ?? 'unknown',
      selectedLanguage: selectedLanguage,
    );

    state = call;
    return call;
  }

  Future<void> setMicMuted(bool muted) async {
    final current = state;
    if (current == null || current.isMicMuted == muted) {
      return;
    }

    final stt = ref.read(sttControllerProvider.notifier);
    if (muted) {
      await stt.stopListening();
    } else {
      final language = current.selectedLanguage ?? 'en';
      await stt.startListening(localeId: language);
    }

    state = current.copyWith(isMicMuted: muted);
  }

  Future<void> toggleMicMuted() async {
    final current = state;
    if (current == null) return;
    await setMicMuted(!current.isMicMuted);
  }

  Future<void> setSpeakerOn(bool enabled) async {
    final current = state;
    if (current == null || current.isSpeakerOn == enabled) {
      return;
    }

    await _ttsService.setOutputEnabled(enabled);
    state = current.copyWith(isSpeakerOn: enabled);
  }

  Future<void> toggleSpeaker() async {
    final current = state;
    if (current == null) return;
    await setSpeakerOn(!current.isSpeakerOn);
  }

  Future<void> changeLanguage(String languageCode) async {
    if (state == null) return;
    final normalizedLanguage =
        _normalizeConversationLanguage(languageCode) ?? 'en';
    if (state!.selectedLanguage == normalizedLanguage) {
      return;
    }

    await ref
        .read(AllProviders.secureStorageServiceProvider)
        .saveLanguage(normalizedLanguage);

    await ref
        .read(AllProviders.aiRepositoryProvider)
        .updateSessionLanguage(
          sessionId: state!.sessionId,
          languageCode: normalizedLanguage,
        );

    ref
        .read(AllProviders.realtimeGatewayProvider)
        .sendUpdateLanguage(normalizedLanguage);

    // Stop current STT, reset failure counters, then wait for
    // the engine to fully tear down before restarting.
    final stt = ref.read(sttControllerProvider.notifier);
    await stt.stopListening();
    stt.resetRetryState();

    // Give the STT engine time to release resources
    await Future<void>.delayed(const Duration(milliseconds: 600));

    await stt.startListening(localeId: normalizedLanguage);

    ref.read(aiSessionProvider.notifier).updateLanguage(normalizedLanguage);
    state = state!.copyWith(selectedLanguage: normalizedLanguage);
  }

  Future<void> endCall({bool markEnded = true}) async {
    await ref.read(sttControllerProvider.notifier).stopListening();
    await _ttsService.stop();
    await _ttsService.setOutputEnabled(true);
    if (state == null) {
      return;
    }
    if (markEnded) {
      final conversationType = state!.callType == CallType.video
          ? 'video_call'
          : 'voice_call';
      ref
          .read(chatControllerProvider.notifier)
          .markConversationEnded(conversationType: conversationType);
    }
    state = markEnded ? state!.copyWith(state: CallState.ended) : null;
  }
}
