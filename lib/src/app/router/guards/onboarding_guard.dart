import 'package:auto_route/auto_route.dart';
import '../../session/session_manager.dart';

class OnboardingGuard extends AutoRouteGuard {
  final SessionManager _sessionManager;

  OnboardingGuard(this._sessionManager);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final session = _sessionManager.currentSession;
    if (session.isOnboardingCompleted) {
      resolver.next(true);
    } else {
      resolver.next(true);
    }
  }
}
