import 'package:auto_route/auto_route.dart';
import '../../session/session_manager.dart';
import '../app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  final SessionManager _sessionManager;

  AuthGuard(this._sessionManager);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final isAuthenticated =
        _sessionManager.currentSession.status.isAuthenticated;
    if (isAuthenticated) {
      resolver.next(true);
    } else {
      resolver.next(false);
      router.push(const LoginRoute());
    }
  }
}
