import 'package:chatface/Riverpod/Providers/user_provider.dart';
import 'package:chatface/Views/MessagesView/widgets/page_header.dart';
import 'package:chatface/shared/profile_header.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VideoPageHeader extends ConsumerWidget {
  final bool isInCall;
  final bool? isCallEnded;
  final VoidCallback? onClose;
  const VideoPageHeader({
    super.key,
    required this.isInCall,
    this.isCallEnded = false,
    this.onClose,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProfileProvider);
    final isPremium = user.asData?.value?.user.isPremium ?? false;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Row(
        children: [
          user.when(
            data: (profileData) => ProfileHeader(user: profileData!.user),
            loading: () => CircularProgressIndicator(),
            error: (error, stackTrace) => SvgPicture.asset(AppIcons.warning),
          ),
          const Spacer(),
          if (!isPremium) PremiumBadge(isPremium: isPremium),

          if (isInCall && isCallEnded != true) ...[
            SizedBox(width: 12),
            GestureDetector(
              onTap: onClose?.call,
              child: Image.asset(AppIcons.closecircle),
            ),
          ],
        ],
      ),
    );
  }
}
