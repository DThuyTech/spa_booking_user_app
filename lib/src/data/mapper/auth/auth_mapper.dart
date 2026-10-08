import '../../../core/network/auth/token_pair.dart';
import '../../../domain/entities/auth/auth_session_entity.dart';
import '../../../domain/entities/auth/forgot_password_result.dart';
import '../../../domain/entities/auth/request_otp_result.dart';
import '../../../domain/entities/auth/user.dart';
import '../../model/auth/auth_response_model.dart';
import '../../model/auth/forgot_password_response_model.dart';
import '../../model/auth/refresh_token_response_model.dart';
import '../../model/auth/request_otp_response_model.dart';
import '../../model/auth/user_model.dart';
import '../../model/auth/verify_otp_response_model.dart';

class AuthMapper {
  const AuthMapper();

  static ForgotPasswordResult toForgotPasswordResult(
    ForgotPasswordResponseModel model,
  ) {
    return ForgotPasswordResult(
      success: model.success,
      message: model.message,
      phone: model.phone,
      otp: model.otp,
    );
  }

  static RequestOtpResult toRequestOtpResult(RequestOtpResponseModel model) {
    return RequestOtpResult(
      message: model.message,
      expiresInSeconds: model.expiresInSeconds,
    );
  }

  static User toUser(UserModel model) {
    return User(
      id: model.id,
      email: model.email,
      phone: model.phone,
      fullName: model.fullName,
      role: model.role,
      avatar: model.avatar,
      status: model.status,
      dateOfBirth: model.dateOfBirth,
      bookingStats: model.bookingStats?.toEntity(),
    );
  }

  static AuthSessionEntity toAuthSessionEntity(VerifyOtpResponseModel model) {
    return AuthSessionEntity(
      accessToken: model.accessToken,
      refreshToken: model.refreshToken,
      expiresIn: model.expiresIn,
      user: toUser(model.user),
    );
  }

  static AuthSessionEntity toAuthSessionEntityFromAuthResponse(
    AuthResponseModel model,
  ) {
    return AuthSessionEntity(
      accessToken: model.accessToken,
      refreshToken: model.refreshToken,
      expiresIn: model.expiresIn,
      user: toUser(model.user),
    );
  }

  static TokenPair toTokenPair(RefreshTokenResponseModel model) {
    return TokenPair(
      accessToken: model.accessToken,
      refreshToken: model.refreshToken,
    );
  }
}
