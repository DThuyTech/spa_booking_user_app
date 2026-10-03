import 'package:flutter/widgets.dart';

abstract final class AppSpacing {
  // Base scale
  static const double xxs = 2.0;
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double smMd = 12.0; // between sm & md
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  static const double xxxl = 64.0;

  // Semantic aliases
  static const double screenPaddingH =
      20.0; // Primary mobile horizontal padding
  static const double sectionSpacing = 32.0; // Section-to-section
  static const double heroSpacing = 48.0; // Hero / large section spacing

  // EdgeInsets helpers
  static const EdgeInsets edgeInsetsZero = EdgeInsets.zero;
  static const EdgeInsets edgeInsetsAllSm = EdgeInsets.all(sm);
  static const EdgeInsets edgeInsetsAllMd = EdgeInsets.all(md);
  static const EdgeInsets edgeInsetsAllLg = EdgeInsets.all(lg);
  static const EdgeInsets edgeInsetsHSm = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets edgeInsetsHMd = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets edgeInsetsHLg = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets edgeInsetsVSm = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets edgeInsetsVMd = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets edgeInsetsScreen = EdgeInsets.symmetric(
    horizontal: screenPaddingH,
    vertical: lg,
  );
}
