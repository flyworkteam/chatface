import 'package:chatface/Models/call_session_model.dart';
import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Views/VideoView/video_view_logic.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VideoView logic', () {
    test(
      'should auto-launch a requested persona when the current session is ended',
      () {
        final shouldLaunch = shouldAutoLaunchInitialCharacter(
          initialCharacter: _persona('persona-b'),
          callSession: const CallSession(
            sessionId: 'session-a',
            characterId: 'persona-a',
            callType: CallType.video,
            state: CallState.ended,
          ),
          lastAutoLaunchedInitialCharacterId: null,
        );

        expect(shouldLaunch, isTrue);
      },
    );

    test(
      'sync keeps ended state without hydrating a stale ended-session character',
      () {
        final syncedState = syncVideoViewFromSession(
          callSession: const CallSession(
            sessionId: 'session-a',
            characterId: 'persona-a',
            callType: CallType.video,
            state: CallState.ended,
          ),
          resolvedCharacter: _persona('persona-a'),
          currentCallState: CallState.idle,
          currentCharacter: _persona('persona-b'),
        );

        expect(syncedState.callState, CallState.ended);
        expect(syncedState.currentCharacter, isNull);
      },
    );

    test(
      'selects the next persona after the last selected ended-session persona',
      () {
        final personas = [
          _persona('persona-a'),
          _persona('persona-b'),
          _persona('persona-c'),
        ];

        final target = selectNextCharacterForNewChat(
          characters: personas,
          initialCharacter: _persona('persona-a'),
          currentCharacter: null,
          callSession: const CallSession(
            sessionId: 'session-b',
            characterId: 'persona-b',
            callType: CallType.video,
            state: CallState.ended,
          ),
          lastAutoLaunchedInitialCharacterId: 'persona-a',
        );

        expect(target?.id, 'persona-c');
      },
    );

    test(
      'falls back to the first filtered persona when the anchor is missing',
      () {
        final personas = [_persona('persona-a'), _persona('persona-c')];

        final target = selectNextCharacterForNewChat(
          characters: personas,
          initialCharacter: _persona('persona-a'),
          currentCharacter: null,
          callSession: const CallSession(
            sessionId: 'session-b',
            characterId: 'persona-b',
            callType: CallType.video,
            state: CallState.ended,
          ),
          lastAutoLaunchedInitialCharacterId: 'persona-a',
        );

        expect(target?.id, 'persona-a');
      },
    );

    test(
      'failed start falls back to idle and clears the temporary character',
      () {
        final startResult = resolveVideoStartResult(
          requestedCharacter: _persona('persona-b'),
          session: null,
        );

        expect(startResult.callState, CallState.idle);
        expect(startResult.currentCharacter, isNull);
      },
    );

    test('resolves the next adjacent persona with wraparound', () {
      final personas = [
        _persona('persona-a'),
        _persona('persona-b'),
        _persona('persona-c'),
      ];

      final target = resolveAdjacentCharacter(
        characters: personas,
        currentCharacter: _persona('persona-c'),
        forward: true,
      );

      expect(target?.id, 'persona-a');
    });

    test('resolves the previous adjacent persona with wraparound', () {
      final personas = [
        _persona('persona-a'),
        _persona('persona-b'),
        _persona('persona-c'),
      ];

      final target = resolveAdjacentCharacter(
        characters: personas,
        currentCharacter: _persona('persona-a'),
        forward: false,
      );

      expect(target?.id, 'persona-c');
    });

    test('does not resolve a swipe target when only one persona exists', () {
      final target = resolveAdjacentCharacter(
        characters: [_persona('persona-a')],
        currentCharacter: _persona('persona-a'),
        forward: true,
      );

      expect(target, isNull);
    });

    test('resolves both swipe neighbors with wraparound', () {
      final personas = [
        _persona('persona-a'),
        _persona('persona-b'),
        _persona('persona-c'),
      ];

      final neighbors = resolveSwipeNeighbors(
        characters: personas,
        currentCharacter: _persona('persona-a'),
      );

      expect(neighbors.previous?.id, 'persona-c');
      expect(neighbors.next?.id, 'persona-b');
    });

    test('returns null neighbors when there is only one persona', () {
      final neighbors = resolveSwipeNeighbors(
        characters: [_persona('persona-a')],
        currentCharacter: _persona('persona-a'),
      );

      expect(neighbors.previous, isNull);
      expect(neighbors.next, isNull);
    });

    test('does not commit a short slow swipe', () {
      final shouldCommit = shouldCommitCharacterSwipe(
        dragOffset: 40,
        viewportWidth: 320,
        primaryVelocity: 120,
      );

      expect(shouldCommit, isFalse);
    });

    test('commits a swipe that crosses the distance threshold', () {
      final shouldCommit = shouldCommitCharacterSwipe(
        dragOffset: 110,
        viewportWidth: 320,
        primaryVelocity: 120,
      );

      expect(shouldCommit, isTrue);
    });

    test('commits a fast swipe even if the distance is short', () {
      final shouldCommit = shouldCommitCharacterSwipe(
        dragOffset: 25,
        viewportWidth: 320,
        primaryVelocity: 420,
      );

      expect(shouldCommit, isTrue);
    });
  });
}

PersonaProfile _persona(String id) =>
    PersonaProfile.fallback(id: id, name: id, defaultLanguage: 'en');
