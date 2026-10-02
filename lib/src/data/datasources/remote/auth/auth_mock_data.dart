import 'dart:async';
import 'package:spa_booking/src/data/model/auth/auth_response_model.dart';
import 'package:spa_booking/src/data/model/auth/refresh_token_response_model.dart';
import 'package:spa_booking/src/data/model/auth/request_otp_response_model.dart';
import 'package:spa_booking/src/data/model/auth/user_model.dart';
import 'package:spa_booking/src/data/model/auth/verify_otp_response_model.dart';
import 'package:spa_booking/src/domain/entities/auth/user_role_enum.dart';
import 'package:spa_booking/src/domain/entities/auth/user_status_enum.dart';
import 'auth_remote_data_source.dart';

/// Static and stateful mock data for authentication in the `module_mockup` branch.
abstract final class AuthMockData {
  static const UserModel defaultUser = UserModel(
    id: 'usr_mock_001',
    email: 'sarah.jenkins@example.com',
    phone: '+1 (555) 234-5678',
    role: UserRoleEnum.customer,
    fullName: 'Sarah Jenkins',
    avatar:
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=300&q=80',
    status: UserStatusEnum.active,
    dateOfBirth: '1996-05-18',
  );

  static const String demoEmail = 'demo@aura.com';
  static const String demoPassword = 'password123';
  static const String demoOtp = '123456';
}

/// Standalone mock implementation of [AuthRemoteDataSource] providing realistic,
/// fully offline authentication and session state without network connectivity.
class MockAuthRemoteDataSource implements AuthRemoteDataSource {
  UserModel _currentUser;

  MockAuthRemoteDataSource({UserModel? initialUser})
    : _currentUser = initialUser ?? AuthMockData.defaultUser;

  @override
  Future<AuthResponseModel> loginCustomer({
    required String email,
    required String password,
  }) async {
    // Realistic simulated latency
    await Future.delayed(const Duration(milliseconds: 350));

    final trimmedEmail = email.trim();
    final namePart = trimmedEmail.contains('@')
        ? trimmedEmail.split('@').first
        : trimmedEmail;
    final resolvedName = namePart.isNotEmpty
        ? '${namePart[0].toUpperCase()}${namePart.substring(1)}'
        : 'Sarah Jenkins';

    // If demo user or custom user, update current in-memory user
    _currentUser = _currentUser.copyWith(
      email: trimmedEmail.contains('@') ? trimmedEmail : _currentUser.email,
      phone: !trimmedEmail.contains('@') ? trimmedEmail : _currentUser.phone,
      fullName: _currentUser.fullName.isNotEmpty
          ? _currentUser.fullName
          : resolvedName,
    );

    return AuthResponseModel(
      accessToken: 'mock_access_jwt_${DateTime.now().millisecondsSinceEpoch}',
      refreshToken: 'mock_refresh_jwt_${DateTime.now().millisecondsSinceEpoch}',
      tokenType: 'Bearer',
      expiresIn: 86400,
      user: _currentUser,
    );
  }

  @override
  Future<AuthResponseModel> registerCustomer({
    required String email,
    required String password,
    String? fullName,
  }) async {
    await Future.delayed(const Duration(milliseconds: 400));

    final trimmedEmail = email.trim();
    final namePart = trimmedEmail.contains('@')
        ? trimmedEmail.split('@').first
        : trimmedEmail;
    final displayName = (fullName != null && fullName.trim().isNotEmpty)
        ? fullName.trim()
        : (namePart.isNotEmpty
              ? '${namePart[0].toUpperCase()}${namePart.substring(1)}'
              : 'Sarah Jenkins');

    _currentUser = UserModel(
      id: 'usr_mock_${DateTime.now().millisecondsSinceEpoch}',
      email: trimmedEmail.contains('@') ? trimmedEmail : 'newuser@aura.com',
      phone: !trimmedEmail.contains('@') ? trimmedEmail : '+1 (555) 019-9821',
      role: UserRoleEnum.customer,
      fullName: displayName,
      avatar:
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=300&q=80',
      status: UserStatusEnum.active,
      dateOfBirth: '1998-09-12',
    );

    return AuthResponseModel(
      accessToken: 'mock_access_jwt_${DateTime.now().millisecondsSinceEpoch}',
      refreshToken: 'mock_refresh_jwt_${DateTime.now().millisecondsSinceEpoch}',
      tokenType: 'Bearer',
      expiresIn: 86400,
      user: _currentUser,
    );
  }

  @override
  Future<RequestOtpResponseModel> requestOtp(String phone) async {
    await Future.delayed(const Duration(milliseconds: 250));
    return RequestOtpResponseModel(
      message: 'Demo OTP code sent to $phone. Use 123456.',
      expiresInSeconds: 300,
    );
  }

  @override
  Future<VerifyOtpResponseModel> verifyOtp({
    required String phone,
    required String code,
  }) async {
    await Future.delayed(const Duration(milliseconds: 300));

    if (code == '000000') {
      throw Exception('Invalid verification code entered.');
    }

    _currentUser = _currentUser.copyWith(
      phone: phone.isNotEmpty ? phone : _currentUser.phone,
    );

    return VerifyOtpResponseModel(
      accessToken: 'mock_access_jwt_${DateTime.now().millisecondsSinceEpoch}',
      refreshToken: 'mock_refresh_jwt_${DateTime.now().millisecondsSinceEpoch}',
      expiresIn: 86400,
      user: _currentUser,
    );
  }

  @override
  Future<RefreshTokenResponseModel> refreshToken(String refreshToken) async {
    await Future.delayed(const Duration(milliseconds: 150));
    return RefreshTokenResponseModel(
      accessToken:
          'mock_refreshed_access_${DateTime.now().millisecondsSinceEpoch}',
      refreshToken:
          'mock_refreshed_refresh_${DateTime.now().millisecondsSinceEpoch}',
    );
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 100));
  }

  @override
  Future<UserModel> getCurrentUser() async {
    await Future.delayed(const Duration(milliseconds: 150));
    return _currentUser;
  }

  @override
  Future<UserModel> createCustomerProfile({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String dateOfBirth,
  }) async {
    await Future.delayed(const Duration(milliseconds: 250));
    final resolvedFullName = '$firstName $lastName'.trim();
    _currentUser = _currentUser.copyWith(
      fullName: resolvedFullName.isNotEmpty
          ? resolvedFullName
          : _currentUser.fullName,
      phone: phoneNumber.isNotEmpty ? phoneNumber : _currentUser.phone,
      dateOfBirth: () => dateOfBirth,
    );
    return _currentUser;
  }

  @override
  Future<UserModel> updateCustomerProfile({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String dateOfBirth,
  }) async {
    await Future.delayed(const Duration(milliseconds: 250));
    final resolvedFullName = '$firstName $lastName'.trim();
    _currentUser = _currentUser.copyWith(
      fullName: resolvedFullName.isNotEmpty
          ? resolvedFullName
          : _currentUser.fullName,
      phone: phoneNumber.isNotEmpty ? phoneNumber : _currentUser.phone,
      dateOfBirth: () => dateOfBirth,
    );
    return _currentUser;
  }
}
