import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:chatface/Models/ai_session_model.dart';
import 'package:chatface/Models/call_session_model.dart';
import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Riverpod/Providers/ai_session_provider.dart';
import 'package:chatface/Riverpod/Providers/all_providers.dart';
import 'package:chatface/Riverpod/Providers/call_session_controller_provider.dart';
import 'package:chatface/Riverpod/Providers/chat_controller_provider.dart';
import 'package:chatface/Riverpod/Providers/stt_controller_provider.dart';
import 'package:chatface/Services/call_audio_route_service.dart';
import 'package:chatface/Services/call_proximity_guard_service.dart';
import 'package:chatface/Services/secure_storage_service.dart';
import 'package:chatface/Services/tts_playback_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod/riverpod.dart';

void main() {
  group('CallSessionController', () {
    test('startCall(callType: voice) configures earpiece route', () async {
      final deps = _createTestDeps();
      addTearDown(deps.container.dispose);

      final notifier = deps.container.read(
        callSessionControllerProvider.notifier,
      );
      final session = await notifier.startCall(
        persona: _persona(),
        callType: CallType.voice,
      );

      expect(session, isNotNull);
      expect(session!.callType, CallType.voice);
      expect(session.isSpeakerOn, isFalse);
      expect(deps.route.configureVoiceCallCalls, 1);
      expect(deps.route.speakerStates, [false]);
      expect(deps.proximity.voiceCallStates, [
        (active: true, speakerOn: false),
      ]);
    });

    test('startCall(callType: video) does not configure call route', () async {
      final deps = _createTestDeps();
      addTearDown(deps.container.dispose);

      final notifier = deps.container.read(
        callSessionControllerProvider.notifier,
      );
      final session = await notifier.startCall(
        persona: _persona(),
        callType: CallType.video,
      );

      expect(session, isNotNull);
      expect(session!.callType, CallType.video);
      expect(session.isSpeakerOn, isTrue);
      expect(deps.route.configureVoiceCallCalls, 0);
      expect(deps.route.speakerStates, isEmpty);
      expect(deps.proximity.voiceCallStates, isEmpty);
    });

    test(
      'toggleSpeaker() uses call route service only for voice calls',
      () async {
        final deps = _createTestDeps();
        addTearDown(deps.container.dispose);

        final notifier = deps.container.read(
          callSessionControllerProvider.notifier,
        );
        notifier.state = const CallSession(
          sessionId: 'session-1',
          characterId: 'persona-1',
          callType: CallType.voice,
          isSpeakerOn: false,
        );

        await notifier.toggleSpeaker();

        expect(deps.route.speakerStates, [true]);
        expect(deps.tts.lastOutputEnabled, isNull);
        expect(deps.proximity.voiceCallStates, [
          (active: true, speakerOn: true),
        ]);
        expect(
          deps.container.read(callSessionControllerProvider)?.isSpeakerOn,
          isTrue,
        );
      },
    );

    test('toggleSpeaker() keeps video call on existing TTS path', () async {
      final deps = _createTestDeps();
      addTearDown(deps.container.dispose);

      final notifier = deps.container.read(
        callSessionControllerProvider.notifier,
      );
      notifier.state = const CallSession(
        sessionId: 'session-1',
        characterId: 'persona-1',
        callType: CallType.video,
        isSpeakerOn: true,
      );

      await notifier.toggleSpeaker();

      expect(deps.route.speakerStates, isEmpty);
      expect(deps.tts.lastOutputEnabled, isFalse);
      expect(
        deps.container.read(callSessionControllerProvider)?.isSpeakerOn,
        isFalse,
      );
    });

    test('endCall() resets audio route only for voice calls', () async {
      final voiceDeps = _createTestDeps();
      addTearDown(voiceDeps.container.dispose);
      final voiceNotifier = voiceDeps.container.read(
        callSessionControllerProvider.notifier,
      );
      voiceNotifier.state = const CallSession(
        sessionId: 'session-1',
        characterId: 'persona-1',
        callType: CallType.voice,
      );

      await voiceNotifier.endCall();

      expect(voiceDeps.route.resetCalls, 1);
      expect(voiceDeps.proximity.voiceCallStates, [
        (active: false, speakerOn: false),
      ]);

      final videoDeps = _createTestDeps();
      addTearDown(videoDeps.container.dispose);
      final videoNotifier = videoDeps.container.read(
        callSessionControllerProvider.notifier,
      );
      videoNotifier.state = const CallSession(
        sessionId: 'session-2',
        characterId: 'persona-2',
        callType: CallType.video,
      );

      await videoNotifier.endCall();

      expect(videoDeps.route.resetCalls, 0);
      expect(videoDeps.proximity.voiceCallStates, isEmpty);
    });
  });
}

PersonaProfile _persona() => PersonaProfile.fallback(
  id: 'persona-1',
  name: 'Emma',
  defaultLanguage: 'en',
);

_TestDeps _createTestDeps() {
  final tts = FakeTtsPlaybackService();
  final route = FakeCallAudioRouteService(tts);
  final aiSession = FakeAiSessionController();
  final chat = FakeChatController();
  final stt = FakeSttController();
  final storage = FakeSecureStorageService();
  final proximity = FakeCallProximityGuardService();

  final container = ProviderContainer(
    overrides: [
      AllProviders.ttsPlaybackServiceProvider.overrideWith((ref) => tts),
      AllProviders.callAudioRouteServiceProvider.overrideWith((ref) => route),
      AllProviders.callProximityGuardServiceProvider.overrideWith(
        (ref) => proximity,
      ),
      AllProviders.secureStorageServiceProvider.overrideWith((ref) => storage),
      aiSessionProvider.overrideWith(() => aiSession),
      chatControllerProvider.overrideWith(() => chat),
      sttControllerProvider.overrideWith(() => stt),
    ],
  );

  return _TestDeps(
    container: container,
    tts: tts,
    route: route,
    aiSession: aiSession,
    chat: chat,
    stt: stt,
    storage: storage,
    proximity: proximity,
  );
}

class _TestDeps {
  const _TestDeps({
    required this.container,
    required this.tts,
    required this.route,
    required this.aiSession,
    required this.chat,
    required this.stt,
    required this.storage,
    required this.proximity,
  });

  final ProviderContainer container;
  final FakeTtsPlaybackService tts;
  final FakeCallAudioRouteService route;
  final FakeAiSessionController aiSession;
  final FakeChatController chat;
  final FakeSttController stt;
  final FakeSecureStorageService storage;
  final FakeCallProximityGuardService proximity;
}

class FakeTtsPlaybackService extends TtsPlaybackService {
  FakeTtsPlaybackService() : super.test();

  bool? lastOutputEnabled;
  int stopCalls = 0;
  final List<AudioContext> audioContexts = [];

  @override
  Future<void> setAudioContext(AudioContext context) async {
    audioContexts.add(context);
  }

  @override
  Future<void> setOutputEnabled(bool enabled) async {
    lastOutputEnabled = enabled;
  }

  @override
  Future<void> stop({String? playbackId}) async {
    stopCalls += 1;
  }
}

class FakeCallAudioRouteService extends CallAudioRouteService {
  FakeCallAudioRouteService(super.tts);

  int configureVoiceCallCalls = 0;
  int resetCalls = 0;
  final List<bool> speakerStates = [];

  @override
  Future<void> configureVoiceCall({bool speakerOn = false}) async {
    configureVoiceCallCalls += 1;
    speakerStates.add(speakerOn);
  }

  @override
  Future<void> reset() async {
    resetCalls += 1;
  }

  @override
  Future<void> setSpeakerOn(bool enabled) async {
    speakerStates.add(enabled);
  }
}

class FakeCallProximityGuardService extends CallProximityGuardService {
  FakeCallProximityGuardService() : super(observeLifecycle: false);

  final List<({bool active, bool speakerOn})> voiceCallStates = [];
  bool _isVoiceCallActive = false;

  @override
  bool get isVoiceCallActive => _isVoiceCallActive;

  @override
  Future<void> setVoiceCallState({
    required bool active,
    required bool speakerOn,
  }) async {
    _isVoiceCallActive = active;
    voiceCallStates.add((active: active, speakerOn: speakerOn));
  }
}

class FakeSecureStorageService extends SecureStorageService {
  String? _language;

  @override
  Future<String?> getLanguage() async => _language;

  @override
  Future<void> saveLanguage(String languageCode) async {
    _language = languageCode;
  }
}

class FakeAiSessionController extends AiSessionController {
  int startSessionCalls = 0;

  @override
  FutureOr<AiSession?> build() => null;

  @override
  Future<AiSession?> startSession({
    required PersonaProfile persona,
    String? language,
    String mode = 'chat',
  }) async {
    startSessionCalls += 1;
    final session = AiSession(
      id: 'session-${persona.id}',
      personaId: persona.id,
      languageCode: language ?? persona.defaultLanguage,
      mode: mode,
      persona: persona,
    );
    state = AsyncValue.data(session);
    return session;
  }
}

class FakeChatController extends ChatController {
  int attachSessionCalls = 0;
  int markConversationEndedCalls = 0;
  String? lastConversationType;

  @override
  ChatState build() => ChatState.initial();

  @override
  Future<void> attachSession(
    AiSession session, {
    PersonaProfile? persona,
  }) async {
    attachSessionCalls += 1;
    state = state.copyWith(
      session: session,
      persona: persona,
      isConnected: true,
    );
  }

  @override
  void markConversationEnded({String? conversationType}) {
    markConversationEndedCalls += 1;
    lastConversationType = conversationType;
  }
}

class FakeSttController extends SttController {
  int startListeningCalls = 0;
  int stopListeningCalls = 0;
  String? lastLocaleId;

  @override
  SttState build() => SttState.idle;

  @override
  Future<bool> startListening({String? localeId}) async {
    startListeningCalls += 1;
    lastLocaleId = localeId;
    state = state.copyWith(isListening: true);
    return true;
  }

  @override
  Future<void> stopListening() async {
    stopListeningCalls += 1;
    state = state.copyWith(isListening: false);
  }
}
