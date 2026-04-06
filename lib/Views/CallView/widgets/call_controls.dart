import 'package:flutter/material.dart';

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
          icon: isMicMuted ? Icons.mic_off_rounded : Icons.mic_rounded,
          backgroundColor: Colors.white.withValues(alpha: 0.2),
          iconColor: Colors.white,
          onTap: onMicToggle,
          isActive: !isMicMuted,
        ),
        const SizedBox(width: 24),
        // Kapatma butonu (kırmızı)
        _ControlButton(
          icon: Icons.call_end_rounded,
          backgroundColor: const Color(0xFFB33A3A),
          iconColor: Colors.white,
          onTap: onEndCall,
          size: 70,
          iconSize: 32,
        ),
        const SizedBox(width: 24),
        // Hoparlör butonu
        _ControlButton(
          icon: isSpeakerOn
              ? Icons.volume_up_rounded
              : Icons.volume_off_rounded,
          backgroundColor: Colors.white.withValues(alpha: 0.2),
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
    this.size = 60,
    this.iconSize = 28,
    this.isActive = true,
  });

  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onTap;
  final double size;
  final double iconSize;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}
