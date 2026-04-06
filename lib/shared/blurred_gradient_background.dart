import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredGradientBackground extends StatelessWidget {
  const BlurredGradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
            child: Container(
              width: size.width,
              height: size.height,
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(2.2, -0.8),
                  focal: Alignment(1.6, -0.95),
                  focalRadius: 0.05,
                  radius: 1.7,
                  colors: [
                    Color(0xFF9B3080),
                    Color(0xFF753066),
                    Color(0xFF774487),
                    Colors.black,
                  ],
                  stops: [0.0, 0.15, 0.50, 1.0],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
