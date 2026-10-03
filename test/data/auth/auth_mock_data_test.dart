import 'package:spa_booking/src/data/datasources/remote/auth/auth_mock_data.dart';
import 'package:spa_booking/src/data/datasources/remote/home/home_remote_data_source.dart';
import 'package:spa_booking/src/domain/entities/auth/user_role_enum.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MockAuthRemoteDataSource', () {
    late MockAuthRemoteDataSource dataSource;

    setUp(() {
      dataSource = MockAuthRemoteDataSource();
    });

    test('loginCustomer returns mock tokens and updates email', () async {
      final response = await dataSource.loginCustomer(
        email: 'alice@aura.com',
        password: 'password123',
      );

      expect(response.accessToken, startsWith('mock_access_jwt_'));
      expect(response.refreshToken, startsWith('mock_refresh_jwt_'));
      expect(response.expiresIn, 86400);
      expect(response.user.email, 'alice@aura.com');
      expect(response.user.role, UserRoleEnum.customer);
    });

    test(
      'registerCustomer creates new mock user with provided name and email',
      () async {
        final response = await dataSource.registerCustomer(
          email: 'bob@aura.com',
          password: 'password123',
          fullName: 'Bob Smith',
        );

        expect(response.accessToken, isNotEmpty);
        expect(response.user.fullName, 'Bob Smith');
        expect(response.user.email, 'bob@aura.com');
        expect(response.user.role, UserRoleEnum.customer);
      },
    );

    test('requestOtp returns demo OTP hint', () async {
      final response = await dataSource.requestOtp('+1555123456');

      expect(response.message, contains('123456'));
      expect(response.expiresInSeconds, 300);
    });

    test('verifyOtp returns authenticated user session', () async {
      final response = await dataSource.verifyOtp(
        phone: '+1555123456',
        code: '123456',
      );

      expect(response.accessToken, startsWith('mock_access_jwt_'));
      expect(response.user.phone, '+1555123456');
    });

    test(
      'verifyOtp throws exception when code is 000000 (failure testing)',
      () async {
        expect(
          () => dataSource.verifyOtp(phone: '+1555123456', code: '000000'),
          throwsA(isA<Exception>()),
        );
      },
    );

    test('refreshToken returns refreshed token pair', () async {
      final response = await dataSource.refreshToken('any_token');

      expect(response.accessToken, startsWith('mock_refreshed_access_'));
      expect(response.refreshToken, startsWith('mock_refreshed_refresh_'));
    });

    test('getCurrentUser returns mock user', () async {
      final user = await dataSource.getCurrentUser();

      expect(user.fullName, isNotEmpty);
      expect(user.email, isNotEmpty);
    });

    test('updateCustomerProfile updates user name, phone and DOB', () async {
      final updated = await dataSource.updateCustomerProfile(
        firstName: 'Emma',
        lastName: 'Watson',
        phoneNumber: '+1555987654',
        dateOfBirth: '1990-04-15',
      );

      expect(updated.fullName, 'Emma Watson');
      expect(updated.phone, '+1555987654');
      expect(updated.dateOfBirth, '1990-04-15');

      final current = await dataSource.getCurrentUser();
      expect(current.fullName, 'Emma Watson');
    });

    test('logout completes without error', () async {
      await expectLater(dataSource.logout(), completes);
    });
  });

  group('MockHomeRemoteDataSource', () {
    test(
      'getGreeting returns offline mock greeting without network calls',
      () async {
        const homeDataSource = MockHomeRemoteDataSource();
        final greeting = await homeDataSource.getGreeting();

        expect(greeting.title, 'Aura Spa & Wellness');
        expect(greeting.message, contains('beauty'));
      },
    );
  });
}
