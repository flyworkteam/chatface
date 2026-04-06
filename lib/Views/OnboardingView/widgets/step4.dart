import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Step4 extends StatelessWidget {
  const Step4({super.key, this.bottomPadding = 0, this.onUnderstand});

  final double bottomPadding;
  final VoidCallback? onUnderstand;

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    final items = [
      (
        'assets/icons/securitysafe.svg',
        t.onboarding.step4.entry1,
        t.onboarding.step4.subentry1,
      ),
      (
        'assets/icons/cameraslash.svg',
        t.onboarding.step4.entry2,
        t.onboarding.step4.subentry2,
      ),
      (
        'assets/icons/clock.svg',
        t.onboarding.step4.entry3,
        t.onboarding.step4.subentry3,
      ),
      (
        'assets/icons/minuscircle.svg',
        t.onboarding.step4.entry4,
        t.onboarding.step4.subentry4,
      ),
    ];

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              t.onboarding.step4.title,
              style: AppTextStyles.heading(
                30,
                FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 28),
            ...items.map(
              (item) => _SafetyItem(
                iconPath: item.$1,
                title: item.$2,
                subtitle: item.$3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SafetyItem extends StatelessWidget {
  const _SafetyItem({
    required this.iconPath,
    required this.title,
    required this.subtitle,
  });

  final String iconPath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(
              iconPath,
              width: 36,
              height: 36,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.body(
                    15,
                    weight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: AppTextStyles.body(
                    12,
                    color: Colors.white.withValues(alpha: 0.55),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
