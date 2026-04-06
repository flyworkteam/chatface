import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Views/shared/widgets/character_grid_card.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeMoreSection extends StatelessWidget {
  const HomeMoreSection({
    super.key,
    required this.characters,
    required this.onSeeAll,
    required this.onCharacterTap,
  });

  final List<PersonaProfile> characters;
  final VoidCallback onSeeAll;
  final ValueChanged<PersonaProfile> onCharacterTap;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final actionLabel = t.characters.characters;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              t.home.more,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
            const Spacer(),
            GestureDetector(
              onTap: onSeeAll,
              child: Row(
                children: [
                  Text(
                    t.home.seeAll,
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.5),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        AppIcons.forwardSeeAll,
                        width: 6,
                        height: 6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: characters.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 3 / 4,
          ),
          itemBuilder: (context, index) {
            final character = characters[index];
            return CharacterGridCard(
              character: character,
              actionLabel: actionLabel,
              onTap: () => onCharacterTap(character),
            );
          },
        ),
      ],
    );
  }
}
