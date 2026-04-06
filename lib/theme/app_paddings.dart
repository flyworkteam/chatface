import 'package:flutter/widgets.dart';

class AppSpacing {
  AppSpacing._();

  static const double grid = 4;
  static const double xs = grid;
  static const double sm = grid * 2;
  static const double md = grid * 3;
  static const double lg = grid * 4;
  static const double xl = grid * 6;
  static const double xxl = grid * 8;
  static const double xxxl = grid * 10;
}

class AppPaddings {
  AppPaddings._();

  static const EdgeInsets none = EdgeInsets.zero;
  static const EdgeInsets xs = EdgeInsets.all(AppSpacing.xs);
  static const EdgeInsets sm = EdgeInsets.all(AppSpacing.sm);
  static const EdgeInsets md = EdgeInsets.all(AppSpacing.md);
  static const EdgeInsets lg = EdgeInsets.all(AppSpacing.lg);
  static const EdgeInsets xl = EdgeInsets.all(AppSpacing.xl);
  static const EdgeInsets xxl = EdgeInsets.all(AppSpacing.xxl);

  static const EdgeInsets horizontalPage = EdgeInsets.symmetric(
    horizontal: AppSpacing.xl,
  );

  static const EdgeInsets section = EdgeInsets.symmetric(
    horizontal: AppSpacing.xl,
    vertical: AppSpacing.lg,
  );

  static const EdgeInsets card = EdgeInsets.all(AppSpacing.lg);
  static const EdgeInsets chip = EdgeInsets.symmetric(
    horizontal: AppSpacing.sm,
    vertical: AppSpacing.xs,
  );

  static double? get large => null;

  static EdgeInsets horizontal(double value) =>
      EdgeInsets.symmetric(horizontal: value);

  static EdgeInsets vertical(double value) =>
      EdgeInsets.symmetric(vertical: value);

  static EdgeInsets symmetric({double horizontal = 0, double vertical = 0}) =>
      EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
}
