import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../shared/design_system/tokens/app_motion.dart';
import '../session/session_manager.dart';
import 'app_router.gr.dart';
import 'guards/auth_guard.dart';
import 'guards/guest_guard.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  final SessionManager sessionManager;

  AppRouter({required this.sessionManager});

  @override
  RouteType get defaultRouteType => RouteType.custom(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curved = CurvedAnimation(
            parent: animation,
            curve: AppMotion.curveEntrance,
          );
          return FadeTransition(
            opacity: curved,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 0.03),
                end: Offset.zero,
              ).animate(curved),
              child: child,
            ),
          );
        },
        duration: AppMotion.durationMedium,
        reverseDuration: const Duration(milliseconds: 250),
      );

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: SplashRoute.page,
      initial: true,
    ),
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(
      page: RootRoute.page,
      guards: [AuthGuard(sessionManager)],
    ),
    AutoRoute(
      page: HomeRoute.page,
      guards: [AuthGuard(sessionManager)],
    ),
    AutoRoute(
      page: LoginRoute.page,
      guards: [GuestGuard(sessionManager)],
    ),
    AutoRoute(
      page: RegisterRoute.page,
      guards: [GuestGuard(sessionManager)],
    ),
    AutoRoute(
      page: OtpVerificationRoute.page,
      guards: [GuestGuard(sessionManager)],
    ),
  ];
}
