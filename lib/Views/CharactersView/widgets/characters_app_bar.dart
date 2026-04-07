import 'package:chatface/Views/shared/widgets/glass_icon_button.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/app_assets.dart';

class CharactersAppBar extends StatelessWidget {
  const CharactersAppBar({super.key, required this.onBack, this.onAction});

  final VoidCallback onBack;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GlassIconButton(
          onPressed: onBack,
          size: 34,
          backgroundColor: Colors.white.withValues(alpha: 0.12),
          icon: SvgPicture.asset(
            AppIcons.backarrow,
            width: 18,
            height: 18,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        const SizedBox(width: 16),
        Text(
          context.t.characters.characters,
          style: AppTextStyles.body(
            22,
            weight: FontWeight.w600,
            letterSpacing: 0.05 / 22,
            height: 22 * 1.15,
            color: Colors.white,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onAction,
          child: SvgPicture.asset(
            AppIcons.filter,
            width: 25,
            height: 25,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }
}
