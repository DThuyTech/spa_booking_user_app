import 'package:auto_route/auto_route.dart';
import '../../session/session_manager.dart';

class RoleGuard extends AutoRouteGuard {
  final SessionManager _sessionManager;
  final String requiredRole;

  RoleGuard(this._sessionManager, {required this.requiredRole});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final session = _sessionManager.currentSession;
    if (session.status.isAuthenticated && session.role == requiredRole) {
      resolver.next(true);
    } else {
      resolver.next(false);
    }
  }
}
