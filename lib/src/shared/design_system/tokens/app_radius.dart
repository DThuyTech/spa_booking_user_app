import 'package:flutter/widgets.dart';

/// Board Ơi Corner Radius Scale
///
/// Principles:
/// - Controls: 10–12px
/// - Buttons: 12–16px
/// - Cards: 18–24px
/// - Hero surfaces: 24–32px
abstract final class AppRadius {
  static const double none = 0.0;
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0; // Controls & inputs
  static const double button = 14.0; // Primary & secondary buttons
  static const double lg = 16.0;
  static const double card = 20.0; // Layered & content cards
  static const double xl = 24.0;
  static const double hero = 28.0; // Hero & sheet surfaces
  static const double full = 999.0; // Chips & pill tags

  // BorderRadius helpers
  static const BorderRadius borderZero = BorderRadius.zero;
  static const BorderRadius borderSm = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius borderMd = BorderRadius.all(Radius.circular(md));
  static const BorderRadius borderButton = BorderRadius.all(
    Radius.circular(button),
  );
  static const BorderRadius borderLg = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius borderCard = BorderRadius.all(
    Radius.circular(card),
  );
  static const BorderRadius borderXl = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius borderHero = BorderRadius.all(
    Radius.circular(hero),
  );
  static const BorderRadius borderFull = BorderRadius.all(
    Radius.circular(full),
  );
}
