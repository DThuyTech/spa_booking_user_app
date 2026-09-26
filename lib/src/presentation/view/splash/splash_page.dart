import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../app/di/dependency_injection.dart';
import '../../../app/router/app_router.gr.dart';
import '../../../app/session/session_manager.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/storage/preferences_storage.dart';
import 'package:board_oi/src/presentation/bloc/auth_session/auth_session_bloc.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOut,
    );

    _scaleAnimation = Tween<double>(begin: 0.96, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeOutCubic),
    );

    _animController.forward();
    _scheduleNavigation();
  }

  void _scheduleNavigation() {
    _navigationTimer = Timer(const Duration(milliseconds: 2200), () async {
      if (!mounted) return;

      // 1. Check if authenticated
      if (sl.isRegistered<AuthSessionBloc>()) {
        final authSessionBloc = sl<AuthSessionBloc>();
        if (authSessionBloc.state.isAuthenticated) {
          context.router.replace(const RootRoute());
          return;
        }
      } else if (sl.isRegistered<SessionManager>()) {
        final sessionManager = sl<SessionManager>();
        if (sessionManager.currentSession.status.isAuthenticated) {
          context.router.replace(const RootRoute());
          return;
        }
      }

      // 2. Check if onboarding completed
      bool hasCompletedOnboarding = false;
      if (sl.isRegistered<PreferencesStorage>()) {
        final prefs = sl<PreferencesStorage>();
        hasCompletedOnboarding =
            (await prefs.getBool('has_completed_onboarding')) ?? false;
      }

      if (!mounted) return;

      if (!hasCompletedOnboarding) {
        context.router.replace(const OnboardingRoute());
      } else {
        context.router.replace(const LoginRoute());
      }
    });
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFFFECE5),
        body: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: SizedBox.expand(
              child: Image.asset(
                AssetConstants.splashImg,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFFFECE5),
                          Color(0xFFF9DCD1),
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Aura',
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFFC85A3C),
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'LUMINOUS SALON',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2.5,
                              color: Color(0xFF6E625A),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
