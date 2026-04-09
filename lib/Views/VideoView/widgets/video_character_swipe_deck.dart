import 'dart:async';

import 'package:chatface/Models/persona_model.dart';
import 'package:chatface/Views/VideoView/video_view_logic.dart';
import 'package:flutter/material.dart';

typedef VideoCharacterStageBuilder =
    Widget Function(
      BuildContext context,
      PersonaProfile character,
      bool isPreview,
    );

class VideoCharacterSwipePresentation {
  const VideoCharacterSwipePresentation({
    required this.dragOffset,
    required this.progress,
    required this.direction,
  });

  final double dragOffset;
  final double progress;
  final VideoSwipeDirection? direction;
}

class VideoCharacterSwipeDeck extends StatefulWidget {
  const VideoCharacterSwipeDeck({
    super.key,
    required this.currentCharacter,
    required this.previousCharacter,
    required this.nextCharacter,
    required this.isInteractionEnabled,
    required this.onCommitSwipe,
    required this.onPresentationChanged,
    required this.stageBuilder,
  });

  final PersonaProfile currentCharacter;
  final PersonaProfile? previousCharacter;
  final PersonaProfile? nextCharacter;
  final bool isInteractionEnabled;
  final FutureOr<void> Function(VideoSwipeDirection direction) onCommitSwipe;
  final ValueChanged<VideoCharacterSwipePresentation> onPresentationChanged;
  final VideoCharacterStageBuilder stageBuilder;

  static const frontTransformKey = ValueKey<String>('video-swipe-front');
  static const backOpacityKey = ValueKey<String>('video-swipe-back-opacity');
  static const gestureKey = ValueKey<String>('video-swipe-gesture-area');

  @override
  State<VideoCharacterSwipeDeck> createState() =>
      _VideoCharacterSwipeDeckState();
}

class _VideoCharacterSwipeDeckState extends State<VideoCharacterSwipeDeck>
    with SingleTickerProviderStateMixin {
  static const _snapBackDuration = Duration(milliseconds: 260);
  static const _commitDuration = Duration(milliseconds: 220);
  static const _maxRotationRadians = 0.14;
  static const _previewBaseScale = 0.94;
  static const _previewBaseOpacity = 0.22;

  late final AnimationController _animationController;
  Animation<double>? _offsetAnimation;
  double _dragOffset = 0;
  double _deckWidth = 1;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this)
      ..addListener(() {
        final animation = _offsetAnimation;
        if (animation == null) {
          return;
        }
        setState(() {
          _dragOffset = animation.value;
        });
        _notifyPresentation();
      });
  }

  @override
  void didUpdateWidget(covariant VideoCharacterSwipeDeck oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentCharacter.id != widget.currentCharacter.id) {
      _resetSwipeState(notify: true);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _animateTo(
    double targetOffset, {
    required Duration duration,
    Curve curve = Curves.easeOutCubic,
  }) async {
    _offsetAnimation = Tween<double>(
      begin: _dragOffset,
      end: targetOffset,
    ).animate(CurvedAnimation(parent: _animationController, curve: curve));
    _animationController.duration = duration;
    await _animationController.forward(from: 0);
  }

  Future<void> _animateBackToCenter() async {
    await _animateTo(0, duration: _snapBackDuration);
    _resetSwipeState(notify: true);
  }

  Future<void> _animateOffscreen(VideoSwipeDirection direction) async {
    final exitOffset =
        (direction == VideoSwipeDirection.left ? -1 : 1) * _deckWidth * 1.15;
    await _animateTo(exitOffset, duration: _commitDuration);
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if (!widget.isInteractionEnabled) {
      return;
    }

    if (_animationController.isAnimating) {
      _animationController.stop();
    }

    setState(() {
      _dragOffset += details.delta.dx;
    });
    _notifyPresentation();
  }

  Future<void> _handleDragEnd(DragEndDetails details) async {
    if (!widget.isInteractionEnabled) {
      return;
    }

    final velocity = details.primaryVelocity ?? 0;
    final direction = _resolveDirection(_dragOffset, velocity);
    if (direction == null) {
      await _animateBackToCenter();
      return;
    }

    final shouldCommit = shouldCommitCharacterSwipe(
      dragOffset: _dragOffset,
      viewportWidth: _deckWidth,
      primaryVelocity: velocity,
    );
    if (!shouldCommit) {
      await _animateBackToCenter();
      return;
    }

    await _animateOffscreen(direction);
    await widget.onCommitSwipe(direction);
  }

  void _resetSwipeState({required bool notify}) {
    if (_animationController.isAnimating) {
      _animationController.stop();
    }
    _offsetAnimation = null;
    if (_dragOffset != 0) {
      setState(() {
        _dragOffset = 0;
      });
    }
    if (notify) {
      _notifyPresentation();
    }
  }

  VideoSwipeDirection? _resolveDirection(double offset, double velocity) {
    if (offset.abs() > 1) {
      return offset < 0 ? VideoSwipeDirection.left : VideoSwipeDirection.right;
    }
    if (velocity.abs() < 1) {
      return null;
    }
    return velocity < 0 ? VideoSwipeDirection.left : VideoSwipeDirection.right;
  }

  double _progressForWidth(double width) {
    final threshold = width * kVideoSwipeCommitThresholdFraction;
    if (threshold <= 0) {
      return 0;
    }
    return (_dragOffset.abs() / threshold).clamp(0.0, 1.0);
  }

  void _notifyPresentation() {
    if (!mounted) {
      return;
    }
    widget.onPresentationChanged(
      VideoCharacterSwipePresentation(
        dragOffset: _dragOffset,
        progress: _progressForWidth(_deckWidth),
        direction: _resolveDirection(_dragOffset, 0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _deckWidth = constraints.maxWidth > 0 ? constraints.maxWidth : 1;
        final progress = _progressForWidth(_deckWidth);
        final direction = _resolveDirection(_dragOffset, 0);
        final previewShift = switch (direction) {
          VideoSwipeDirection.left => 28 * (1 - progress),
          VideoSwipeDirection.right => -28 * (1 - progress),
          null => 0.0,
        };
        final previewScale = _previewBaseScale + (0.06 * progress);
        final previewOpacity = (_previewBaseOpacity + (0.5 * progress)).clamp(
          _previewBaseOpacity,
          0.72,
        );
        final normalizedOffset = (_dragOffset / _deckWidth).clamp(-1.0, 1.0);
        final rotation = normalizedOffset * _maxRotationRadians;
        final previewCharacter = switch (direction) {
          VideoSwipeDirection.left => widget.nextCharacter,
          VideoSwipeDirection.right => widget.previousCharacter,
          null => null,
        };

        return GestureDetector(
          key: VideoCharacterSwipeDeck.gestureKey,
          behavior: HitTestBehavior.translucent,
          onHorizontalDragUpdate: _handleDragUpdate,
          onHorizontalDragEnd: (details) {
            unawaited(_handleDragEnd(details));
          },
          onHorizontalDragCancel: () {
            unawaited(_animateBackToCenter());
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (previewCharacter != null)
                Positioned.fill(
                  child: Transform.translate(
                    offset: Offset(previewShift, 0),
                    child: Transform.scale(
                      scale: previewScale,
                      child: Opacity(
                        key: VideoCharacterSwipeDeck.backOpacityKey,
                        opacity: previewOpacity,
                        child: IgnorePointer(
                          child: widget.stageBuilder(
                            context,
                            previewCharacter,
                            true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              Positioned.fill(
                child: Transform(
                  key: VideoCharacterSwipeDeck.frontTransformKey,
                  transform: Matrix4.identity()
                    ..translate(_dragOffset)
                    ..rotateZ(rotation),
                  alignment: Alignment.center,
                  child: IgnorePointer(
                    child: widget.stageBuilder(
                      context,
                      widget.currentCharacter,
                      false,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
