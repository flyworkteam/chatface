import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Sol taraftaki kontrol butonları (fullscreen, kamera, rotate)
/// Tasarım: Dikey sıralanmış ikonlar
class VideoSidebar extends StatelessWidget {
  const VideoSidebar({
    super.key,
    required this.onFilterTapped,
    required this.onCameraTap,
    required this.onRotateTap,
    this.cameraIconAsset = AppIcons.videoCall,
  });

  final VoidCallback onFilterTapped;
  final VoidCallback onCameraTap;
  final VoidCallback onRotateTap;
  final String cameraIconAsset;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _SidebarButton(iconAsset: AppIcons.magicpen, onTap: onFilterTapped),
        const SizedBox(height: 14),
        _SidebarButton(iconAsset: cameraIconAsset, onTap: onCameraTap),
        const SizedBox(height: 14),
        _SidebarButton(iconAsset: AppIcons.repeatarrow, onTap: onRotateTap),
      ],
    );
  }
}

class _SidebarButton extends StatelessWidget {
  const _SidebarButton({required this.iconAsset, required this.onTap});

  final String iconAsset;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 34,
        height: 34,
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.35),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: SvgPicture.asset(
          iconAsset,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}
