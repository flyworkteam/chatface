import 'dart:async';

import 'package:chatface/Models/ai_session_model.dart';
import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Riverpod/Providers/all_providers.dart';
import 'package:riverpod/riverpod.dart';

final aiSessionProvider =
    AsyncNotifierProvider<AiSessionController, AiSession?>(
      AiSessionController.new,
    );

class AiSessionController extends AsyncNotifier<AiSession?> {
  @override
  FutureOr<AiSession?> build() => null;

  Future<AiSession?> startSession({
    required PersonaProfile persona,
    String? language,
    String mode = 'chat',
  }) async {
    state = const AsyncValue.loading();
    try {
      final repo = ref.read(AllProviders.aiRepositoryProvider);
      final session = await repo.createSession(
        personaId: persona.id,
        language: language ?? persona.defaultLanguage,
        mode: mode,
      );
      final sessionWithPersona = AiSession(
        id: session.id,
        personaId: session.personaId,
        languageCode: session.languageCode,
        mode: session.mode,
        persona: persona,
      );

      final storage = ref.read(AllProviders.secureStorageServiceProvider);
      await storage.saveActivePersonaId(persona.id);
      await storage.saveActiveSessionId(session.id);
      state = AsyncValue.data(sessionWithPersona);
      return sessionWithPersona;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  void updateLanguage(String languageCode) {
    final current = state.value;
    if (current == null) {
      return;
    }

    state = AsyncValue.data(
      AiSession(
        id: current.id,
        personaId: current.personaId,
        languageCode: languageCode,
        mode: current.mode,
        persona: current.persona,
        resumeToken: current.resumeToken,
      ),
    );
  }

  void setSession(AiSession session) {
    state = AsyncValue.data(session);
  }

  void clearSession() {
    state = const AsyncValue.data(null);
  }
}
