import 'package:chatface/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextTheme textTheme(ColorScheme colorScheme) {
    final Color displayColor = colorScheme.onSurface;
    final Color bodyColor = colorScheme.onSurface;
    final Color mutedColor = colorScheme.onSurfaceVariant;

    return TextTheme(
      displayLarge: body(
        57,
        weight: FontWeight.w700,
        letterSpacing: -0.2 / 57,
        height: 57 * 1.15,
        color: displayColor,
      ),
      displayMedium: body(
        45,
        weight: FontWeight.w700,
        letterSpacing: -0.2 / 45,
        height: 45 * 1.15,
        color: displayColor,
      ),
      displaySmall: body(
        36,
        weight: FontWeight.w700,
        letterSpacing: -0.2 / 36,
        height: 36 * 1.15,
        color: displayColor,
      ),
      headlineLarge: body(
        32,
        weight: FontWeight.w700,
        letterSpacing: -0.2 / 32,
        height: 32 * 1.15,
        color: displayColor,
      ),
      headlineMedium: body(
        28,
        weight: FontWeight.w600,
        letterSpacing: -0.2 / 28,
        height: 28 * 1.15,
        color: displayColor,
      ),
      headlineSmall: body(
        24,
        weight: FontWeight.w600,
        letterSpacing: -0.2 / 24,
        height: 24 * 1.15,
        color: displayColor,
      ),
      titleLarge: body(
        22,
        weight: FontWeight.w600,
        letterSpacing: 0.05 / 22,
        height: 22 * 1.15,
        color: displayColor,
      ),
      titleMedium: body(
        18,
        weight: FontWeight.w600,
        letterSpacing: 0.1 / 18,
        height: 18 * 1.3,
        color: displayColor,
      ),
      titleSmall: body(
        16,
        weight: FontWeight.w600,
        letterSpacing: 0.1 / 16,
        height: 16 * 1.3,
        color: displayColor,
      ),
      bodyLarge: body(16, color: bodyColor),
      bodyMedium: body(14, color: bodyColor),
      bodySmall: body(12, color: mutedColor, height: 12 * 1.4),
      labelLarge: body(
        14,
        weight: FontWeight.w600,
        letterSpacing: 0.1 / 14,
        height: 14 * 1.25,
        color: bodyColor,
      ),
      labelMedium: body(
        12,
        weight: FontWeight.w600,
        letterSpacing: 0.4 / 12,
        height: 12 * 1.25,
        color: mutedColor,
      ),
      labelSmall: body(
        11,
        weight: FontWeight.w600,
        letterSpacing: 0.5 / 11,
        height: 11 * 1.25,
        color: mutedColor,
      ),
    );
  }

  static TextStyle heading(
    double size,
    FontWeight weight, {
    double letterSpacing = -0.2,
    double height = 1.15,
    Color? color,
  }) {
    return GoogleFonts.rubik(
      fontSize: size,
      fontWeight: weight,
      letterSpacing: letterSpacing,
      height: height,
      color: color ?? AppColors.black,
    );
  }

  static TextStyle bottomNavBar(
    double size, {
    FontWeight weight = FontWeight.w400,
    double letterSpacing = 0,
    double height = 1.2,
    Color? color,
  }) {
    return GoogleFonts.rubik(
      fontSize: size,
      fontWeight: weight,
      letterSpacing: letterSpacing,
      height: height,
      color: color ?? AppColors.black,
    );
  }

  static TextStyle body(
    double size, {
    FontWeight weight = FontWeight.w400,
    double? letterSpacing,
    double? height,
    Color? color,
  }) {
    return GoogleFonts.rubik(
      fontSize: size,
      fontWeight: weight,
      letterSpacing: letterSpacing != null ? size * letterSpacing : null,
      height: height != null ? height / size : null,
      color: color ?? AppColors.black,
    );
  }
}
