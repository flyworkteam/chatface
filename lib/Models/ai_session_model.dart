import 'package:chatface/Models/persona_model.dart';

class AiSession {
  const AiSession({
    required this.id,
    required this.personaId,
    required this.languageCode,
    required this.mode,
    this.persona,
    this.resumeToken,
  });

  final String id;
  final String personaId;
  final String languageCode;
  final String mode;
  final PersonaProfile? persona;
  final String? resumeToken;

  factory AiSession.fromJson(
    Map<String, dynamic> json, {
    PersonaProfile? persona,
  }) {
    return AiSession(
      id: json['sessionId']?.toString() ?? json['id'].toString(),
      personaId: json['personaId']?.toString() ?? json['persona_id'].toString(),
      languageCode:
          json['language'] as String? ??
          json['language_code'] as String? ??
          'en',
      mode: json['mode'] as String? ?? 'chat',
      persona: persona,
      resumeToken: json['resumeToken'] as String?,
    );
  }
}
