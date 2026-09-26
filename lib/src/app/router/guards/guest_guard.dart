import 'package:auto_route/auto_route.dart';
import '../../session/session_manager.dart';
import '../app_router.gr.dart';

/// Route guard ensuring authenticated users cannot navigate into guest screens
/// such as Login or OTP Verification.
class GuestGuard extends AutoRouteGuard {
  final SessionManager _sessionManager;

  GuestGuard(this._sessionManager);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final isAuthenticated =
        _sessionManager.currentSession.status.isAuthenticated;
    if (isAuthenticated) {
      resolver.next(false);
      router.replace(const RootRoute());
    } else {
      resolver.next(true);
    }
  }
}
