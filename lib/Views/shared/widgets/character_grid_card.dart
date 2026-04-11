import 'dart:ui';

import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/shared/custom_cached_network_image.dart';
import 'package:chatface/shared/translated_job_title.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CharacterGridCard extends StatelessWidget {
  const CharacterGridCard({
    super.key,
    required this.character,
    required this.onTap,
    required this.actionLabel,
    this.subtitle,
  });

  final PersonaProfile character;
  final VoidCallback onTap;
  final String actionLabel;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final cardSubtitle = character.jobTitle;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: Colors.black.withValues(alpha: 0.6),
            width: 2,
          ),
          gradient: const LinearGradient(
            colors: [Color(0xFF2B1034), Color(0xFF09090F)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(child: _GridImage(character: character)),
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.45),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 6,
                      right: 6,
                      bottom: 8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xB3211B19),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.settings,
                                  width: 11,
                                  height: 11,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  actionLabel,
                                  style: AppTextStyles.body(
                                    12,
                                    weight: FontWeight.w600,
                                    letterSpacing: 0.4 / 12,
                                    height: 12 * 1.25,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.body(
                        18,
                        weight: FontWeight.w700,
                        letterSpacing: 0.1 / 18,
                        height: 18 * 1.3,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    TranslatedJobTitle(
                      title: cardSubtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.body(
                        12,
                        color: Colors.white.withValues(alpha: 0.82),
                        height: 12 * 1.25,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GridImage extends StatelessWidget {
  const _GridImage({required this.character});

  final PersonaProfile character;

  @override
  Widget build(BuildContext context) {
    final imageUrl = character.displayImageUrl;
    if (imageUrl.startsWith('https')) {
      return CustomCachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.contain);
    }
    return Image.asset(character.displayImageAsset, fit: BoxFit.cover);
  }
}
