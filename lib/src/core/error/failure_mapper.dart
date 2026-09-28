import 'package:dio/dio.dart';
import 'exceptions.dart';
import 'failure.dart';

class FailureMapper {
  const FailureMapper();

  static Failure map(Object error) {
    if (error is Failure) {
      return error;
    }

    if (error is DioException) {
      return _mapDioException(error);
    }

    if (error is AppException) {
      return _mapAppException(error);
    }

    return UnknownFailure(error.toString());
  }

  static Failure _mapDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
      case DioExceptionType.transformTimeout:
        return const NetworkFailure(
          'Connection timed out or failed. Please check your network.',
        );

      case DioExceptionType.badResponse:
        final statusCode = dioException.response?.statusCode;
        final responseData = dioException.response?.data;
        final message =
            _extractErrorMessage(responseData) ??
            dioException.response?.statusMessage ??
            'Server responded with status $statusCode';

        return _mapStatusCode(statusCode, message);

      case DioExceptionType.cancel:
        return const NetworkFailure('Request was cancelled.');

      case DioExceptionType.badCertificate:
        return const NetworkFailure('Security certificate validation failed.');

      case DioExceptionType.unknown:
        return NetworkFailure(
          dioException.message ?? 'An unknown network error occurred.',
        );
    }
  }

  static Failure _mapStatusCode(int? statusCode, String message) {
    if (statusCode == null) {
      return ServerFailure(message);
    }
    return switch (statusCode) {
      400 => ValidationFailure(message),
      401 => UnauthorizedFailure(message),
      403 => ForbiddenFailure(message),
      404 => NotFoundFailure(message),
      409 => ConflictFailure(message),
      422 => ValidationFailure(message),
      429 => RateLimitFailure(message),
      >= 500 && < 600 => ServerFailure(message),
      _ => ServerFailure(message),
    };
  }

  static Failure _mapAppException(AppException exception) {
    return switch (exception) {
      NetworkException e => NetworkFailure(e.message),
      UnauthorizedException e => UnauthorizedFailure(e.message),
      ForbiddenException e => ForbiddenFailure(e.message),
      NotFoundException e => NotFoundFailure(e.message),
      ConflictException e => ConflictFailure(e.message),
      ValidationException e => ValidationFailure(e.message),
      RateLimitException e => RateLimitFailure(e.message),
      ServerException e => ServerFailure(e.message),
      StorageException e => StorageFailure(e.message),
      _ => UnknownFailure(exception.message),
    };
  }

  static String? _extractErrorMessage(dynamic data) {
    if (data == null) return null;
    if (data is Map<String, dynamic>) {
      if (data.containsKey('message')) {
        final msg = data['message'];
        if (msg is String) return msg;
        if (msg is List) return msg.map((e) => e.toString()).join('\n');
      }
      if (data.containsKey('error')) {
        final err = data['error'];
        if (err is String) return err;
        if (err is List) return err.map((e) => e.toString()).join('\n');
      }
    }
    return null;
  }
}
