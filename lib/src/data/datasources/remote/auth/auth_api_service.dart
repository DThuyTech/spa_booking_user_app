import 'package:board_oi/src/core/network/interceptors/auth_interceptor.dart';
import 'package:board_oi/src/core/network/network_client.dart';
import 'package:board_oi/src/data/model/auth/refresh_token_response_model.dart';
import 'package:board_oi/src/data/model/auth/request_otp_request_model.dart';
import 'package:board_oi/src/data/model/auth/request_otp_response_model.dart';
import 'package:board_oi/src/data/model/auth/user_model.dart';
import 'package:board_oi/src/data/model/auth/verify_otp_request_model.dart';
import 'package:board_oi/src/data/model/auth/verify_otp_response_model.dart';
import 'package:dio/dio.dart';

abstract interface class AuthApiService {
  Future<RequestOtpResponseModel> requestOtp(RequestOtpRequestModel request);

  Future<VerifyOtpResponseModel> verifyOtp(VerifyOtpRequestModel request);

  Future<RefreshTokenResponseModel> refreshToken(String refreshToken);

  Future<void> logout();

  Future<UserModel> getCurrentUser();
}

class AuthApiServiceImpl implements AuthApiService {
  final NetworkClient _client;

  const AuthApiServiceImpl(this._client);

  @override
  Future<RequestOtpResponseModel> requestOtp(
    RequestOtpRequestModel request,
  ) async {
    final response = await _client.post<Map<String, dynamic>>(
      '/auth/request-otp',
      data: request.toJson(),
    );

    final responseData = response.data;
    if (responseData != null) {
      final payload =
          (responseData['data'] as Map<String, dynamic>?) ?? responseData;
      return RequestOtpResponseModel.fromJson(payload);
    }

    return const RequestOtpResponseModel(
      message: 'OTP sent successfully',
      expiresInSeconds: 300,
    );
  }

  @override
  Future<VerifyOtpResponseModel> verifyOtp(
    VerifyOtpRequestModel request,
  ) async {
    final response = await _client.post<Map<String, dynamic>>(
      '/auth/verify-otp',
      data: request.toJson(),
    );

    final responseData = response.data;
    if (responseData != null) {
      final payload =
          (responseData['data'] as Map<String, dynamic>?) ?? responseData;
      return VerifyOtpResponseModel.fromJson(payload);
    }

    throw Exception('Empty response received from verify-otp');
  }

  @override
  Future<RefreshTokenResponseModel> refreshToken(String refreshToken) async {
    final response = await _client.post<Map<String, dynamic>>(
      '/auth/refresh',
      data: {'refreshToken': refreshToken},
      options: Options(
        extra: {
          AuthInterceptor.extraSkipAuth: true,
          AuthInterceptor.extraSkipRefresh: true,
        },
      ),
    );

    final responseData = response.data;
    if (responseData != null) {
      final payload =
          (responseData['data'] as Map<String, dynamic>?) ?? responseData;
      return RefreshTokenResponseModel.fromJson(payload);
    }

    throw Exception('Empty response received from token refresh');
  }

  @override
  Future<void> logout() async {
    await _client.post<Map<String, dynamic>>('/auth/logout', data: {});
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final response = await _client.get<Map<String, dynamic>>('/auth/me');
    final responseData = response.data;
    if (responseData != null) {
      final payload =
          (responseData['data'] as Map<String, dynamic>?) ?? responseData;
      return UserModel.fromJson(payload);
    }

    throw Exception('Empty response received from /auth/me');
  }
}
