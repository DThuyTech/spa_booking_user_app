import 'package:fpdart/fpdart.dart';
import '../error/failure.dart';

/// Base contract for asynchronous UseCases returning [Either<Failure, T>].
abstract class BaseUseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

/// Parameter placeholder when UseCase does not require inputs.
class NoParams {
  const NoParams();
}
