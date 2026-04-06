import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  double responsiveFont(final double fontSize) {
    const baseHeight = 812;
    return fontSize * height / baseHeight;
  }

  double responsiveValue(final double value, {final bool isWidth = true}) {
    const baseWidth = 375;
    const baseHeight = 812;
    if (value == 0) return 0;
    return isWidth ? value * width / baseWidth : value * height / baseHeight;
  }

  double get responsiveAppBarHeight => responsiveValue(66, isWidth: false);

  double responsiveIconSize(final double iconSize) {
    const baseWidth = 375;
    return iconSize * width / baseWidth;
  }

  double responsiveRadius(final double radius) {
    const baseWidth = 375;
    return radius * width / baseWidth;
  }

  EdgeInsets responsivePadding({
    final double left = 0,
    final double top = 0,
    final double right = 0,
    final double bottom = 0,
  }) {
    return EdgeInsets.only(
      left: responsiveValue(left),
      top: responsiveValue(top, isWidth: false),
      right: responsiveValue(right),
      bottom: responsiveValue(bottom, isWidth: false),
    );
  }

  EdgeInsets responsiveMargin({
    final double left = 0,
    final double top = 0,
    final double right = 0,
    final double bottom = 0,
  }) {
    return EdgeInsets.only(
      left: responsiveValue(left),
      top: responsiveValue(top, isWidth: false),
      right: responsiveValue(right),
      bottom: responsiveValue(bottom, isWidth: false),
    );
  }
}

extension DateTimeExtension on DateTime {
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 7) {
      return '${difference.inDays ~/ 7}h';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}g';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}s';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}d';
    } else {
      return 'Şimdi';
    }
  }
}
