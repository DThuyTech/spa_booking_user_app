import 'package:equatable/equatable.dart';
import '../../../domain/entities/auth/user.dart';

enum AuthSessionStatus {
  bootstrapping,
  unauthenticated,
  authenticated,
  refreshing,
  failure,
}

class AuthSessionState extends Equatable {
  final AuthSessionStatus status;
  final User? user;
  final String? errorMessage;

  const AuthSessionState({
    this.status = AuthSessionStatus.bootstrapping,
    this.user,
    this.errorMessage,
  });

  const AuthSessionState.bootstrapping()
      : this(status: AuthSessionStatus.bootstrapping);

  const AuthSessionState.unauthenticated()
      : this(status: AuthSessionStatus.unauthenticated);

  const AuthSessionState.authenticated(User user)
      : this(status: AuthSessionStatus.authenticated, user: user);

  const AuthSessionState.refreshing({User? user})
      : this(status: AuthSessionStatus.refreshing, user: user);

  const AuthSessionState.failure(String message, {User? user})
      : this(
          status: AuthSessionStatus.failure,
          errorMessage: message,
          user: user,
        );

  bool get isBootstrapping => status == AuthSessionStatus.bootstrapping;
  bool get isAuthenticated => status == AuthSessionStatus.authenticated;
  bool get isUnauthenticated =>
      status == AuthSessionStatus.unauthenticated ||
      status == AuthSessionStatus.failure;
  bool get isRefreshing => status == AuthSessionStatus.refreshing;

  AuthSessionState copyWith({
    AuthSessionStatus? status,
    User? Function()? user,
    String? Function()? errorMessage,
  }) {
    return AuthSessionState(
      status: status ?? this.status,
      user: user != null ? user() : this.user,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, user, errorMessage];
}
