import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const _photos = [
  'assets/images/person1.png',
  'assets/images/person2.png',
  'assets/images/person3.png',
  'assets/images/person4.png',
  'assets/images/person5.png',
  'assets/images/person6.png',
  'assets/images/person7.png',
  'assets/images/person8.png',
  'assets/images/person1.png',
];

class OnboardingPhotoGrid extends HookWidget {
  const OnboardingPhotoGrid({
    super.key,
    required this.gridHeight,
    this.scrollAnimation,
    this.showBottomFade = false,
    this.fadeHeight = 120,
    this.scrollDuration = const Duration(seconds: 16),
    this.middleSpeed = 1.15,
    this.phaseShift = 0.08,
    this.sideOverflow = 20.0,
  });

  final double gridHeight;
  final Animation<double>? scrollAnimation;
  final bool showBottomFade;
  final double fadeHeight;
  final Duration scrollDuration;
  final double middleSpeed;
  final double phaseShift;
  final double sideOverflow;

  @override
  Widget build(BuildContext context) {
    final internalScrollCtrl = useAnimationController(duration: scrollDuration);
    final scrollCtrl = scrollAnimation ?? internalScrollCtrl;

    useEffect(() {
      if (scrollAnimation != null) {
        return null;
      }

      internalScrollCtrl.repeat();
      return null;
    }, [internalScrollCtrl, scrollAnimation]);

    final columns = [
      [_photos[0], _photos[1], _photos[2]],
      [_photos[3], _photos[4], _photos[5]],
      [_photos[6], _photos[7], _photos[8]],
    ];

    const gap = 8.0;

    return RepaintBoundary(
      child: ClipRRect(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final totalWidth = constraints.maxWidth;
            final colWidth = (totalWidth - gap * 2) / 3;
            final cardHeight = (gridHeight - gap * 2) / 3;

            // 3 kartlık setin bir sonrakine geçiş mesafesi (wrap gap dahil)
            final repeatDistance = cardHeight * 3 + gap * 3;

            return AnimatedBuilder(
              animation: scrollCtrl,
              builder: (context, _) {
                final baseOffset = scrollCtrl.value * repeatDistance;
                // Offset hesaplamaları normalize edildi - döngüdeki stagger'ı gidermek için
                final leftOffset = _mod(
                  baseOffset + (repeatDistance * phaseShift),
                  repeatDistance,
                );
                // Orta sütun ters yönde ve farklı hızda akarak daha canlı bir akış verir.
                final middleOffset = _mod(
                  repeatDistance -
                      (baseOffset * middleSpeed) +
                      (repeatDistance * 0.25),
                  repeatDistance,
                );
                final rightOffset = _mod(
                  (baseOffset * 0.95) + (repeatDistance * phaseShift * 4),
                  repeatDistance,
                );

                return Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      left: -sideOverflow,
                      width: colWidth,
                      top: -repeatDistance + leftOffset,
                      child: _PhotoColumn(
                        images: columns[0],
                        gap: gap,
                        cardHeight: cardHeight,
                      ),
                    ),
                    Positioned(
                      left: colWidth + gap,
                      width: colWidth,
                      top: -repeatDistance + middleOffset,
                      child: _PhotoColumn(
                        images: columns[1],
                        gap: gap,
                        cardHeight: cardHeight,
                      ),
                    ),
                    Positioned(
                      right: -sideOverflow,
                      width: colWidth,
                      top: -repeatDistance + rightOffset,
                      child: _PhotoColumn(
                        images: columns[2],
                        gap: gap,
                        cardHeight: cardHeight,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      height: fadeHeight,
                      child: IgnorePointer(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: showBottomFade
                                  ? const [0.0, 0.3, 1.0]
                                  : const [0.0, 0.5, 1.0],
                              colors: showBottomFade
                                  ? [
                                      Colors.black.withValues(alpha: 1.0),
                                      Colors.black.withValues(alpha: 0.5),
                                      Colors.transparent,
                                    ]
                                  : [
                                      Colors.black.withValues(alpha: 0.6),
                                      Colors.black.withValues(alpha: 0.25),
                                      Colors.transparent,
                                    ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

double _mod(double value, double divisor) {
  final result = value % divisor;
  if (result < 0) {
    return result + divisor;
  }
  return result;
}

class _PhotoColumn extends StatelessWidget {
  const _PhotoColumn({
    required this.images,
    required this.gap,
    required this.cardHeight,
  });

  final List<String> images;
  final double gap;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    final loopedImages = [...images, ...images];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < loopedImages.length; i++) ...[
          if (i > 0) SizedBox(height: gap),
          SizedBox(
            height: cardHeight,
            child: _PhotoCard(imagePath: loopedImages[i]),
          ),
        ],
      ],
    );
  }
}

class _PhotoCard extends StatelessWidget {
  const _PhotoCard({required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
