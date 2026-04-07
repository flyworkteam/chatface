import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Views/HomeView/widgets/home_character_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
            height: cardHeight - 32,
            top: -10,
            horizontalInset: 0,
            shiftX: -7,
            angle: -0.05,
            color: Colors.white.withValues(alpha: 0.1),
          ),
          _SwiperBackdropCard(
            width: cardWidth,
            height: cardHeight - 16,
            top: 4,
            horizontalInset: 10,
            shiftX: 20,
            angle: 0.09,
            color: const Color(0xff9A6C9B).withValues(alpha: 0.36),
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
                      return HomeCharacterCard(
                        character: character,
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
