import 'package:bloc_test/bloc_test.dart';
import 'package:board_oi/src/core/error/failure.dart';
import 'package:board_oi/src/domain/entities/home/greeting.dart';
import 'package:board_oi/src/domain/repositories/home/home_repository.dart';
import 'package:board_oi/src/domain/usecases/home/get_greeting_usecase.dart';
import 'package:board_oi/src/presentation/bloc/home/home_bloc.dart';
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
  group('HomeBloc', () {
    late MockHomeRepository repository;
    late GetGreetingUseCase useCase;

    setUp(() {
      repository = MockHomeRepository();
      useCase = GetGreetingUseCase(repository);
    });

    final testGreeting = Greeting(
      id: 'g-1',
      title: 'Active Base',
      message: 'Source base is active',
      timestamp: DateTime.now(),
    );

    blocTest<HomeBloc, HomeState>(
      'emits [isLoading: true, greeting: testGreeting] when loadGreeting succeeds',
      build: () {
        repository.result = Right(testGreeting);
        return HomeBloc(getGreetingUseCase: useCase);
      },
      act: (bloc) => bloc.add(const HomeEvent.loadGreeting()),
      expect: () => [
        const HomeState(isLoading: true),
        HomeState(isLoading: false, greeting: testGreeting),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [isLoading: true, failure: failure] when loadGreeting fails',
      build: () {
        repository.result = const Left(ServerFailure('Database error'));
        return HomeBloc(getGreetingUseCase: useCase);
      },
      act: (bloc) => bloc.add(const HomeEvent.loadGreeting()),
      expect: () => [
        const HomeState(isLoading: true),
        const HomeState(
          isLoading: false,
          failure: ServerFailure('Database error'),
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [isRefreshing: true, greeting: testGreeting] on refreshGreeting',
      build: () {
        repository.result = Right(testGreeting);
        return HomeBloc(getGreetingUseCase: useCase);
      },
      act: (bloc) => bloc.add(const HomeEvent.refreshGreeting()),
      expect: () => [
        const HomeState(isRefreshing: true),
        HomeState(isRefreshing: false, greeting: testGreeting),
      ],
    );
  });
}
