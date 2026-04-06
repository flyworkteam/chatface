import 'dart:ui';

import 'package:flutter/material.dart';

class GlassIconButton extends StatelessWidget {
  const GlassIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.size = 44,
    this.backgroundColor,
  });

  final Widget icon;
  final VoidCallback? onPressed;
  final double size;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final color = backgroundColor ?? Colors.white.withValues(alpha: 0.08);

    return ClipRRect(
      borderRadius: BorderRadius.circular(size),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
        child: Material(
          color: color,
          child: InkWell(
            onTap: onPressed,
            child: Container(
              width: size,
              height: size,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size),
              ),
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
