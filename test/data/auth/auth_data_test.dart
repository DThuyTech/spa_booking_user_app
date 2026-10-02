import 'package:spa_booking/src/core/error/exceptions.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/core/error/failure_mapper.dart';
import 'package:spa_booking/src/data/mapper/auth/auth_mapper.dart';
import 'package:spa_booking/src/data/model/auth/refresh_token_response_model.dart';
import 'package:spa_booking/src/data/model/auth/request_otp_response_model.dart';
import 'package:spa_booking/src/data/model/auth/user_model.dart';
import 'package:spa_booking/src/data/model/auth/verify_otp_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Auth Data Models & Parsing', () {
    test('RequestOtpResponseModel parses backend JSON correctly', () {
      final json = {
        'message': 'OTP sent successfully',
        'expiresInSeconds': 300,
      };

      final model = RequestOtpResponseModel.fromJson(json);

      expect(model.message, equals('OTP sent successfully'));
      expect(model.expiresInSeconds, equals(300));

      final entity = AuthMapper.toRequestOtpResult(model);
      expect(entity.message, equals('OTP sent successfully'));
      expect(entity.expiresInSeconds, equals(300));
    });

    test('VerifyOtpResponseModel parses backend JSON correctly', () {
      final json = {
        'accessToken': 'sample_access_jwt',
        'refreshToken': 'sample_refresh_jwt',
        'expiresIn': 86400,
        'user': {
          '_id': 'usr_999',
          'phone': '0900000001',
          'role': 'CUSTOMER',
          'fullName': 'Nguyen Van A',
        },
      };

      final model = VerifyOtpResponseModel.fromJson(json);

      expect(model.accessToken, equals('sample_access_jwt'));
      expect(model.refreshToken, equals('sample_refresh_jwt'));
      expect(model.expiresIn, equals(86400));
      expect(model.user.id, equals('usr_999'));
      expect(model.user.fullName, equals('Nguyen Van A'));

      final entity = AuthMapper.toAuthSessionEntity(model);
      expect(entity.accessToken, equals('sample_access_jwt'));
      expect(entity.user.id, equals('usr_999'));
      expect(entity.user.role, equals('CUSTOMER'));
    });

    test('RefreshTokenResponseModel parses backend JSON correctly', () {
      final json = {
        'accessToken': 'new_access_jwt',
        'refreshToken': 'new_refresh_jwt',
      };

      final model = RefreshTokenResponseModel.fromJson(json);

      expect(model.accessToken, equals('new_access_jwt'));
      expect(model.refreshToken, equals('new_refresh_jwt'));

      final tokenPair = AuthMapper.toTokenPair(model);
      expect(tokenPair.accessToken, equals('new_access_jwt'));
      expect(tokenPair.refreshToken, equals('new_refresh_jwt'));
    });

    test('UserModel handles both id and _id with default role', () {
      final json1 = {'_id': 'usr_1', 'phone': '0901', 'name': 'User 1'};
      final model1 = UserModel.fromJson(json1);
      expect(model1.id, equals('usr_1'));
      expect(model1.role, equals('CUSTOMER'));
      expect(model1.fullName, equals('User 1'));

      final json2 = {
        'id': 'usr_2',
        'phone': '0902',
        'role': 'ADMIN',
        'fullName': 'User 2',
      };
      final model2 = UserModel.fromJson(json2);
      expect(model2.id, equals('usr_2'));
      expect(model2.role, equals('ADMIN'));
      expect(model2.fullName, equals('User 2'));
    });
  });

  group('FailureMapper for Auth', () {
    test('maps 401 Unauthorized correctly', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/auth/verify-otp'),
        response: Response(
          requestOptions: RequestOptions(path: '/auth/verify-otp'),
          statusCode: 401,
          data: {'message': 'Invalid OTP'},
        ),
        type: DioExceptionType.badResponse,
      );

      final failure = FailureMapper.map(dioException);

      expect(failure, isA<UnauthorizedFailure>());
      expect((failure as UnauthorizedFailure).message, equals('Invalid OTP'));
    });

    test('maps 404 Not Found correctly', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/auth/me'),
        response: Response(
          requestOptions: RequestOptions(path: '/auth/me'),
          statusCode: 404,
          data: {'message': 'User not found'},
        ),
        type: DioExceptionType.badResponse,
      );

      final failure = FailureMapper.map(dioException);

      expect(failure, isA<NotFoundFailure>());
    });

    test('maps connection timeout to NetworkFailure', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/auth/request-otp'),
        type: DioExceptionType.connectionTimeout,
      );

      final failure = FailureMapper.map(dioException);

      expect(failure, isA<NetworkFailure>());
    });

    test('maps AppException to Failure', () {
      const appException = UnauthorizedException('Session expired');
      final failure = FailureMapper.map(appException);
      expect(failure, isA<UnauthorizedFailure>());
    });
  });
}
