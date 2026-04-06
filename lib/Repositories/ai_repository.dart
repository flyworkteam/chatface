import 'package:chatface/Models/ai_message_model.dart';
import 'package:chatface/Models/ai_session_model.dart';
import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Riverpod/Providers/all_providers.dart';
import 'package:chatface/Services/dio_service.dart';
import 'package:chatface/utils/print.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AiRepository {
  AiRepository(this.ref);

  final Ref ref;

  DioService get _dio => ref.read(AllProviders.dioServiceProvider);

  Future<List<PersonaProfile>> fetchPersonas({
    String? gender,
    bool followedOnly = false,
  }) async {
    final normalizedGender = gender?.trim().toLowerCase();
    final response = await _dio.get(
      'ai/personas',
      queryParameters: {
        if (normalizedGender != null && normalizedGender.isNotEmpty)
          'gender': normalizedGender,
        if (followedOnly) 'followedOnly': true,
      },
    );
    final List personasJson = response.data['data'] as List? ?? [];
    Print.info(
      'Fetched ${personasJson.length} personas from API $personasJson',
    );
    return personasJson
        .map((json) => PersonaProfile.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<bool> followPersona(String personaId) async {
    final response = await _dio.post('ai/personas/$personaId/follow');
    final data = response.data['data'] as Map<String, dynamic>? ?? const {};
    return data['isFollowed'] == true;
  }

  Future<bool> unfollowPersona(String personaId) async {
    final response = await _dio.delete('ai/personas/$personaId/follow');
    final data = response.data['data'] as Map<String, dynamic>? ?? const {};
    return data['isFollowed'] == false;
  }

  Future<AiSession> createSession({
    required String personaId,
    required String language,
    String mode = 'chat',
  }) async {
    final normalizedLanguage = language.trim().toLowerCase();
    final response = await _dio.post(
      'ai/session',
      data: {
        'personaId': personaId,
        'languageCode': normalizedLanguage,
        'mode': mode,
      },
    );

    final payload = Map<String, dynamic>.from(
      response.data['data'] as Map<String, dynamic>? ?? const {},
    );

    return AiSession(
      id: payload['sessionId']?.toString() ?? payload['id']?.toString() ?? '',
      personaId:
          payload['personaId']?.toString() ??
          payload['persona_id']?.toString() ??
          personaId,
      languageCode:
          payload['languageCode']?.toString() ??
          payload['language']?.toString() ??
          payload['language_code']?.toString() ??
          normalizedLanguage,
      mode: payload['mode']?.toString() ?? mode,
      resumeToken: payload['resumeToken']?.toString(),
    );
  }

  Future<void> updateSessionLanguage({
    required String sessionId,
    required String languageCode,
  }) async {
    await _dio.patch(
      'ai/session/$sessionId/language',
      data: {'languageCode': languageCode.trim().toLowerCase()},
    );
  }

  Future<List<ConversationSummary>> fetchHistory({int limit = 20}) async {
    try {
      final response = await _dio.get(
        'ai/history',
        queryParameters: {'limit': limit},
      );

      final List data = response.data['data'] as List? ?? [];
      return data
          .map(
            (json) =>
                ConversationSummary.fromJson(json as Map<String, dynamic>),
          )
          .toList();
    } on CustomException catch (e) {
      if (e.summary == 'Not Found') {
        return [];
      }
      rethrow;
    }
  }

  Future<ConversationMessagesPage> fetchConversationMessages({
    required String sessionId,
    int limit = 30,
    int? beforeId,
  }) async {
    final response = await _dio.get(
      'ai/history/$sessionId/messages',
      queryParameters: {'limit': limit, 'beforeId': ?beforeId},
    );

    final List rawMessages = response.data['data'] as List? ?? [];
    final messages = rawMessages
        .map((entry) => AiMessage.fromJson(entry as Map<String, dynamic>))
        .toList();

    final meta = response.data['meta'] as Map<String, dynamic>? ?? const {};
    final dynamic nextValue = meta['nextBeforeId'];
    final int? nextBeforeId = nextValue == null
        ? null
        : int.tryParse(nextValue.toString());

    return ConversationMessagesPage(
      messages: messages,
      nextBeforeId: nextBeforeId,
    );
  }

  Future<AiAttachment> uploadAttachment(XFile file) async {
    final bytes = await file.readAsBytes();
    final fileName = file.name.isNotEmpty ? file.name : 'upload.jpg';

    final formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(bytes, filename: fileName),
    });

    final response = await _dio.post(
      'ai/attachments/image',
      data: formData,
      options: Options(contentType: Headers.multipartFormDataContentType),
    );

    final attachmentJson = Map<String, dynamic>.from(
      (response.data['data']?['attachment'] ?? const <String, dynamic>{})
          as Map<String, dynamic>,
    );
    return AiAttachment.fromJson(attachmentJson);
  }
}
