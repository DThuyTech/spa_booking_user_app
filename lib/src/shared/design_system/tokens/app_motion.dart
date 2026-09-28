import 'package:flutter/widgets.dart';

/// Board Ơi Global Motion System
///
/// Rule: Animations are purposeful, subtle, and consistent.
/// Never random. Never distracting. Never bouncy.
abstract final class AppMotion {
  // ---------------------------------------------------------------------------
  // Duration Tokens
  // ---------------------------------------------------------------------------

  /// 80ms — micro-interactions: icon swap, chip select, ripple
  static const Duration instant = Duration(milliseconds: 80);

  /// 150ms — fast: button press, filter chip, toggle, badge
  static const Duration fast = Duration(milliseconds: 150);

  /// 220ms — normal: tab switch, card hover, small reveals
  static const Duration normal = Duration(milliseconds: 220);

  /// 300ms — medium: page enter, card expand, bottom sheet
  static const Duration medium = Duration(milliseconds: 300);

  /// 400ms — slow: page transitions, image reveal, feed entry
  static const Duration slow = Duration(milliseconds: 400);

  /// 600ms — very slow: onboarding, success state, hero reveal
  static const Duration verySlow = Duration(milliseconds: 600);

  // Aliases for convenient naming
  static const Duration durationInstant = instant;
  static const Duration durationFast = fast;
  static const Duration durationNormal = normal;
  static const Duration durationMedium = medium;
  static const Duration durationSlow = slow;
  static const Duration durationVerySlow = verySlow;

  // ---------------------------------------------------------------------------
  // Easing Curves
  // ---------------------------------------------------------------------------

  /// General purpose: most animations
  static const Curve standard = Curves.easeInOutCubic;

  /// Decelerate: element entering the screen
  static const Curve decelerate = Curves.easeOutCubic;

  /// Accelerate: element leaving the screen
  static const Curve accelerate = Curves.easeInCubic;

  /// Spring: subtle for interactive feedback (not bouncy)
  static const Curve spring = Curves.easeOutQuart;

  /// Enter: page / card entering (from below or from opacity 0)
  static const Curve enter = Curves.easeOutCubic;

  /// Exit: page / card leaving
  static const Curve exit = Curves.easeInCubic;

  // Curve aliases
  static const Curve curveStandard = standard;
  static const Curve curveDecelerate = decelerate;
  static const Curve curveAccelerate = accelerate;
  static const Curve curveSpring = spring;
  static const Curve curveEntrance = enter;
  static const Curve curveEnter = enter;
  static const Curve curveExit = exit;

  // ---------------------------------------------------------------------------
  // Scale Tokens (for button press animation)
  // ---------------------------------------------------------------------------

  /// Normal scale — rest state
  static const double scaleNormal = 1.0;

  /// Pressed scale — tactile press down
  static const double scalePressed = 0.97;

  /// Active scale — selected/active state
  static const double scaleActive = 1.02;

  // ---------------------------------------------------------------------------
  // Stagger helpers (for list animations)
  // ---------------------------------------------------------------------------

  /// Base stagger interval between list item animations
  static const Duration staggerBase = Duration(milliseconds: 40);

  /// Max stagger items (don't animate beyond this many independently)
  static const int staggerMaxItems = 6;

  /// Stagger delay for item at [index]
  static Duration staggerDelay(int index) => Duration(
    milliseconds: staggerBase.inMilliseconds * index.clamp(0, staggerMaxItems),
  );

  // ---------------------------------------------------------------------------
  // Offset Tokens (for enter/exit translations)
  // ---------------------------------------------------------------------------

  /// Small vertical enter offset — cards, list items
  static const double enterOffsetY = 12.0;

  /// Medium vertical enter offset — bottom sheets, page enter
  static const double enterOffsetYMedium = 24.0;

  /// Large vertical enter offset — modal, full pages
  static const double enterOffsetYLarge = 48.0;
}
