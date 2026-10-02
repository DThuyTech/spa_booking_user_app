import 'package:spa_booking/src/core/constants/url_constants.dart';
import 'package:spa_booking/src/core/network/interceptors/auth_interceptor.dart';
import 'package:spa_booking/src/core/network/network_client.dart';
import 'package:spa_booking/src/data/model/auth/auth_response_model.dart';
import 'package:spa_booking/src/data/model/auth/refresh_token_response_model.dart';
import 'package:spa_booking/src/data/model/auth/request_otp_request_model.dart';
import 'package:spa_booking/src/data/model/auth/request_otp_response_model.dart';
import 'package:spa_booking/src/data/model/auth/user_model.dart';
import 'package:spa_booking/src/data/model/auth/verify_otp_request_model.dart';
import 'package:spa_booking/src/data/model/auth/verify_otp_response_model.dart';
import 'package:dio/dio.dart';

abstract interface class AuthApiService {
  Future<AuthResponseModel> loginCustomer({
    required String email,
    required String password,
  });

  Future<AuthResponseModel> registerCustomer({
    required String email,
    required String password,
  });

  Future<RequestOtpResponseModel> requestOtp(RequestOtpRequestModel request);

  Future<VerifyOtpResponseModel> verifyOtp(VerifyOtpRequestModel request);

  Future<RefreshTokenResponseModel> refreshToken(String refreshToken);

  Future<void> logout();

  Future<UserModel> getCurrentUser();

  Future<UserModel> createCustomerProfile({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String dateOfBirth,
  });

  Future<UserModel> updateCustomerProfile({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String dateOfBirth,
  });
}

class AuthApiServiceImpl implements AuthApiService {
  final NetworkClient _client;

  const AuthApiServiceImpl(this._client);

  @override
  Future<AuthResponseModel> loginCustomer({
    required String email,
    required String password,
  }) async {
    final response = await _client.post<Map<String, dynamic>>(
      UrlConstants.authCustomerLogin,
      data: {'email': email, 'password': password},
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
      return AuthResponseModel.fromJson(payload);
    }

    throw const FormatException('Empty response received from login');
  }

  @override
  Future<AuthResponseModel> registerCustomer({
    required String email,
    required String password,
  }) async {
    final response = await _client.post<Map<String, dynamic>>(
      UrlConstants.authCustomerRegister,
      data: {'email': email, 'password': password},
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
      return AuthResponseModel.fromJson(payload);
    }

    throw const FormatException('Empty response received from register');
  }

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
    Response<Map<String, dynamic>> response;
    try {
      response = await _client.get<Map<String, dynamic>>(
        UrlConstants.customerMeProfile,
      );
    } on DioException catch (dioError) {
      if (dioError.response?.statusCode == 404) {
        rethrow;
      }
      try {
        response = await _client.get<Map<String, dynamic>>(
          UrlConstants.usersMe,
        );
      } catch (_) {
        response = await _client.get<Map<String, dynamic>>(UrlConstants.authMe);
      }
    } catch (_) {
      try {
        response = await _client.get<Map<String, dynamic>>(
          UrlConstants.usersMe,
        );
      } catch (_) {
        response = await _client.get<Map<String, dynamic>>(UrlConstants.authMe);
      }
    }

    final responseData = response.data;
    if (responseData != null) {
      final payload =
          (responseData['data'] as Map<String, dynamic>?) ?? responseData;
      return UserModel.fromJson(payload);
    }

    throw Exception('Empty response received from user profile');
  }

  @override
  Future<UserModel> createCustomerProfile({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String dateOfBirth,
  }) async {
    final response = await _client.post<Map<String, dynamic>>(
      UrlConstants.customerMeProfile,
      data: {
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'dateOfBirth': dateOfBirth,
      },
    );

    final responseData = response.data;
    if (responseData != null) {
      final payload =
          (responseData['data'] as Map<String, dynamic>?) ?? responseData;
      return UserModel.fromJson(payload);
    }

    throw Exception('Empty response received from create customer profile');
  }

  @override
  Future<UserModel> updateCustomerProfile({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String dateOfBirth,
  }) async {
    final response = await _client.patch<Map<String, dynamic>>(
      UrlConstants.customerMeProfile,
      data: {
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'dateOfBirth': dateOfBirth,
      },
    );

    final responseData = response.data;
    if (responseData != null) {
      final payload =
          (responseData['data'] as Map<String, dynamic>?) ?? responseData;
      return UserModel.fromJson(payload);
    }

    throw Exception('Empty response received from update customer profile');
  }
}
