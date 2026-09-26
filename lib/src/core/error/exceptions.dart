class AppException implements Exception {
  final String message;
  final int? statusCode;

  const AppException(this.message, [this.statusCode]);

  @override
  String toString() => 'AppException: $message (statusCode: $statusCode)';
}

class NetworkException extends AppException {
  const NetworkException([
    super.message = 'Network connection failed',
    super.statusCode,
  ]);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException([
    super.message = 'Unauthorized',
    super.statusCode = 401,
  ]);
}

class ForbiddenException extends AppException {
  const ForbiddenException([
    super.message = 'Forbidden',
    super.statusCode = 403,
  ]);
}

class NotFoundException extends AppException {
  const NotFoundException([
    super.message = 'Resource not found',
    super.statusCode = 404,
  ]);
}

class ConflictException extends AppException {
  const ConflictException([super.message = 'Conflict', super.statusCode = 409]);
}

class ValidationException extends AppException {
  const ValidationException([
    super.message = 'Validation error',
    super.statusCode = 422,
  ]);
}

class RateLimitException extends AppException {
  const RateLimitException([
    super.message = 'Too many requests',
    super.statusCode = 429,
  ]);
}

class ServerException extends AppException {
  const ServerException([
    super.message = 'Internal server error',
    super.statusCode = 500,
  ]);
}

class StorageException extends AppException {
  const StorageException([super.message = 'Storage error']);
}
