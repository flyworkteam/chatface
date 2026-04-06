import 'package:chatface/Models/ai_message_model.dart';
import 'package:chatface/Riverpod/Providers/all_providers.dart';
import 'package:chatface/utils/print.dart';
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AttachmentUploadService {
  AttachmentUploadService(this.ref);

  final Ref ref;
  final ImagePicker _picker = ImagePicker();

  Future<AiAttachment?> pickAndUpload(ImageSource source) async {
    try {
      final hasPermission = await _ensurePermission(source);
      if (!hasPermission) {
        throw Exception('media_permission_denied');
      }

      final file = await _picker.pickImage(
        source: source,
        imageQuality: 90,
        maxHeight: 1600,
        maxWidth: 1600,
      );
      if (file == null) {
        return null;
      }

      final repo = ref.read(AllProviders.aiRepositoryProvider);
      return await repo.uploadAttachment(file);
    } catch (error, stackTrace) {
      Print.error('Attachment upload failed: $error', st: stackTrace);
      rethrow;
    }
  }

  Future<bool> _ensurePermission(ImageSource source) async {
    if (kIsWeb) {
      return true;
    }

    Permission permission;
    if (source == ImageSource.camera) {
      permission = Permission.camera;
    } else {
      final isIos = defaultTargetPlatform == TargetPlatform.iOS;
      permission = isIos ? Permission.photos : Permission.storage;
    }

    final status = await permission.request();
    if (status.isGranted) {
      return true;
    }
    if (permission == Permission.photos && status.isLimited) {
      return true;
    }
    return false;
  }
}
