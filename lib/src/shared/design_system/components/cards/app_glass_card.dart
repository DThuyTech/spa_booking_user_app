import 'dart:ui';
import 'package:flutter/material.dart';

/// Reusable glassmorphic frosted card matching Image 3 design specifications.
class AppGlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double blurSigma;
  final Color? borderColor;
  final List<Color>? gradientColors;
  final List<BoxShadow>? shadows;
  final double? width;
  final double? height;

  const AppGlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.fromLTRB(26, 26, 26, 24),
    this.borderRadius = 32,
    this.blurSigma = 20,
    this.borderColor,
    this.gradientColors,
    this.shadows,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final borderCol = borderColor ?? Colors.white.withValues(alpha: 0.85);
    final colors =
        gradientColors ??
        [
          Colors.white.withValues(alpha: 0.88),
          Colors.white.withValues(alpha: 0.72),
        ];
    final boxShadows =
        shadows ??
        [
          BoxShadow(
            color: const Color(0xFFC8754D).withValues(alpha: 0.10),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.40),
            blurRadius: 10,
            offset: const Offset(0, -1),
          ),
        ];

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadows,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: colors,
              ),
              border: Border.all(color: borderCol, width: 1.5),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
