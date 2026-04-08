import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/utils/print.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

/// İzin yönetimi yardımcı sınıfı
/// VideoView ve CallView başlamadan önce izin kontrolü yapar
class PermissionHelper {
  /// Mikrofon izni iste ve kontrol et
  static Future<bool> requestMicrophonePermission() async {
    final status = await Permission.microphone.request();
    return status.isGranted;
  }

  /// Kamera izni iste ve kontrol et
  static Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.request();
    return status.isGranted;
  }

  /// VideoView için: hem kamera hem mikrofon izni
  static Future<bool> requestVideoCallPermissions() async {
    final statuses = await [Permission.camera, Permission.microphone].request();

    return statuses[Permission.camera]!.isGranted &&
        statuses[Permission.microphone]!.isGranted;
  }

  /// Video call izinleri iste ve eğer reddedildiyse ayarlara yönlendir seçeneği göster
  static Future<bool> ensureVideoCallPermissions(BuildContext context) async {
    final granted = await requestVideoCallPermissions();
    if (!context.mounted) {
      return granted;
    }
    if (!granted) {
      final camStatus = await Permission.camera.status;
      if (!context.mounted) {
        return granted;
      }
      if (camStatus.isPermanentlyDenied || camStatus.isDenied) {
        await showPermissionDeniedDialog(
          context,
          title: context.t.permissionsRequired,
          message: context.t.permissionHelper.camAndMicRequired,
        );
      }
    }
    return granted;
  }

  /// CallView için: mikrofon zorunlu
  static Future<bool> requestVoiceCallPermissions() async {
    final statuses = await [Permission.microphone].request();
    final micGranted = statuses[Permission.microphone]?.isGranted ?? false;

    Print.info(
      'Permission status microphone=${statuses[Permission.microphone]}',
    );
    return micGranted;
  }

  /// Voice call izinleri iste ve eğer reddedildiyse ayarlara yönlendir seçeneği göster
  static Future<bool> ensureVoiceCallPermissions(BuildContext context) async {
    final granted = await requestVoiceCallPermissions();
    if (!context.mounted) {
      return granted;
    }
    if (!granted) {
      final micStatus = await Permission.microphone.status;
      if (!context.mounted) {
        return granted;
      }
      Print.info('Microphone status: $micStatus');
      if (micStatus.isPermanentlyDenied || micStatus.isDenied) {
        await showPermissionDeniedDialog(
          context,
          title: context.t.permissionsRequired,
          message: context.t.permissionHelper.micRequired,
        );
      }
    }
    return granted;
  }

  /// Background mic izni gerektiren cihazlar için opsiyonel doğrulama.
  static Future<bool> ensureBackgroundMicPermission() async {
    final status = await Permission.microphone.status;
    if (status.isGranted) {
      return true;
    }
    final requested = await Permission.microphone.request();
    if (!requested.isGranted) {
      Print.warning(
        'Background microphone permission denied: $requested',
        tag: 'PermissionHelper',
      );
    }
    return requested.isGranted;
  }

  /// İzinler reddedildiyse ayarlara yönlendir
  static Future<void> showPermissionDeniedDialog(
    BuildContext context, {
    required String title,
    required String message,
  }) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A2A2A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          title,
          style: GoogleFonts.rubik(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(message, style: GoogleFonts.rubik(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              context.t.permissionHelper.cancel,
              style: GoogleFonts.rubik(color: Colors.white54),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: Text(
              context.t.permissionHelper.openSettings,
              style: GoogleFonts.rubik(
                color: const Color(0xFF7C3AED),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
