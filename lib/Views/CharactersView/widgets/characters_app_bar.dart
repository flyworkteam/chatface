import 'package:chatface/Views/shared/widgets/glass_icon_button.dart';
import 'package:chatface/gen/strings.g.dart';
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
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
        const Spacer(),
        GlassIconButton(
          onPressed: onAction,
          size: 30,
          backgroundColor: Colors.transparent,
          icon: SvgPicture.asset(
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
