import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsTileRow extends StatelessWidget {
  final String icon;
  final String label;
  final Widget? trailing;
  final VoidCallback? onTap;
  const SettingsTileRow({
    super.key,
    required this.icon,
    required this.label,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: AppTextStyles.body(15, color: Colors.white),
              ),
            ),
            ?trailing,
          ],
        ),
      ),
    );
  }
}
