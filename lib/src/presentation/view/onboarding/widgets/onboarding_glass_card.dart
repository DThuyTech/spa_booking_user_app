import 'package:flutter/material.dart';
import '../../../../shared/design_system/components/cards/app_glass_card.dart';
import 'onboarding_page_indicator.dart';

/// The frosted glass bottom card matching Image 3 specifications.
class OnboardingGlassCard extends StatefulWidget {
  final String title;
  final String description;
  final int stepIndex; // 0, 1, 2 for the 3 service screens
  final int totalSteps;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const OnboardingGlassCard({
    super.key,
    required this.title,
    required this.description,
    required this.stepIndex,
    this.totalSteps = 3,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  State<OnboardingGlassCard> createState() => _OnboardingGlassCardState();
}

class _OnboardingGlassCardState extends State<OnboardingGlassCard> {
  bool _isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return AppGlassCard(
      padding: const EdgeInsets.fromLTRB(26, 26, 26, 24),
      borderRadius: 32,
      blurSigma: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Color(0xFFFA7257),
              letterSpacing: -0.4,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 10),

          // Subtitle / Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF6E625A),
                height: 1.45,
              ),
            ),
          ),
          const SizedBox(height: 18),

          // Page Indicator
          Center(
            child: OnboardingPageIndicator(
              count: widget.totalSteps,
              activeIndex: widget.stepIndex,
              activeColor: const Color(0xFFFA7257),
              inactiveColor: const Color(0xFFD6CBC3),
            ),
          ),
          const SizedBox(height: 22),

          // Coral Action Button
          AnimatedScale(
            scale: _isButtonPressed ? 0.97 : 1.0,
            duration: const Duration(milliseconds: 120),
            curve: Curves.easeInOut,
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFFA7355), Color(0xFFF26242)],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFF26242).withValues(alpha: 0.38),
                    blurRadius: 18,
                    offset: const Offset(0, 7),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: widget.onButtonPressed,
                  onHighlightChanged: (highlighted) {
                    if (mounted) {
                      setState(() => _isButtonPressed = highlighted);
                    }
                  },
                  borderRadius: BorderRadius.circular(26),
                  splashColor: Colors.white.withValues(alpha: 0.25),
                  highlightColor: Colors.white.withValues(alpha: 0.1),
                  child: Center(
                    child: Text(
                      widget.buttonText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
