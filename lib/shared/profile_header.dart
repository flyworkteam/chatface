import 'package:chatface/Core/Routes/app_routes.dart';
import 'package:chatface/Models/user_model.dart';
import 'package:chatface/shared/custom_cached_network_image.dart';
import 'package:chatface/shared/profile_dialog_card.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileHeader extends StatelessWidget {
  final UserProfile? user;
  final bool isVideoCall;
  const ProfileHeader({this.user, this.isVideoCall = false, super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl = user?.profilePictureUrl;

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => ProfileDialogCard(
            user: user,
            onEdit: () => {
              Navigator.of(context).pushNamed(AppRoutes.editProfile),
            },
            onSettings: () => {
              Navigator.of(context).pushNamed(AppRoutes.settingsSupport),
            },
          ),
        );
      },
      child: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.transparent,
        child: ClipOval(
          child: imageUrl != null && imageUrl.isNotEmpty
              ? CustomCachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 44,
                  height: 44,
                  backgroundImage: AppImages.person7,
                )
              : Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: isVideoCall
                        ? Border.all(color: Colors.white, width: 1)
                        : null,
                  ),
                  child: SvgPicture.asset(AppIcons.homeProfile),
                ),
        ),
      ),
    );
  }
}
