import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsCard extends StatelessWidget {
  const NotificationsCard({
    required this.title,
    required this.description,
    required this.time,
    required this.imagePath,
    this.isRead = false,
    this.onTap,
    this.onClose,
    super.key,
  });

  final String title;
  final String description;
  final String time;
  final String imagePath;
  final bool isRead;
  final VoidCallback? onTap;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: isRead ? Colors.transparent : Colors.blue.shade200,
                width: 1,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SvgPicture.asset(
                      imagePath,
                      fit: BoxFit.contain,
                      // width: 48,
                      // height: 48,
                    ),
                    if (!isRead)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.body(
                          16,
                          height: 18,
                          weight: isRead ? FontWeight.w500 : FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: AppTextStyles.body(
                          14,
                          height: 16,
                          weight: FontWeight.w300,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  time,
                  style: AppTextStyles.body(
                    12,
                    height: 14,
                    weight: FontWeight.w400,
                    color: Color(0xffC1C1C1),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -5,
          right: -5,
          child: GestureDetector(
            onTap: onClose,
            child: SizedBox(
              width: 24,
              height: 24,

              child: SvgPicture.asset(AppIcons.minuscircle),
            ),
          ),
        ),
      ],
    );
  }
}
