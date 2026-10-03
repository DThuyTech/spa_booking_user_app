import 'package:flutter/material.dart';

/// Board Ơi Color System
///
/// Design Direction:
/// Modern Social Gaming + Soft Editorial + Premium Minimalism
///
/// Palette Foundation:
/// Warm White + Coffee Brown + Soft Beige + Terracotta Accent
abstract final class AppColors {
  // Brand Foundation - Warm White, White & Soft Beige
  static const Color background = Color(0xFFF7F5F0); // Warm Canvas / Warm White
  static const Color canvasWarm = Color(0xFFF7F5F0); // Warm White Canvas
  static const Color surface = Color(0xFFFFFFFF); // Pure White Surface
  static const Color surfaceWarm = Color(0xFFFAF8F5); // Soft Beige Surface

  // Brand Coffee Browns & Warm Accents (Section 1)
  static const Color primaryBrown = Color(
    0xFF6B4F3A,
  ); // #6B4F3A Primary Brand Brown
  static const Color darkBrown = Color(
    0xFF2C241F,
  ); // #2C241F Dark Brown Text / Buttons
  static const Color darkText = Color(0xFF2C241F); // Dark Espresso Text
  static const Color secondaryText = Color(
    0xFF756C64,
  ); // #756C64 Secondary Text
  static const Color softBrown = Color(0xFFA88F7A); // #A88F7A Soft Brown
  static const Color lightBrown = Color(0xFFA88F7A); // Soft Brown Accent
  static const Color lightBrownSoft = Color(0xFFEDE7DE); // Soft Brown Wash
  static const Color lightBrownLight = Color(
    0xFFFAF7F2,
  ); // Pale Brown Tag Surface
  static const Color warmBeige = Color(
    0xFFEDE7DE,
  ); // #EDE7DE Warm Neutral Beige
  static const Color border = Color(0xFFE4DED6); // #E4DED6 Soft Border Line
  static const Color accent = Color(
    0xFFC8754D,
  ); // #C8754D Muted Terracotta Accent
  static const Color accentLight = Color(0xFFF7EDE8); // Pale Terracotta Wash
  static const Color accentHover = Color(0xFFB5633C);

  // Backward compatibility alias
  static const Color mascotLilac = Color(0xFF6B4F3A);
  static const Color mascotLilacLight = Color(0xFFEDE7DE);

  // Semantic Status
  static const Color success = Color(0xFF5C8A67); // Sage Green
  static const Color successLight = Color(0xFFEEF5F0);
  static const Color warning = Color(0xFFD99B43); // Warm Ochre
  static const Color warningLight = Color(0xFFFDF7EE);
  static const Color error = Color(0xFFB85C50); // Muted Terracotta Red
  static const Color errorLight = Color(0xFFFAF0EF);
  static const Color info = Color(0xFF608098); // Muted Slate
  static const Color infoLight = Color(0xFFF0F5F8);

  // Backward-compatible neutral tokens aligned with Board Ơi palette
  static const Color neutral50 = Color(0xFFF7F5F0);
  static const Color neutral100 = Color(0xFFEDE7DE);
  static const Color neutral200 = Color(0xFFE4DED6);
  static const Color neutral300 = Color(0xFFD3CBC1);
  static const Color neutral400 = Color(0xFFA88F7A);
  static const Color neutral500 = Color(0xFF756C64);
  static const Color neutral600 = Color(0xFF5A5149);
  static const Color neutral700 = Color(0xFF453D37);
  static const Color neutral800 = Color(0xFF332B25);
  static const Color neutral900 = Color(0xFF2C241F);
  static const Color neutral950 = Color(0xFF1E1713);

  // Backward-compatible primary shades aligned with primaryBrown
  static const Color primary50 = Color(0xFFF7EDE8);
  static const Color primary100 = Color(0xFFEDE7DE);
  static const Color primary500 = Color(0xFF8B674D);
  static const Color primary600 = Color(0xFF6B4F3A);
  static const Color primary700 = Color(0xFF543C2B);

  // Backward-compatible secondary shades aligned with terracotta accent
  static const Color secondary500 = Color(0xFFC8754D);
  static const Color secondary600 = Color(0xFFB5633C);

  // Constants
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;
}
