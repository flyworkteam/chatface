import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsAppBar extends StatelessWidget {
  const SettingsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.maybePop(context),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: SvgPicture.asset(AppIcons.backarrow)),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            context.t.settingsSupport.title,
            style: AppTextStyles.body(
              18,
              color: Colors.white,

              weight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
