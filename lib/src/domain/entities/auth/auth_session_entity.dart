import 'package:equatable/equatable.dart';
import 'user.dart';

class AuthSessionEntity extends Equatable {
  final String accessToken;
  final String refreshToken;
  final int expiresIn;
  final User user;

  const AuthSessionEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.user,
  });

  @override
  List<Object?> get props => [accessToken, refreshToken, expiresIn, user];
}
