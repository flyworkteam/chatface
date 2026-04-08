import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatAppBar extends StatelessWidget {
  final String characterName;
  final String characterImageUrl;
  final VoidCallback? onCallTap;
  final VoidCallback? onVideoCallTap;

  const ChatAppBar({
    super.key,
    required this.characterName,
    required this.characterImageUrl,
    this.onCallTap,
    this.onVideoCallTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 16, 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).maybePop(),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppIcons.backarrow,
                  width: 20,
                  height: 20,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            radius: 20,
            backgroundImage: characterImageUrl.startsWith('http')
                ? NetworkImage(characterImageUrl)
                : AssetImage(characterImageUrl) as ImageProvider,
          ),
          Spacer(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                characterName,
                style: AppTextStyles.body(
                  16,
                  color: Colors.white,
                  weight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      color: Colors.greenAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    context.t.chat.online,
                    style: AppTextStyles.body(
                      12,
                      color: Colors.greenAccent,
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: onCallTap?.call,
            child: SvgPicture.asset(AppIcons.voiceCall),
          ),
          const SizedBox(width: 18),
          GestureDetector(
            onTap: onVideoCallTap?.call,
            child: Image(
              image: ResizeImage(AssetImage(AppIcons.videoCallChat), width: 40),
              fit: BoxFit.contain,
              filterQuality: FilterQuality.high,
              isAntiAlias: true,
            ),
          ),
        ],
      ),
    );
  }
}
