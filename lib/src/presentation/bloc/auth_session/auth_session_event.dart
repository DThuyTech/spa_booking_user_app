import 'package:equatable/equatable.dart';
import '../../../core/network/auth/token_pair.dart';
import '../../../domain/entities/auth/user.dart';

sealed class AuthSessionEvent extends Equatable {
  const AuthSessionEvent();

  @override
  List<Object?> get props => [];
}

/// Dispatched during application bootstrap to determine authentication status.
final class RestoreSessionRequested extends AuthSessionEvent {
  const RestoreSessionRequested();
}

/// Dispatched when authentication (Login/OTP) successfully completes.
final class AuthSessionLoggedIn extends AuthSessionEvent {
  final User user;
  final TokenPair tokens;

  const AuthSessionLoggedIn({
    required this.user,
    required this.tokens,
  });

  @override
  List<Object?> get props => [user, tokens];
}

/// Dispatched to refresh an expiring or expired access token.
final class TokenRefreshRequested extends AuthSessionEvent {
  const TokenRefreshRequested();
}

/// Dispatched when the user explicitly logs out.
final class LogoutRequested extends AuthSessionEvent {
  const LogoutRequested();
}

/// Dispatched when token refresh fails or the session has expired.
final class SessionExpiredReceived extends AuthSessionEvent {
  const SessionExpiredReceived();
}
