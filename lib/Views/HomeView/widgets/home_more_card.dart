import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/shared/custom_cached_network_image.dart';
import 'package:chatface/shared/translated_job_title.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class HomeMoreCard extends StatelessWidget {
  final PersonaProfile character;
  final ValueChanged<PersonaProfile> onTapCharacter;
  const HomeMoreCard({
    required this.character,
    required this.onTapCharacter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapCharacter(character),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          gradient: const LinearGradient(
            colors: [Color(0xFF3A1A3F), Color(0xFF09090F)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Hero(
                tag: 'character-${character.id}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(36),
                  child: _CharacterImage(character: character),
                ),
              ),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.8),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              left: 12,
              right: 12,
              bottom: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${character.name}, ${character.age}',
                      style: AppTextStyles.body(
                        13,
                        weight: FontWeight.w400,
                        letterSpacing: -0.05,
                        color: Colors.white,
                        height: 24 * 1.15,
                      ),
                    ),

                    TranslatedJobTitle(
                      title: character.jobTitle,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.body(
                        12,
                        weight: FontWeight.w300,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CharacterImage extends StatelessWidget {
  const _CharacterImage({required this.character});

  final PersonaProfile character;

  @override
  Widget build(BuildContext context) {
    final imageUrl = character.displayImageUrl;
    if (imageUrl.startsWith('https')) {
      return CustomCachedNetworkImage(imageUrl: imageUrl);
    }
    return Image.asset(character.displayImageAsset, fit: BoxFit.cover);
  }
}
