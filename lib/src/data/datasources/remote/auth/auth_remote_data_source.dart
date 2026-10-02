import 'package:spa_booking/src/data/model/auth/auth_response_model.dart';
import 'package:spa_booking/src/data/model/auth/refresh_token_response_model.dart';
import 'package:spa_booking/src/data/model/auth/request_otp_request_model.dart';
import 'package:spa_booking/src/data/model/auth/request_otp_response_model.dart';
import 'package:spa_booking/src/data/model/auth/user_model.dart';
import 'package:spa_booking/src/data/model/auth/verify_otp_request_model.dart';
import 'package:spa_booking/src/data/model/auth/verify_otp_response_model.dart';
import 'auth_api_service.dart';

abstract interface class AuthRemoteDataSource {
  Future<AuthResponseModel> loginCustomer({
    required String email,
    required String password,
  });

  Future<AuthResponseModel> registerCustomer({
    required String email,
    required String password,
    String? fullName,
  });

  Future<RequestOtpResponseModel> requestOtp(String phone);

  Future<VerifyOtpResponseModel> verifyOtp({
    required String phone,
    required String code,
  });

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

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiService _apiService;

  const AuthRemoteDataSourceImpl(this._apiService);

  @override
  Future<AuthResponseModel> loginCustomer({
    required String email,
    required String password,
  }) {
    return _apiService.loginCustomer(email: email, password: password);
  }

  @override
  Future<AuthResponseModel> registerCustomer({
    required String email,
    required String password,
    String? fullName,
  }) {
    return _apiService.registerCustomer(email: email, password: password);
  }

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

  @override
  Future<UserModel> createCustomerProfile({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String dateOfBirth,
  }) {
    return _apiService.createCustomerProfile(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      dateOfBirth: dateOfBirth,
    );
  }

  @override
  Future<UserModel> updateCustomerProfile({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String dateOfBirth,
  }) {
    return _apiService.updateCustomerProfile(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      dateOfBirth: dateOfBirth,
    );
  }
}
