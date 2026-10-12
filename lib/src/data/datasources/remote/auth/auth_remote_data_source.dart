import 'package:spa_booking/src/data/model/auth/auth_response_model.dart';
import 'package:spa_booking/src/data/model/auth/forgot_password_response_model.dart';
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

  // Customer OTP Auth
  Future<RequestOtpResponseModel> sendRegisterOtp({
    String? phoneNumber,
    String? email,
  });

  Future<AuthResponseModel> registerWithOtp({
    String? phoneNumber,
    String? email,
    required String otp,
    required String name,
  });

  Future<RequestOtpResponseModel> sendLoginOtp({required String identifier});

  Future<AuthResponseModel> loginWithOtp({
    required String identifier,
    required String otp,
  });

  // Contact Info Management
  Future<RequestOtpResponseModel> requestChangeEmail({
    required String newEmail,
  });

  Future<UserModel> verifyChangeEmail({
    required String newEmail,
    required String otp,
  });

  Future<RequestOtpResponseModel> requestChangePhone({
    required String newPhone,
  });

  Future<UserModel> verifyChangePhone({
    required String newPhone,
    required String otp,
  });

  Future<void> removeCustomerEmail();

  Future<void> removeCustomerPhone();
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
    String? name,
    String? firstName,
    String? lastName,
    required String phoneNumber,
    required String dateOfBirth,
  }) {
    return _apiService.createCustomerProfile(
      name: name,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      dateOfBirth: dateOfBirth,
    );
  }

  @override
  Future<UserModel> updateCustomerProfile({
    String? name,
    String? firstName,
    String? lastName,
    required String phoneNumber,
    required String dateOfBirth,
  }) {
    return _apiService.updateCustomerProfile(
      name: name,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      dateOfBirth: dateOfBirth,
    );
  }

  @override
  Future<void> deleteAccount() {
    return _apiService.deleteAccount();
  }

  @override
  Future<String> changePassword({
    required String oldPassword,
    required String newPassword,
  }) {
    return _apiService.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }

  @override
  Future<ForgotPasswordResponseModel> forgotPassword({required String phone}) {
    return _apiService.forgotPassword(phone: phone);
  }

  @override
  Future<String> verifyResetOtp({required String phone, required String otp}) {
    return _apiService.verifyResetOtp(phone: phone, otp: otp);
  }

  @override
  Future<String> resetPassword({
    required String phone,
    required String otp,
    required String newPassword,
  }) {
    return _apiService.resetPassword(
      phone: phone,
      otp: otp,
      newPassword: newPassword,
    );
  }

  @override
  Future<RequestOtpResponseModel> sendRegisterOtp({
    String? phoneNumber,
    String? email,
  }) {
    return _apiService.sendRegisterOtp(phoneNumber: phoneNumber, email: email);
  }

  @override
  Future<AuthResponseModel> registerWithOtp({
    String? phoneNumber,
    String? email,
    required String otp,
    required String name,
  }) {
    return _apiService.registerWithOtp(
      phoneNumber: phoneNumber,
      email: email,
      otp: otp,
      name: name,
    );
  }

  @override
  Future<RequestOtpResponseModel> sendLoginOtp({required String identifier}) {
    return _apiService.sendLoginOtp(identifier: identifier);
  }

  @override
  Future<AuthResponseModel> loginWithOtp({
    required String identifier,
    required String otp,
  }) {
    return _apiService.loginWithOtp(identifier: identifier, otp: otp);
  }

  @override
  Future<RequestOtpResponseModel> requestChangeEmail({
    required String newEmail,
  }) {
    return _apiService.requestChangeEmail(newEmail: newEmail);
  }

  @override
  Future<UserModel> verifyChangeEmail({
    required String newEmail,
    required String otp,
  }) {
    return _apiService.verifyChangeEmail(newEmail: newEmail, otp: otp);
  }

  @override
  Future<RequestOtpResponseModel> requestChangePhone({
    required String newPhone,
  }) {
    return _apiService.requestChangePhone(newPhone: newPhone);
  }

  @override
  Future<UserModel> verifyChangePhone({
    required String newPhone,
    required String otp,
  }) {
    return _apiService.verifyChangePhone(newPhone: newPhone, otp: otp);
  }

  @override
  Future<void> removeCustomerEmail() {
    return _apiService.removeCustomerEmail();
  }

  @override
  Future<void> removeCustomerPhone() {
    return _apiService.removeCustomerPhone();
  }
}
