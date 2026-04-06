enum CallType { video, voice }

enum CallState { idle, connecting, ringing, active, ended }

class CallSession {
  const CallSession({
    required this.sessionId,
    required this.characterId,
    required this.callType,
    this.state = CallState.idle,
    this.startedAt,
    this.duration = Duration.zero,
    this.isMicMuted = false,
    this.isSpeakerOn = true,
    this.selectedGender,
    this.selectedLanguage,
  });

  final String sessionId;
  final String characterId;
  final CallType callType;
  final CallState state;
  final DateTime? startedAt;
  final Duration duration;
  final bool isMicMuted;
  final bool isSpeakerOn;
  final String? selectedGender;
  final String? selectedLanguage;

  CallSession copyWith({
    String? sessionId,
    String? characterId,
    CallType? callType,
    CallState? state,
    DateTime? startedAt,
    Duration? duration,
    bool? isMicMuted,
    bool? isSpeakerOn,
    String? selectedGender,
    String? selectedLanguage,
  }) {
    return CallSession(
      sessionId: sessionId ?? this.sessionId,
      characterId: characterId ?? this.characterId,
      callType: callType ?? this.callType,
      state: state ?? this.state,
      startedAt: startedAt ?? this.startedAt,
      duration: duration ?? this.duration,
      isMicMuted: isMicMuted ?? this.isMicMuted,
      isSpeakerOn: isSpeakerOn ?? this.isSpeakerOn,
      selectedGender: selectedGender ?? this.selectedGender,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }
}
