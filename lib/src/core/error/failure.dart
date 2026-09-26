import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  final String message;

  const Failure([this.message = 'An unexpected error occurred']);

  @override
  List<Object?> get props => [message];
}

final class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Network connection failed']);
}

final class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([super.message = 'Unauthorized access']);
}

final class ForbiddenFailure extends Failure {
  const ForbiddenFailure([super.message = 'Access forbidden']);
}

final class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'Resource not found']);
}

final class ConflictFailure extends Failure {
  const ConflictFailure([super.message = 'Conflict with existing resource']);
}

final class ValidationFailure extends Failure {
  const ValidationFailure([super.message = 'Validation failed']);
}

final class RateLimitFailure extends Failure {
  const RateLimitFailure([
    super.message = 'Too many requests. Please try again later.',
  ]);
}

final class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Internal server error']);
}

final class StorageFailure extends Failure {
  const StorageFailure([super.message = 'Storage operation failed']);
}

final class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'An unknown error occurred']);
}
