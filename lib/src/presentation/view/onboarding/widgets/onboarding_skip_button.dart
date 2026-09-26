import 'dart:ui';
import 'package:flutter/material.dart';

/// Top-right skip button for onboarding screens.
class OnboardingSkipButton extends StatelessWidget {
  final VoidCallback onSkip;
  final bool showPillBackground;

  const OnboardingSkipButton({
    super.key,
    required this.onSkip,
    this.showPillBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!showPillBackground) {
      return GestureDetector(
        onTap: onSkip,
        behavior: HitTestBehavior.opaque,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'Skip',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.1,
            ),
          ),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Material(
          color: Colors.white.withValues(alpha: 0.35),
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: onSkip,
            borderRadius: BorderRadius.circular(20),
            splashColor: Colors.white.withValues(alpha: 0.2),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.6),
                  width: 1.0,
                ),
              ),
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Color(0xFF2C241F),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
