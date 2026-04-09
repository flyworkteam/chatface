import 'package:chatface/Models/call_session_model.dart';
import 'package:chatface/Models/persona_model.dart';

enum VideoSwipeDirection { left, right }

const double kVideoSwipeCommitThresholdFraction = 0.24;
const double kVideoSwipeVelocityThreshold = 250;

class VideoViewLocalState {
  const VideoViewLocalState({
    required this.callState,
    required this.currentCharacter,
  });

  final CallState callState;
  final PersonaProfile? currentCharacter;
}

class VideoSwipeNeighbors {
  const VideoSwipeNeighbors({required this.previous, required this.next});

  final PersonaProfile? previous;
  final PersonaProfile? next;
}

bool shouldAutoLaunchInitialCharacter({
  required PersonaProfile? initialCharacter,
  required CallSession? callSession,
  required String? lastAutoLaunchedInitialCharacterId,
}) {
  if (initialCharacter == null) {
    return false;
  }

  if (lastAutoLaunchedInitialCharacterId == initialCharacter.id) {
    return false;
  }

  if (callSession == null || callSession.state == CallState.ended) {
    return true;
  }

  return callSession.characterId != initialCharacter.id;
}

VideoViewLocalState syncVideoViewFromSession({
  required CallSession? callSession,
  required PersonaProfile? resolvedCharacter,
  required CallState currentCallState,
  required PersonaProfile? currentCharacter,
}) {
  if (callSession == null) {
    return VideoViewLocalState(
      callState: currentCallState,
      currentCharacter: currentCharacter,
    );
  }

  if (callSession.state == CallState.ended) {
    return const VideoViewLocalState(
      callState: CallState.ended,
      currentCharacter: null,
    );
  }

  return VideoViewLocalState(
    callState: CallState.active,
    currentCharacter: resolvedCharacter ?? currentCharacter,
  );
}

VideoViewLocalState resolveVideoStartResult({
  required PersonaProfile requestedCharacter,
  required CallSession? session,
}) {
  if (session == null) {
    return const VideoViewLocalState(
      callState: CallState.idle,
      currentCharacter: null,
    );
  }

  return VideoViewLocalState(
    callState: CallState.active,
    currentCharacter: requestedCharacter,
  );
}

PersonaProfile? resolveAdjacentCharacter({
  required List<PersonaProfile> characters,
  required PersonaProfile? currentCharacter,
  required bool forward,
}) {
  if (characters.isEmpty) {
    return null;
  }

  if (characters.length == 1) {
    return currentCharacter?.id == characters.first.id
        ? null
        : characters.first;
  }

  final currentIndex = currentCharacter == null
      ? -1
      : characters.indexWhere(
          (character) => character.id == currentCharacter.id,
        );
  final baseIndex = currentIndex >= 0 ? currentIndex : 0;
  final targetIndex = forward
      ? (baseIndex + 1) % characters.length
      : (baseIndex - 1 + characters.length) % characters.length;
  final target = characters[targetIndex];

  if (target.id == currentCharacter?.id) {
    return null;
  }

  return target;
}

VideoSwipeNeighbors resolveSwipeNeighbors({
  required List<PersonaProfile> characters,
  required PersonaProfile? currentCharacter,
}) {
  return VideoSwipeNeighbors(
    previous: resolveAdjacentCharacter(
      characters: characters,
      currentCharacter: currentCharacter,
      forward: false,
    ),
    next: resolveAdjacentCharacter(
      characters: characters,
      currentCharacter: currentCharacter,
      forward: true,
    ),
  );
}

bool shouldCommitCharacterSwipe({
  required double dragOffset,
  required double viewportWidth,
  required double primaryVelocity,
  double distanceThresholdFraction = kVideoSwipeCommitThresholdFraction,
  double velocityThreshold = kVideoSwipeVelocityThreshold,
}) {
  final resolvedWidth = viewportWidth <= 0 ? 1.0 : viewportWidth;
  final distanceThreshold = resolvedWidth * distanceThresholdFraction;
  return dragOffset.abs() >= distanceThreshold ||
      primaryVelocity.abs() >= velocityThreshold;
}

PersonaProfile? selectNextCharacterForNewChat({
  required List<PersonaProfile> characters,
  required PersonaProfile? initialCharacter,
  required PersonaProfile? currentCharacter,
  required CallSession? callSession,
  required String? lastAutoLaunchedInitialCharacterId,
}) {
  if (characters.isEmpty) {
    return null;
  }

  final anchorIds = <String>[
    if (initialCharacter != null &&
        initialCharacter.id != lastAutoLaunchedInitialCharacterId)
      initialCharacter.id,
    if (currentCharacter != null) currentCharacter.id,
    if (callSession != null) callSession.characterId,
  ];

  String? anchorId;
  for (final candidateId in anchorIds) {
    final exists = characters.any((character) => character.id == candidateId);
    if (exists) {
      anchorId = candidateId;
      break;
    }
  }

  if (anchorId == null) {
    return characters.first;
  }

  final anchorIndex = characters.indexWhere(
    (character) => character.id == anchorId,
  );
  if (anchorIndex < 0) {
    return characters.first;
  }

  final nextIndex = (anchorIndex + 1) % characters.length;
  return characters[nextIndex];
}
