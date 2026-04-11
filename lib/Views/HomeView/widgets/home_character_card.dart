import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Views/ChatView/chat_view.dart';
import 'package:chatface/Views/shared/widgets/glass_icon_button.dart';
import 'package:chatface/Views/shared/widgets/status_indicator.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/shared/custom_cached_network_image.dart';
import 'package:chatface/shared/translated_job_title.dart';
import 'package:chatface/theme/app_text_styles.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeCharacterCard extends StatelessWidget {
  final PersonaProfile character;
  final ValueChanged<PersonaProfile> onTapCharacter;
  const HomeCharacterCard({
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
              top: 20,
              left: 20,
              child: StatusIndicator(
                label: character.isActive
                    ? context.t.home.online
                    : context.t.home.offline,
                isOnline: character.isActive,
              ),
            ),

            Positioned(
              left: 12,
              right: 12,
              bottom: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${character.name}, ${character.age}',
                            style: AppTextStyles.body(
                              20,
                              weight: FontWeight.w600,
                              color: Colors.white,
                              height: 24 * 1.15,
                            ),
                          ),
                          const SizedBox(height: 6),

                          TranslatedJobTitle(
                            title: character.jobTitle,
                            style: AppTextStyles.body(
                              14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GlassIconButton(
                      size: 52,
                      backgroundColor: Colors.white.withValues(alpha: 0.3),
                      icon: SvgPicture.asset(
                        AppIcons.messageBubble,
                        width: 24,
                        height: 24,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ChatView(persona: character),
                        ),
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
