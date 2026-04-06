import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PremiumBannerCard extends StatelessWidget {
  const PremiumBannerCard({
    required this.title,
    required this.description,
    required this.iconPath,
    this.onTap,
    super.key,
  });

  final String title;
  final String description;
  final String iconPath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xffFFFCE8), Color(0xffFFFFFF)],
          ),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.25),
                shape: BoxShape.circle,
              ),
              child: Center(child: SvgPicture.asset(iconPath)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.body(
                      16,
                      height: 26,
                      weight: FontWeight.w600,
                      color: Color.fromARGB(255, 181, 96, 96),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: AppTextStyles.body(
                      14,
                      height: 12,
                      weight: FontWeight.w300,
                      color: Color.fromARGB(255, 14, 21, 63),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
