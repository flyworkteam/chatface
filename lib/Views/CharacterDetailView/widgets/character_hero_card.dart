import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/shared/custom_cached_network_image.dart';
import 'package:flutter/material.dart';

class CharacterHeroCard extends StatelessWidget {
  const CharacterHeroCard({super.key, required this.character});

  final PersonaProfile character;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final t = context.t;
    final description = character.shortDescription;

    return LayoutBuilder(
      builder: (context, constraints) {
        final hasFiniteHeight =
            constraints.maxHeight.isFinite &&
            constraints.maxHeight != double.infinity;
        final body = hasFiniteHeight && constraints.maxHeight > 150
            ? _buildConstrainedContent(
                textTheme,
                description,
                constraints.maxHeight,
              )
            : _buildNaturalContent(textTheme, description);

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withValues(alpha: 0.24)),
            color: Colors.black.withValues(alpha: 0.5),
          ),
          child: Padding(padding: const EdgeInsets.all(12), child: body),
        );
      },
    );
  }

  Widget _buildConstrainedContent(
    TextTheme textTheme,
    String description,
    double maxHeight,
  ) {
    final imageUrl = character.displayImageUrl;
    return SizedBox(
      height: maxHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: CustomCachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            character.name,
            style: textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyLarge?.copyWith(
              color: Colors.white.withValues(alpha: 0.82),
              height: 1.24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNaturalContent(TextTheme textTheme, String description) {
    final imageUrl = character.displayImageUrl;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: AspectRatio(
            aspectRatio: 2 / 3,
            child: CustomCachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          character.name,
          style: textTheme.headlineSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: textTheme.bodyLarge?.copyWith(
            color: Colors.white.withValues(alpha: 0.82),
            height: 1.35,
          ),
        ),
      ],
    );
  }
}
