import 'package:flutter/material.dart';

class AppBorderRadius {
  AppBorderRadius._();

  static const double xs = 8;
  static const double sm = 12;
  static const double md = 15;
  static const double lg = 20;
  static const double xl = 28;
  static const double xxl = 32;
  static const double xxxl = 50;
  static const double pill = 10;

  static const BorderRadius xsRadius = BorderRadius.all(Radius.circular(xs));
  static const BorderRadius smRadius = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius mdRadius = BorderRadius.all(Radius.circular(md));
  static const BorderRadius lgRadius = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius xlRadius = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius xxlRadius = BorderRadius.all(Radius.circular(xxl));
  static const BorderRadius xxxlRadius = BorderRadius.all(
    Radius.circular(xxxl),
  );
  static const BorderRadius pillRadius = BorderRadius.all(
    Radius.circular(pill),
  );

  static RoundedRectangleBorder rounded([double radius = md]) =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));

  static RoundedRectangleBorder card = rounded(lg);

  static const RoundedRectangleBorder bottomSheet = RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(xl)),
  );
}
