import 'package:flutter/material.dart';

/// Board Ơi Soft Neumorphic Shadow System
///
/// Philosophy: Soft modern surfaces with warm-tinted diffused depth.
/// NOT heavy neumorphism — supports the UI, never dominates it.
abstract final class AppShadows {
  // ---------------------------------------------------------------------------
  // Soft Neumorphic Levels
  // ---------------------------------------------------------------------------

  /// NEUMORPHIC_LOW — chips, small controls, selected states
  static const List<BoxShadow> neuLow = [
    BoxShadow(
      color: Color(0x142C241F), // warm dark shadow
      offset: Offset(3, 3),
      blurRadius: 8,
      spreadRadius: -1,
    ),
    BoxShadow(
      color: Color(0xCCFCFBF8), // warm light highlight
      offset: Offset(-2, -2),
      blurRadius: 6,
      spreadRadius: -1,
    ),
  ];

  /// NEUMORPHIC_MEDIUM — cards, floating elements, bottom sheets
  static const List<BoxShadow> neuMedium = [
    BoxShadow(
      color: Color(0x182C241F),
      offset: Offset(6, 6),
      blurRadius: 16,
      spreadRadius: -2,
    ),
    BoxShadow(
      color: Color(0xDDFCFBF8),
      offset: Offset(-4, -4),
      blurRadius: 12,
      spreadRadius: -2,
    ),
  ];

  /// NEUMORPHIC_HIGH — primary FAB, hero elements (use sparingly)
  static const List<BoxShadow> neuHigh = [
    BoxShadow(
      color: Color(0x242C241F),
      offset: Offset(8, 8),
      blurRadius: 24,
      spreadRadius: -4,
    ),
    BoxShadow(
      color: Color(0xEEFCFBF8),
      offset: Offset(-6, -6),
      blurRadius: 18,
      spreadRadius: -4,
    ),
  ];

  // ---------------------------------------------------------------------------
  // Semantic Shadows (flat, warm)
  // ---------------------------------------------------------------------------

  /// Subtle card elevation — 2dp soft warm
  static const List<BoxShadow> card = [
    BoxShadow(
      color: Color(0x0E2C241F),
      offset: Offset(0, 2),
      blurRadius: 10,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x082C241F),
      offset: Offset(0, 1),
      blurRadius: 3,
      spreadRadius: -1,
    ),
  ];

  /// Floating card / elevated surface
  static const List<BoxShadow> floating = [
    BoxShadow(
      color: Color(0x162C241F),
      offset: Offset(0, 8),
      blurRadius: 24,
      spreadRadius: -4,
    ),
    BoxShadow(
      color: Color(0x0A2C241F),
      offset: Offset(0, 3),
      blurRadius: 8,
      spreadRadius: -2,
    ),
  ];

  /// Modal / bottom sheet shadow
  static const List<BoxShadow> modal = [
    BoxShadow(
      color: Color(0x242C241F),
      offset: Offset(0, -4),
      blurRadius: 32,
      spreadRadius: -4,
    ),
    BoxShadow(
      color: Color(0x142C241F),
      offset: Offset(0, 16),
      blurRadius: 48,
      spreadRadius: -8,
    ),
  ];

  /// Bottom nav / dock shadow
  static const List<BoxShadow> dock = [
    BoxShadow(
      color: Color(0x1A2C241F),
      offset: Offset(0, 8),
      blurRadius: 28,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x0A2C241F),
      offset: Offset(0, 2),
      blurRadius: 8,
      spreadRadius: -2,
    ),
  ];

  /// Accent glow — for primary CTAs with accent color
  static List<BoxShadow> accentGlow(Color color) => [
    BoxShadow(
      color: color.withValues(alpha: 0.30),
      offset: const Offset(0, 4),
      blurRadius: 16,
      spreadRadius: -2,
    ),
    BoxShadow(
      color: color.withValues(alpha: 0.15),
      offset: const Offset(0, 1),
      blurRadius: 4,
    ),
  ];

  // Backward compatibility
  static const List<BoxShadow> sm = card;
  static const List<BoxShadow> md = floating;
  static const List<BoxShadow> lg = modal;
}
