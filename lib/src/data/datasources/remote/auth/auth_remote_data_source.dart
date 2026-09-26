import 'package:board_oi/src/data/model/auth/refresh_token_response_model.dart';
import 'package:board_oi/src/data/model/auth/request_otp_request_model.dart';
import 'package:board_oi/src/data/model/auth/request_otp_response_model.dart';
import 'package:board_oi/src/data/model/auth/user_model.dart';
import 'package:board_oi/src/data/model/auth/verify_otp_request_model.dart';
import 'package:board_oi/src/data/model/auth/verify_otp_response_model.dart';
import 'auth_api_service.dart';

abstract interface class AuthRemoteDataSource {
  Future<RequestOtpResponseModel> requestOtp(String phone);

  Future<VerifyOtpResponseModel> verifyOtp({
    required String phone,
    required String code,
  });

  Future<RefreshTokenResponseModel> refreshToken(String refreshToken);

  Future<void> logout();

  Future<UserModel> getCurrentUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiService _apiService;

  const AuthRemoteDataSourceImpl(this._apiService);

  @override
  Future<RequestOtpResponseModel> requestOtp(String phone) {
    return _apiService.requestOtp(RequestOtpRequestModel(phone: phone));
  }

  @override
  Future<VerifyOtpResponseModel> verifyOtp({
    required String phone,
    required String code,
  }) {
    return _apiService.verifyOtp(
      VerifyOtpRequestModel(phone: phone, code: code),
    );
  }

  @override
  Future<RefreshTokenResponseModel> refreshToken(String refreshToken) {
    return _apiService.refreshToken(refreshToken);
  }

  @override
  Future<void> logout() {
    return _apiService.logout();
  }

  @override
  Future<UserModel> getCurrentUser() {
    return _apiService.getCurrentUser();
  }
}
