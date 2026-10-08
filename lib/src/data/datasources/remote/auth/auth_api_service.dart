import 'package:spa_booking/src/core/constants/url_constants.dart';
import 'package:spa_booking/src/core/network/interceptors/auth_interceptor.dart';
import 'package:spa_booking/src/core/network/network_client.dart';
import 'package:spa_booking/src/data/model/auth/auth_response_model.dart';
import 'package:spa_booking/src/data/model/auth/forgot_password_response_model.dart';
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
    String? name,
    String? firstName,
    String? lastName,
    required String phoneNumber,
    required String dateOfBirth,
  });

  Future<UserModel> updateCustomerProfile({
    String? name,
    String? firstName,
    String? lastName,
    required String phoneNumber,
    required String dateOfBirth,
  });

  Future<void> deleteAccount();

  Future<String> changePassword({
    required String oldPassword,
    required String newPassword,
  });

  Future<ForgotPasswordResponseModel> forgotPassword({required String phone});

  Future<String> verifyResetOtp({required String phone, required String otp});

  Future<String> resetPassword({
    required String phone,
    required String otp,
    required String newPassword,
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
    String? name,
    String? firstName,
    String? lastName,
    required String phoneNumber,
    required String dateOfBirth,
  }) async {
    final resolvedName = (name != null && name.trim().isNotEmpty)
        ? name.trim()
        : '${firstName ?? ''} ${lastName ?? ''}'.trim();
    final response = await _client.post<Map<String, dynamic>>(
      UrlConstants.customerMeProfile,
      data: {
        'name': resolvedName,
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
    String? name,
    String? firstName,
    String? lastName,
    required String phoneNumber,
    required String dateOfBirth,
  }) async {
    final resolvedName = (name != null && name.trim().isNotEmpty)
        ? name.trim()
        : '${firstName ?? ''} ${lastName ?? ''}'.trim();
    final response = await _client.patch<Map<String, dynamic>>(
      UrlConstants.customerMeProfile,
      data: {
        'name': resolvedName,
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

  @override
  Future<void> deleteAccount() async {
    await _client.delete<Map<String, dynamic>>('/users/me');
  }

  @override
  Future<String> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    final response = await _client.post<Map<String, dynamic>>(
      UrlConstants.authChangePassword,
      data: {'oldPassword': oldPassword, 'newPassword': newPassword},
    );

    final responseData = response.data;
    if (responseData != null) {
      return (responseData['message'] as String?) ?? 'Đổi mật khẩu thành công';
    }
    return 'Đổi mật khẩu thành công';
  }

  @override
  Future<ForgotPasswordResponseModel> forgotPassword({
    required String phone,
  }) async {
    final response = await _client.post<Map<String, dynamic>>(
      UrlConstants.authForgotPassword,
      data: {'phone': phone},
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
      return ForgotPasswordResponseModel.fromJson(payload);
    }

    throw const FormatException('Empty response received from forgot-password');
  }

  @override
  Future<String> verifyResetOtp({
    required String phone,
    required String otp,
  }) async {
    final response = await _client.post<Map<String, dynamic>>(
      UrlConstants.authVerifyOtp,
      data: {'phone': phone, 'otp': otp},
      options: Options(
        extra: {
          AuthInterceptor.extraSkipAuth: true,
          AuthInterceptor.extraSkipRefresh: true,
        },
      ),
    );

    final responseData = response.data;
    if (responseData != null) {
      return (responseData['message'] as String?) ?? 'Xác thực OTP thành công';
    }
    return 'Xác thực OTP thành công';
  }

  @override
  Future<String> resetPassword({
    required String phone,
    required String otp,
    required String newPassword,
  }) async {
    final response = await _client.post<Map<String, dynamic>>(
      UrlConstants.authResetPassword,
      data: {'phone': phone, 'otp': otp, 'newPassword': newPassword},
      options: Options(
        extra: {
          AuthInterceptor.extraSkipAuth: true,
          AuthInterceptor.extraSkipRefresh: true,
        },
      ),
    );

    final responseData = response.data;
    if (responseData != null) {
      return (responseData['message'] as String?) ??
          'Đặt lại mật khẩu thành công';
    }
    return 'Đặt lại mật khẩu thành công';
  }
}
