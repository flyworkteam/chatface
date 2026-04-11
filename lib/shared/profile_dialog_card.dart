import 'package:chatface/Models/user_model.dart' as user_model;
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/shared/custom_cached_network_image.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:chatface/utils/user_profile_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileDialogCard extends StatelessWidget {
  const ProfileDialogCard({
    super.key,
    this.user,
    this.onEdit,
    this.onSettings,
    this.profileLabel,
    this.settingsLabel,
  });

  final user_model.UserProfile? user;
  final VoidCallback? onEdit;
  final VoidCallback? onSettings;
  final String? profileLabel;
  final String? settingsLabel;

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextStyles.body(
      16,
      weight: FontWeight.w500,
      color: Colors.white,
    );
    final profileText = profileLabel ?? context.t.profileEdit;
    final settingsText = settingsLabel ?? context.t.settings;
    final imageUrl = user?.profilePictureUrl;
    final name = user?.fullName?.trim().isNotEmpty == true
        ? user!.fullName!.trim()
        : user?.email?.trim().isNotEmpty == true
        ? user!.email!.trim()
        : 'User';
    final subtitle = user?.aboutMe?.trim().isNotEmpty == true
        ? user!.aboutMe!.trim()
        : '';
    final countryLabel = userCountryLabel(context, user?.country);
    final countryFlag = userCountryFlag(user?.country);
    final genderLabel = userGenderLabel(context, user?.gender);
    final normalizedGender = user?.gender?.trim().toLowerCase();
    final genderIcon = normalizedGender == 'female'
        ? AppIcons.female
        : normalizedGender == 'male'
        ? AppIcons.male
        : AppIcons.gender;

    return Dialog(
      backgroundColor: Colors.black.withValues(alpha: 0.7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _ImageSection(
              imageUrl: imageUrl,
              onEdit: onEdit,
              onSettings: onSettings,
              profileLabel: profileText,
              settingsLabel: settingsText,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: textTheme),
                const SizedBox(height: 6),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    subtitle,
                    style: AppTextStyles.body(
                      12,
                      weight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(countryFlag, style: AppTextStyles.body(16)),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        countryLabel,
                        style: AppTextStyles.body(
                          13,
                          weight: FontWeight.w500,
                          color: Colors.white60,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 14),
                    SvgPicture.asset(
                      genderIcon,
                      width: 16,
                      height: 16,
                      colorFilter: const ColorFilter.mode(
                        Colors.white60,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      genderLabel,
                      style: AppTextStyles.body(
                        13,
                        weight: FontWeight.w500,
                        color: Colors.white60,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageSection extends StatelessWidget {
  const _ImageSection({
    required this.imageUrl,
    required this.onEdit,
    required this.onSettings,
    required this.profileLabel,
    required this.settingsLabel,
  });

  final String? imageUrl;
  final VoidCallback? onEdit;
  final VoidCallback? onSettings;
  final String profileLabel;
  final String settingsLabel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 292 / 300,
            child: imageUrl != null && imageUrl!.isNotEmpty
                ? CustomCachedNetworkImage(
                    imageUrl: imageUrl!,
                    fit: BoxFit.cover,
                  )
                : Image(
                    image: ResizeImage(
                      AssetImage(AppImages.person7),
                      width: 400,
                    ),
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                    isAntiAlias: true,
                  ),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 20,
            child: Row(
              children: [
                Expanded(
                  child: _OverlayActionButton(
                    iconAsset: AppIcons.edit,
                    label: profileLabel,
                    onTap: onEdit,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _OverlayActionButton(
                    iconAsset: AppIcons.settings,
                    label: settingsLabel,
                    onTap: onSettings,
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

class _OverlayActionButton extends StatelessWidget {
  const _OverlayActionButton({
    required this.iconAsset,
    required this.label,
    this.onTap,
  });

  final String iconAsset;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.35),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconAsset,
                width: 17,
                height: 17,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  label,
                  style: AppTextStyles.body(13, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
