import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Views/ChatView/chat_view.dart';
import 'package:chatface/Views/shared/widgets/glass_icon_button.dart';
import 'package:chatface/Views/shared/widgets/status_indicator.dart';
import 'package:chatface/gen/strings.g.dart';
import 'package:chatface/shared/custom_cached_network_image.dart';
import 'package:chatface/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeFeaturedSwiper extends HookConsumerWidget {
  const HomeFeaturedSwiper({
    super.key,
    required this.characters,
    required this.onTapCharacter,
  });

  final List<PersonaProfile> characters;
  final ValueChanged<PersonaProfile> onTapCharacter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useMemoized(() => CardSwiperController());

    final size = MediaQuery.of(context).size;
    final cardWidth = size.width * 0.78;
    final cardHeight = cardWidth * 1.35;
    const swiperTopOffset = 12.0;

    if (characters.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: cardHeight + 56,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          _SwiperBackdropCard(
            width: cardWidth,
            height: cardHeight - 24,
            top: 10,
            horizontalInset: 20,
            shiftX: -22,
            angle: -0.11,
            color: const Color(0xFF9B78B3).withValues(alpha: 0.42),
          ),
          _SwiperBackdropCard(
            width: cardWidth,
            height: cardHeight - 16,
            top: 4,
            horizontalInset: 10,
            shiftX: 20,
            angle: 0.09,
            color: const Color(0xFFB091C8).withValues(alpha: 0.36),
          ),
          Positioned(
            top: swiperTopOffset,
            child: SizedBox(
              width: cardWidth,
              height: cardHeight,
              child: CardSwiper(
                controller: controller,
                padding: EdgeInsets.zero,
                maxAngle: 8,
                scale: 0.98,
                threshold: 45,
                allowedSwipeDirection: AllowedSwipeDirection.symmetric(
                  horizontal: true,
                  vertical: false,
                ),
                isLoop: true,
                numberOfCardsDisplayed: 1,
                cardBuilder:
                    (
                      BuildContext context,
                      int index,
                      int horizontalOffsetPercentage,
                      int verticalOffsetPercentage,
                    ) {
                      final character = characters[index];
                      return _CharacterSwiperCard(
                        character: character,
                        textTheme: Theme.of(context).textTheme,
                        onTapCharacter: onTapCharacter,
                      );
                    },
                cardsCount: characters.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SwiperBackdropCard extends StatelessWidget {
  const _SwiperBackdropCard({
    required this.width,
    required this.height,
    required this.top,
    required this.horizontalInset,
    required this.shiftX,
    required this.angle,
    required this.color,
  });

  final double width;
  final double height;
  final double top;
  final double horizontalInset;
  final double shiftX;
  final double angle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      child: Transform.translate(
        offset: Offset(shiftX, 0),
        child: Transform.rotate(
          angle: angle,
          child: Container(
            width: width - horizontalInset,
            height: height,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(36),
            ),
          ),
        ),
      ),
    );
  }
}

class _CharacterSwiperCard extends StatelessWidget {
  const _CharacterSwiperCard({
    required this.character,
    required this.textTheme,
    required this.onTapCharacter,
  });

  final PersonaProfile character;
  final TextTheme textTheme;
  final ValueChanged<PersonaProfile> onTapCharacter;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final roleLabel =
        t[character.displayRoleKey] ?? t.characters.placeholderSubtitle;

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
                label: character.isActive ? t.home.online : t.home.offline,
                isOnline: character.isActive,
              ),
            ),

            Positioned(
              left: 24,
              right: 24,
              bottom: 24,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          character.name,
                          style: textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                            letterSpacing: 0,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          character.jobTitle,
                          style: textTheme.bodyMedium?.copyWith(
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
