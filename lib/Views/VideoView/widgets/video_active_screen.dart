import 'dart:async';
import 'dart:io' show Platform;

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Views/VideoView/widgets/ai_character_display.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:chatface/utils/print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoCharacterStage extends StatelessWidget {
  const VideoCharacterStage({
    super.key,
    required this.character,
    required this.isCompanionSpeaking,
    required this.activeVisemeId,
    required this.activeVisemeDurationMs,
    this.onMediaReady,
  });

  final PersonaProfile character;
  final bool isCompanionSpeaking;
  final double activeVisemeId;
  final double activeVisemeDurationMs;
  final VoidCallback? onMediaReady;

  @override
  Widget build(BuildContext context) {
    final rivePath = character.displayRiveAssetPath;
    final imagePath = character.displayImagePath;

    return Stack(
      fit: StackFit.expand,
      children: [
        AICharacterDisplay(
          imagePath: imagePath,
          isNetworkImage: character.isNetworkImage,
          riveAssetPath: rivePath,
          isTalking: isCompanionSpeaking,
          visemeId: activeVisemeId,
          visemeDurationMs: activeVisemeDurationMs,
          onMediaReady: onMediaReady,
        ),
        Positioned.fill(
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.22),
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.24),
                  ],
                  stops: const [0, 0.22, 1],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Aktif video görüşme ekranı
/// AI karakter tam ekran (placeholder) + Kullanıcı kamera preview (sağ alt)
/// Sol sidebar, "Swipe to Chat >>", Follow butonu, X kapatma
class VideoActiveScreen extends StatelessWidget {
  const VideoActiveScreen({
    super.key,
    required this.character,
    required this.onSceneReady,
    required this.onClose,
    required this.onFollow,
    required this.onSwipeToChat,
    required this.onCameraStateChanged,
    required this.isCameraEnabled,
    required this.cameraPosition,
    required this.selectedFilter,
    required this.isMicMuted,
    required this.isCompanionSpeaking,
    required this.activeVisemeId,
    required this.activeVisemeDurationMs,
    this.characterStage,
    this.isFollowed = false,
  });

  final PersonaProfile character;
  final VoidCallback onSceneReady;
  final VoidCallback onClose;
  final VoidCallback onFollow;
  final VoidCallback onSwipeToChat;
  final ValueChanged<CameraState> onCameraStateChanged;
  final bool isCameraEnabled;
  final SensorPosition cameraPosition;
  final AwesomeFilter selectedFilter;
  final bool isMicMuted;
  final bool isCompanionSpeaking;
  final double activeVisemeId;
  final double activeVisemeDurationMs;
  final Widget? characterStage;

  final bool isFollowed;

  @override
  Widget build(BuildContext context) {
    void reportCameraState(CameraState state) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!context.mounted) return;
        onCameraStateChanged(state);
      });
    }

    return Stack(
      children: [
        Positioned.fill(
          child:
              characterStage ??
              VideoCharacterStage(
                character: character,
                isCompanionSpeaking: isCompanionSpeaking,
                activeVisemeId: activeVisemeId,
                activeVisemeDurationMs: activeVisemeDurationMs,
                onMediaReady: onSceneReady,
              ),
        ),

        // "Swipe to Chat >>" (sağ orta)
        Positioned(
          right: 14,
          top: MediaQuery.of(context).size.height * 0.44,
          child: _AutoHidingSwipeToChatHint(
            onTap: onSwipeToChat,
            resetToken: character.id,
          ),
        ),

        // Follow butonu (sol alt)
        Positioned(
          left: 16,
          bottom:
              MediaQuery.of(context).padding.bottom +
              kBottomNavigationBarHeight +
              20,
          child: GestureDetector(
            onTap: onFollow,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                gradient: isFollowed
                    ? null
                    : const LinearGradient(
                        colors: [Color(0xFF753066), Color(0xFFD370FF)],
                      ),
                color: isFollowed ? Colors.white.withValues(alpha: 0.2) : null,
                borderRadius: BorderRadius.circular(18),
                border: isFollowed
                    ? Border.all(color: Colors.white.withValues(alpha: 0.24))
                    : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppIcons.videoFollow, width: 30, height: 30),
                  const SizedBox(width: 10),
                  Text(
                    isFollowed
                        ? context.t.videoChat.unfollow
                        : context.t.videoChat.follow,
                    style: GoogleFonts.rubik(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Kamera Preview (sağ alt) — CamerAwesome
        Positioned(
          right: 16,
          bottom:
              MediaQuery.of(context).padding.bottom +
              kBottomNavigationBarHeight +
              20,
          child: Container(
            width: 106,
            height: 156,
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.3),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.22),
                  blurRadius: 10,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: isCameraEnabled
                  ? _SafeCameraPreview(
                      cameraPosition: cameraPosition,
                      selectedFilter: selectedFilter,
                      onCameraStateChanged: reportCameraState,
                    )
                  : DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.78),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          AppIcons.cameraslash,
                          width: 32,
                          height: 32,
                          colorFilter: const ColorFilter.mode(
                            Colors.white70,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}

class _AutoHidingSwipeToChatHint extends StatefulWidget {
  const _AutoHidingSwipeToChatHint({
    required this.onTap,
    required this.resetToken,
  });

  final VoidCallback onTap;
  final String resetToken;

  @override
  State<_AutoHidingSwipeToChatHint> createState() =>
      _AutoHidingSwipeToChatHintState();
}

class _AutoHidingSwipeToChatHintState
    extends State<_AutoHidingSwipeToChatHint> {
  static const Duration _holdDuration = Duration(milliseconds: 1100);
  static const Duration _fadeDuration = Duration(milliseconds: 1800);

  Timer? _hideTimer;
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    _startCycle();
  }

  @override
  void didUpdateWidget(covariant _AutoHidingSwipeToChatHint oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.resetToken != widget.resetToken) {
      _startCycle();
    }
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    super.dispose();
  }

  void _startCycle() {
    _hideTimer?.cancel();

    if (!_visible) {
      setState(() {
        _visible = true;
      });
    }

    _hideTimer = Timer(_holdDuration, () {
      if (!mounted) return;
      setState(() {
        _visible = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !_visible,
      child: AnimatedOpacity(
        opacity: _visible ? 1 : 0,
        duration: _fadeDuration,
        curve: Curves.easeOut,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.28),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.16),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  context.t.videoChat.swipeToChat,
                  style: GoogleFonts.rubik(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 4),
                SvgPicture.asset(AppIcons.forwardSwipe),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SafeCameraPreview extends StatefulWidget {
  const _SafeCameraPreview({
    required this.cameraPosition,
    required this.selectedFilter,
    required this.onCameraStateChanged,
  });

  final SensorPosition cameraPosition;
  final AwesomeFilter selectedFilter;
  final ValueChanged<CameraState> onCameraStateChanged;

  @override
  State<_SafeCameraPreview> createState() => _SafeCameraPreviewState();
}

class _SafeCameraPreviewState extends State<_SafeCameraPreview> {
  late Future<bool> _cameraReadyFuture;
  late SensorPosition _resolvedCameraPosition;

  @override
  void initState() {
    super.initState();
    _resolvedCameraPosition = widget.cameraPosition;
    _cameraReadyFuture = _checkCameraAvailability();
  }

  @override
  void didUpdateWidget(covariant _SafeCameraPreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.cameraPosition != widget.cameraPosition) {
      _resolvedCameraPosition = widget.cameraPosition;
      _cameraReadyFuture = _checkCameraAvailability();
    }
  }

  Future<bool> _checkCameraAvailability() async {
    try {
      // Camerawesome getSensors is not implemented on Android and returns
      // empty data, so sensor counts would be false-negative.
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
        'Camera availability - Front: $hasFrontCamera, Back: $hasBackCamera',
        tag: 'VideoActiveScreen',
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
        'Camera preflight failed: $error',
        tag: 'VideoActiveScreen',
        st: stackTrace,
      );
      // Do not block camera rendering on transient preflight issues.
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
          return const Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        }

        if (snapshot.data != true) {
          return _CameraUnavailablePlaceholder(
            label: widget.cameraPosition == SensorPosition.front
                ? 'Front camera unavailable'
                : 'Back camera unavailable',
          );
        }

        return CameraAwesomeBuilder.previewOnly(
          sensorConfig: SensorConfig.single(
            sensor: Sensor.position(_resolvedCameraPosition),
          ),
          filter: widget.selectedFilter,
          builder: (state, preview) {
            widget.onCameraStateChanged(state);
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}

class _CameraUnavailablePlaceholder extends StatelessWidget {
  const _CameraUnavailablePlaceholder({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.78)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.videocam_off, color: Colors.white70, size: 30),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: AppTextStyles.body(12, color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
