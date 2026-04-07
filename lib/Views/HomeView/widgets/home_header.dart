import 'package:chatface/Riverpod/Providers/user_provider.dart';
import 'package:chatface/shared/profile_header.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:chatface/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({
    super.key,
    required this.onFilterTap,
    required this.onNotificationsTap,
  });

  final VoidCallback onFilterTap;
  final VoidCallback onNotificationsTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProfileProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        user.when(
          data: (profileData) => ProfileHeader(user: profileData?.user),
          loading: () => CircularProgressIndicator(),
          error: (error, stackTrace) => SvgPicture.asset(AppIcons.warning),
        ),
        Text(
          Constants.appName,
          style: AppTextStyles.body(
            18,
            weight: FontWeight.w600,
            letterSpacing: 0.1 / 18,
            height: 18 * 1.3,
            color: Colors.white,
          ),
        ),
        Row(
          spacing: 16,
          children: [
            GestureDetector(
              onTap: onFilterTap,
              child: SvgPicture.asset(
                AppIcons.filter,
                height: 25,
                width: 25,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
            GestureDetector(
              onTap: onNotificationsTap,
              child: SvgPicture.asset(
                AppIcons.notification,
                height: 25,
                width: 25,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
