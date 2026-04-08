import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Alt kontrol butonları: Mikrofon toggle, Kırmızı kapatma, Hoparlör toggle
/// Tasarımdaki 3 butonlu kontrol çubuğu
class CallControls extends StatelessWidget {
  const CallControls({
    super.key,
    required this.isMicMuted,
    required this.isSpeakerOn,
    required this.onMicToggle,
    required this.onEndCall,
    required this.onSpeakerToggle,
  });

  final bool isMicMuted;
  final bool isSpeakerOn;
  final VoidCallback onMicToggle;
  final VoidCallback onEndCall;
  final VoidCallback onSpeakerToggle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Mikrofon butonu
        _ControlButton(
          icon: isMicMuted ? AppIcons.callmicrophone : AppIcons.callmicrophone,
          backgroundColor: Colors.white.withValues(alpha: 0.5),
          iconColor: Colors.white,
          onTap: onMicToggle,
          isActive: !isMicMuted,
        ),
        const SizedBox(width: 24),
        // Kapatma butonu (kırmızı)
        _ControlButton(
          icon: AppIcons.callclose,
          backgroundColor: const Color(0xFFF44336).withValues(alpha: 0.5),
          iconColor: Colors.white,
          onTap: onEndCall,
        ),
        const SizedBox(width: 24),
        // Hoparlör butonu
        _ControlButton(
          icon: isSpeakerOn ? AppIcons.callvolume : AppIcons.callvolume,
          backgroundColor: Colors.white.withValues(alpha: 0.5),
          iconColor: Colors.white,
          onTap: onSpeakerToggle,
          isActive: isSpeakerOn,
        ),
      ],
    );
  }
}

class _ControlButton extends StatelessWidget {
  const _ControlButton({
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.onTap,

    this.isActive = true,
  });

  final String icon;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onTap;

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 82,
        height: 55,
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            color: iconColor,
            width: 28,
            height: 28,
          ),
        ),
      ),
    );
  }
}
