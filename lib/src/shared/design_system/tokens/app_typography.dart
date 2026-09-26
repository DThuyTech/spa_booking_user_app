import 'package:flutter/material.dart';

/// Board Ơi Typography System
///
/// Features two complementary personalities:
/// 1. Editorial Serif: Contemporary, refined, and warm for titles, hero statements, and game names.
/// 2. Clean Modern Sans-Serif: High-legibility sans for UI controls, metadata, forms, and descriptions.
abstract final class AppTypography {
  // Font families
  static const String editorialFontFamily =
      'Playfair Display'; // Fallback to serif
  static const String uiFontFamily = 'Inter'; // Fallback to sans-serif

  // ---------------------------------------------------------------------------
  // Editorial Serif Hierarchy (Headlines, Hero, Game Titles)
  // ---------------------------------------------------------------------------

  /// Large hero title: "Find your next table."
  static const TextStyle editorialHero = TextStyle(
    fontFamily: editorialFontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    height: 1.2,
  );

  /// Major screen / section title
  static const TextStyle editorialTitle = TextStyle(
    fontFamily: editorialFontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
    height: 1.25,
  );

  /// Card or sub-section editorial headline
  static const TextStyle editorialHeadline = TextStyle(
    fontFamily: editorialFontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.2,
    height: 1.3,
  );

  /// Prominent game name / banner title
  static const TextStyle editorialGameName = TextStyle(
    fontFamily: editorialFontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.1,
    height: 1.3,
  );

  // ---------------------------------------------------------------------------
  // Modern UI Sans-Serif Hierarchy (Controls, Metadata, Descriptions)
  // ---------------------------------------------------------------------------

  static const TextStyle displayLarge = TextStyle(
    fontFamily: uiFontFamily,
    fontSize: 30,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    height: 1.25,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: uiFontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.4,
    height: 1.25,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: uiFontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.2,
    height: 1.3,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: uiFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.35,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: uiFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    height: 1.4,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: uiFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: uiFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.2,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: uiFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.3,
    height: 1.4,
  );

  static const TextStyle labelLarge = TextStyle(
    fontFamily: uiFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
    height: 1.4,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: uiFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    height: 1.4,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: uiFontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
    height: 1.4,
  );
}
