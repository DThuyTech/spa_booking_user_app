import '../../../core/network/auth/token_pair.dart';
import '../../../domain/entities/auth/auth_session_entity.dart';
import '../../../domain/entities/auth/request_otp_result.dart';
import '../../../domain/entities/auth/user.dart';
import '../../model/auth/refresh_token_response_model.dart';
import '../../model/auth/request_otp_response_model.dart';
import '../../model/auth/user_model.dart';
import '../../model/auth/verify_otp_response_model.dart';

class AuthMapper {
  const AuthMapper();

  static RequestOtpResult toRequestOtpResult(RequestOtpResponseModel model) {
    return RequestOtpResult(
      message: model.message,
      expiresInSeconds: model.expiresInSeconds,
    );
  }

  static User toUser(UserModel model) {
    return User(
      id: model.id,
      phone: model.phone,
      fullName: model.fullName,
      role: model.role,
      avatar: model.avatar,
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

  static TokenPair toTokenPair(RefreshTokenResponseModel model) {
    return TokenPair(
      accessToken: model.accessToken,
      refreshToken: model.refreshToken,
    );
  }
}
