import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/shared/custom_cached_network_image.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CharacterHeroCard extends StatelessWidget {
  const CharacterHeroCard({super.key, required this.character});

  final PersonaProfile character;

  @override
  Widget build(BuildContext context) {
    final description = character.shortDescription;

    return LayoutBuilder(
      builder: (context, constraints) {
        final hasFiniteHeight =
            constraints.maxHeight.isFinite &&
            constraints.maxHeight != double.infinity;
        final body = hasFiniteHeight && constraints.maxHeight > 150
            ? _buildConstrainedContent(description, constraints.maxHeight)
            : _buildNaturalContent(description);

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

  Widget _buildConstrainedContent(String description, double maxHeight) {
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
            style: AppTextStyles.body(
              24,
              weight: FontWeight.w700,
              color: Colors.white,
              height: 24 * 1.15,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.body(
              16,
              color: Colors.white.withValues(alpha: 0.82),
              height: 16 * 1.24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNaturalContent(String description) {
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
          style: AppTextStyles.body(
            24,
            weight: FontWeight.w700,
            color: Colors.white,
            height: 24 * 1.15,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.body(
            16,
            color: Colors.white.withValues(alpha: 0.82),
            height: 16 * 1.35,
          ),
        ),
      ],
    );
  }
}
