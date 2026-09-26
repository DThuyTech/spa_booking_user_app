import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../app/di/dependency_injection.dart';
import '../../../app/router/app_router.gr.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/storage/preferences_storage.dart';
import '../../../shared/design_system/components/buttons/app_glass_button.dart';
import 'widgets/onboarding_glass_card.dart';
import 'widgets/onboarding_skip_button.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _completeOnboarding() async {
    HapticFeedback.lightImpact();
    if (sl.isRegistered<PreferencesStorage>()) {
      await sl<PreferencesStorage>().setBool('has_completed_onboarding', true);
    }
    if (mounted) {
      context.router.replace(const LoginRoute());
    }
  }

  void _goToNextPage() {
    HapticFeedback.selectionClick();
    if (_currentPage < 3) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    } else {
      _completeOnboarding();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFF9EDE7),
        body: Stack(
          children: [
            // PageView containing 4 onboarding screens
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              children: [
                // Screen 1: Welcome Screen (with Glass Pill Button)
                _buildScreen(
                  imagePath: AssetConstants.imgWelcome,
                  showSkip: true,
                  skipHasPill: false,
                  bottomContent: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: AppGlassButton(
                      label: 'Get Started',
                      height: 56,
                      onPressed: _goToNextPage,
                    ),
                  ),
                ),

                // Screen 2: Choose your service (with Glass Card)
                _buildScreen(
                  imagePath: AssetConstants.imgService,
                  showSkip: true,
                  skipHasPill: true,
                  bottomContent: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: OnboardingGlassCard(
                      title: 'Choose your service',
                      description:
                          'From hair to nails, select exactly what you need in a few taps.',
                      stepIndex: 0,
                      totalSteps: 3,
                      buttonText: 'Next',
                      onButtonPressed: _goToNextPage,
                    ),
                  ),
                ),

                // Screen 3: Booking confirmed (with Glass Card)
                _buildScreen(
                  imagePath: AssetConstants.imgBooking,
                  showSkip: true,
                  skipHasPill: true,
                  bottomContent: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: OnboardingGlassCard(
                      title: 'Booking confirmed',
                      description:
                          'Get reminders and arrive exactly when your salon is ready for you.',
                      stepIndex: 1,
                      totalSteps: 3,
                      buttonText: 'Next',
                      onButtonPressed: _goToNextPage,
                    ),
                  ),
                ),

                // Screen 4: No more waiting (with Glass Card)
                _buildScreen(
                  imagePath: AssetConstants.imgUnWait,
                  showSkip: true,
                  skipHasPill: true,
                  bottomContent: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: OnboardingGlassCard(
                      title: 'No more waitting',
                      description:
                          'Get reminders and arrive exactly when your salon is ready for you.',
                      stepIndex: 2,
                      totalSteps: 3,
                      buttonText: 'Get Started',
                      onButtonPressed: _completeOnboarding,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScreen({
    required String imagePath,
    required bool showSkip,
    required bool skipHasPill,
    required Widget bottomContent,
  }) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background Artwork Image
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFFDFD3),
                    Color(0xFFF9EDE7),
                  ],
                ),
              ),
            );
          },
        ),

        // Skip Button at Top-Right
        if (showSkip)
          Positioned(
            top: 0,
            right: 16,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: OnboardingSkipButton(
                  onSkip: _completeOnboarding,
                  showPillBackground: skipHasPill,
                ),
              ),
            ),
          ),

        // Bottom Glassmorphic Component
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: bottomContent,
            ),
          ),
        ),
      ],
    );
  }
}
