import 'package:equatable/equatable.dart';
import 'user_model.dart';

class VerifyOtpResponseModel extends Equatable {
  final String accessToken;
  final String refreshToken;
  final int expiresIn;
  final UserModel user;

  const VerifyOtpResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.user,
  });

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) {
    final userJson =
        (json['user'] as Map<String, dynamic>?) ?? <String, dynamic>{};
    return VerifyOtpResponseModel(
      accessToken: json['accessToken'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
      expiresIn: (json['expiresIn'] as num?)?.toInt() ?? 86400,
      user: UserModel.fromJson(userJson),
    );
  }

  Map<String, dynamic> toJson() => {
    'accessToken': accessToken,
    'refreshToken': refreshToken,
    'expiresIn': expiresIn,
    'user': user.toJson(),
  };

  @override
  List<Object?> get props => [accessToken, refreshToken, expiresIn, user];
}
