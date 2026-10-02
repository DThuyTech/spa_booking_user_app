import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/domain/entities/home/greeting.dart';
import 'package:spa_booking/src/domain/repositories/home/home_repository.dart';

class GetGreetingUseCase {
  final HomeRepository _repository;

  const GetGreetingUseCase(this._repository);

  Future<Either<Failure, Greeting>> call() {
    return _repository.getGreeting();
  }
}
