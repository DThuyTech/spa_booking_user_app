import 'dart:async';
import 'package:flutter/foundation.dart';
import 'token_pair.dart';
import 'token_storage.dart';

typedef RefreshTokenDelegate = Future<TokenPair?> Function(String refreshToken);

class TokenRefreshCoordinator {
  final TokenStorage tokenStorage;
  final RefreshTokenDelegate? refreshDelegate;
  final VoidCallback? onSessionExpired;

  Completer<String?>? _refreshCompleter;

  TokenRefreshCoordinator({
    required this.tokenStorage,
    this.refreshDelegate,
    this.onSessionExpired,
  });

  bool get isRefreshing => _refreshCompleter != null;

  Future<String?> refreshToken() async {
    // If a refresh is already in progress, queue and await the current one
    if (_refreshCompleter != null) {
      return _refreshCompleter!.future;
    }

    final completer = Completer<String?>();
    _refreshCompleter = completer;

    try {
      final currentRefreshToken = await tokenStorage.getRefreshToken();
      if (currentRefreshToken == null || currentRefreshToken.isEmpty) {
        await _handleFailure();
        completer.complete(null);
        return null;
      }

      if (refreshDelegate == null) {
        await _handleFailure();
        completer.complete(null);
        return null;
      }

      final newTokens = await refreshDelegate!(currentRefreshToken);
      if (newTokens != null) {
        await tokenStorage.saveTokenPair(newTokens);
        completer.complete(newTokens.accessToken);
        return newTokens.accessToken;
      } else {
        await _handleFailure();
        completer.complete(null);
        return null;
      }
    } catch (_) {
      await _handleFailure();
      completer.complete(null);
      return null;
    } finally {
      _refreshCompleter = null;
    }
  }

  Future<void> _handleFailure() async {
    await tokenStorage.clear();
    onSessionExpired?.call();
  }
}
