import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CharacterPrimaryActionButton extends StatelessWidget {
  const CharacterPrimaryActionButton({
    super.key,
    required this.label,
    required this.iconPath,
    this.onPressed,
  });

  final String label;
  final String iconPath;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF7A2E6F),
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 19),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 25,
              height: 25,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: AppTextStyles.body(
                18,
                weight: FontWeight.w600,
                letterSpacing: 0.1 / 18,
                height: 18 * 1.3,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CharacterSecondaryActionButton extends StatelessWidget {
  const CharacterSecondaryActionButton({
    super.key,
    required this.label,
    required this.iconPath,
    this.onPressed,
  });

  final String label;
  final String iconPath;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: BorderSide(color: Colors.white.withValues(alpha: 0.24)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
        padding: const EdgeInsets.symmetric(vertical: 16),
        backgroundColor: Colors.black.withValues(alpha: 0.35),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 25,
            height: 25,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: AppTextStyles.body(
              14,
              weight: FontWeight.w600,
              letterSpacing: 0.1 / 14,
              height: 14 * 1.25,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
