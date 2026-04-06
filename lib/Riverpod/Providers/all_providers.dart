import 'package:chatface/Repositories/ai_repository.dart';
import 'package:chatface/Repositories/auth_repository.dart';
import 'package:chatface/Repositories/language_repository.dart';
import 'package:chatface/Services/attachment_upload_service.dart';
import 'package:chatface/Services/dio_service.dart';
import 'package:chatface/Services/realtime_gateway.dart';
import 'package:chatface/Services/secure_storage_service.dart';
import 'package:chatface/Services/streaming_stt_service.dart';
import 'package:chatface/Services/tts_playback_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllProviders {
  static final dioServiceProvider = Provider<DioService>((ref) {
    return DioService(ref);
  });

  static final secureStorageServiceProvider = Provider<SecureStorageService>((
    ref,
  ) {
    return SecureStorageService();
  });

  // ─── Repository Providers ───────────────────────────────────────────

  static final authRepositoryProvider = Provider<AuthRepository>((ref) {
    return AuthRepository(ref);
  });

  static final languageRepositoryProvider = Provider<LanguageRepository>((ref) {
    return LanguageRepository(ref);
  });

  static final aiRepositoryProvider = Provider<AiRepository>((ref) {
    return AiRepository(ref);
  });

  static final realtimeGatewayProvider = Provider<RealtimeGatewayService>((
    ref,
  ) {
    final service = RealtimeGatewayService(ref);
    ref.onDispose(service.dispose);
    return service;
  });

  static final attachmentUploadServiceProvider =
      Provider<AttachmentUploadService>((ref) {
        return AttachmentUploadService(ref);
      });

  static final ttsPlaybackServiceProvider = Provider<TtsPlaybackService>((ref) {
    final service = TtsPlaybackService();
    ref.onDispose(service.dispose);
    return service;
  });

  static final streamingSttServiceProvider = Provider<StreamingSttService>((
    ref,
  ) {
    final gateway = ref.read(realtimeGatewayProvider);
    final service = StreamingSttService(gateway);
    ref.onDispose(service.dispose);
    return service;
  });
}
