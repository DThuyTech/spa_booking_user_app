import 'dart:async';
import 'package:flutter/foundation.dart';
import '../session/app_session.dart';
import '../session/session_manager.dart';

class RouterRefreshNotifier extends ChangeNotifier {
  final SessionManager _sessionManager;
  late final StreamSubscription<AppSession> _subscription;

  RouterRefreshNotifier(this._sessionManager) {
    _subscription = _sessionManager.sessionStream.listen((_) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
