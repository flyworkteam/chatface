import 'dart:io' show Platform;

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:chatface/utils/print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

/// Boş/Bitti ekranı — video görüşmesi bitmişken veya henüz başlamamışken
/// Tasarım: Siyah arka plan, ortada mesaj, swipe ikonu
class VideoIdleScreen extends StatelessWidget {
  const VideoIdleScreen({
    super.key,
    required this.onSwipeForNewChat,
    required this.cameraPosition,
    required this.selectedFilter,
  });

  final VoidCallback onSwipeForNewChat;
  final SensorPosition cameraPosition;
  final AwesomeFilter selectedFilter;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        // Sağa swipe → yeni sohbet
        if (details.primaryVelocity != null &&
            details.primaryVelocity! < -200) {
          onSwipeForNewChat();
        }
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: _IdleSafeCameraPreview(
              cameraPosition: cameraPosition,
              selectedFilter: selectedFilter,
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.3),
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.45),
                    ],
                    stops: const [0, 0.45, 1],
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Swipe for new chat',
                  style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                SvgPicture.asset(AppIcons.forwardSwipe, width: 36, height: 36),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IdleSafeCameraPreview extends StatefulWidget {
  const _IdleSafeCameraPreview({
    required this.cameraPosition,
    required this.selectedFilter,
  });

  final SensorPosition cameraPosition;
  final AwesomeFilter selectedFilter;

  @override
  State<_IdleSafeCameraPreview> createState() => _IdleSafeCameraPreviewState();
}

class _IdleSafeCameraPreviewState extends State<_IdleSafeCameraPreview> {
  late Future<bool> _cameraReadyFuture;
  late SensorPosition _resolvedCameraPosition;

  @override
  void initState() {
    super.initState();
    _resolvedCameraPosition = widget.cameraPosition;
    _cameraReadyFuture = _checkCameraAvailability();
  }

  @override
  void didUpdateWidget(covariant _IdleSafeCameraPreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.cameraPosition != widget.cameraPosition) {
      _resolvedCameraPosition = widget.cameraPosition;
      _cameraReadyFuture = _checkCameraAvailability();
    }
  }

  Future<bool> _checkCameraAvailability() async {
    try {
      // Android returns empty sensors list here, so skip strict preflight.
      if (Platform.isAndroid) {
        _resolvedCameraPosition = widget.cameraPosition;
        return true;
      }

      if (Platform.isIOS &&
          (Platform.environment.containsKey('SIMULATOR_DEVICE_NAME') ||
              Platform.environment.containsKey('SIMULATOR_MODEL_IDENTIFIER') ||
              Platform.environment.containsKey('IPHONE_SIMULATOR_ROOT'))) {
        return false;
      }

      final sensors = await CamerawesomePlugin.getSensors();
      final hasFrontCamera = sensors.availableFrontSensors > 0;
      final hasBackCamera = sensors.availableBackSensors > 0;
      Print.info(
        'Idle camera availability - Front: $hasFrontCamera, Back: $hasBackCamera',
        tag: 'VideoIdleScreen',
      );

      if (!hasFrontCamera && !hasBackCamera) {
        return false;
      }

      if (widget.cameraPosition == SensorPosition.front) {
        _resolvedCameraPosition = hasFrontCamera
            ? SensorPosition.front
            : SensorPosition.back;
      } else {
        _resolvedCameraPosition = hasBackCamera
            ? SensorPosition.back
            : SensorPosition.front;
      }
      return true;
    } catch (error, stackTrace) {
      Print.error(
        'Idle camera preflight failed: $error',
        tag: 'VideoIdleScreen',
        st: stackTrace,
      );
      _resolvedCameraPosition = widget.cameraPosition;
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _cameraReadyFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const ColoredBox(
            color: Colors.black,
            child: Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        }

        if (snapshot.data != true) {
          return const _CameraUnavailablePlaceholder();
        }

        return CameraAwesomeBuilder.previewOnly(
          sensorConfig: SensorConfig.single(
            sensor: Sensor.position(_resolvedCameraPosition),
          ),
          filter: widget.selectedFilter,
          builder: (state, preview) => const SizedBox.shrink(),
        );
      },
    );
  }
}

class _CameraUnavailablePlaceholder extends StatelessWidget {
  const _CameraUnavailablePlaceholder();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.88)),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppIcons.cameraslash,
              width: 34,
              height: 34,
              colorFilter: const ColorFilter.mode(
                Colors.white70,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Camera unavailable',
              style: GoogleFonts.rubik(
                color: Colors.white70,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
