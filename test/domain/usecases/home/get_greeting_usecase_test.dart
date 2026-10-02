import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/domain/entities/home/greeting.dart';
import 'package:spa_booking/src/domain/repositories/home/home_repository.dart';
import 'package:spa_booking/src/domain/usecases/home/get_greeting_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

class MockHomeRepository implements HomeRepository {
  Either<Failure, Greeting>? result;

  @override
  Future<Either<Failure, Greeting>> getGreeting() async {
    return result!;
  }
}

void main() {
  group('GetGreetingUseCase', () {
    late MockHomeRepository repository;
    late GetGreetingUseCase useCase;

    setUp(() {
      repository = MockHomeRepository();
      useCase = GetGreetingUseCase(repository);
    });

    test('returns Greeting on repository success', () async {
      final greeting = Greeting(
        id: '1',
        title: 'Hello',
        message: 'Welcome',
        timestamp: DateTime.now(),
      );
      repository.result = Right(greeting);

      final result = await useCase();

      expect(result.isRight(), isTrue);
      result.fold(
        (_) => fail('Expected Right'),
        (r) => expect(r, equals(greeting)),
      );
    });

    test('returns Failure on repository failure', () async {
      const failure = NetworkFailure('Connection dropped');
      repository.result = const Left(failure);

      final result = await useCase();

      expect(result.isLeft(), isTrue);
      result.fold(
        (f) => expect(f, equals(failure)),
        (_) => fail('Expected Left'),
      );
    });
  });
}
