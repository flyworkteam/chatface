import 'package:chatface/Models/persona_model.dart';

class HistoryItem {
  final PersonaProfile character;
  final String previewText;
  final String previewType;
  final DateTime updatedAt;
  final String sessionId;
  final String lastConversationType;
  final String sessionMode;
  final String sessionLanguage;

  const HistoryItem({
    required this.character,
    required this.previewText,
    required this.previewType,
    required this.updatedAt,
    required this.sessionId,
    required this.lastConversationType,
    required this.sessionMode,
    required this.sessionLanguage,
  });
}
