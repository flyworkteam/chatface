import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TypingIndicator extends HookWidget {
  const TypingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 900),
    );

    useEffect(() {
      controller.repeat();
      return null;
    }, const []);

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.10),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
            bottomRight: Radius.circular(18),
            bottomLeft: Radius.circular(4),
          ),
        ),
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(3, (i) {
                final phase = (controller.value * 2 * math.pi) - (i * 0.9);
                final scale = 0.6 + 0.4 * ((math.sin(phase) + 1) / 2);
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: 8 * scale,
                  height: 8 * scale,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(
                      alpha: 0.5 + 0.5 * scale - 0.5,
                    ),
                    shape: BoxShape.circle,
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
