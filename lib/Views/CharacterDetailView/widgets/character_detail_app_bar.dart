import 'package:chatface/Views/shared/widgets/glass_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/app_assets.dart';

class CharacterDetailAppBar extends StatelessWidget {
  const CharacterDetailAppBar({
    super.key,
    required this.onBack,
    required this.title,
    this.storyCount = 3,
    this.activeStoryIndex = 0,
  });

  final VoidCallback onBack;
  final String title;
  final int storyCount;
  final int activeStoryIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GlassIconButton(
              onPressed: onBack,
              icon: SvgPicture.asset(
                AppIcons.backarrow,
                width: 18,
                height: 18,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          children: List.generate(storyCount, (index) {
            final isActive = index == activeStoryIndex;
            return Expanded(
              child: Container(
                height: 4,
                margin: EdgeInsets.only(right: index == storyCount - 1 ? 0 : 8),
                decoration: BoxDecoration(
                  color: isActive
                      ? Colors.white
                      : Colors.white.withValues(alpha: 0.35),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
