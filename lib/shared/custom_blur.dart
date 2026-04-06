import 'dart:ui';

import 'package:flutter/material.dart';

class CustomBlur extends StatelessWidget {
  final double sigmaX;
  final double sigmaY;
  final Color color;
  final double blurRadius;
  final double offsetX;
  final double offsetY;
  final double alpha;

  const CustomBlur({
    super.key,
    this.sigmaX = 100,
    this.sigmaY = 100,
    this.color = const Color(0xFFFA96BA),
    this.blurRadius = 0,
    this.offsetX = 0,
    this.offsetY = 0,
    this.alpha = 0.30,
  });

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
      child: Opacity(
        opacity: alpha,
        child: Container(
          width: 464,
          height: 464,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
      ),
    );
  }
}
