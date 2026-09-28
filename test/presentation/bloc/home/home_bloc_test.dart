import 'package:bloc_test/bloc_test.dart';
import 'package:board_oi/src/core/error/failure.dart';
import 'package:board_oi/src/domain/entities/home/greeting.dart';
import 'package:board_oi/src/domain/repositories/home/home_repository.dart';
import 'package:board_oi/src/domain/usecases/home/get_greeting_usecase.dart';
import 'package:board_oi/src/presentation/bloc/home/home_bloc.dart';
import 'package:board_oi/src/presentation/bloc/home/home_event.dart';
import 'package:board_oi/src/presentation/bloc/home/home_state.dart';
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
  group('HomeBloc Tests (END-USER-04)', () {
    late MockHomeRepository repository;
    late GetGreetingUseCase useCase;

    setUp(() {
      repository = MockHomeRepository();
      useCase = GetGreetingUseCase(repository);
    });

    final testGreeting = Greeting(
      id: 'h-1',
      title: 'Welcome Back',
      message: 'Explore relaxing spa services near you',
      timestamp: DateTime(2026, 9, 26),
    );

    test('initial state should be initial with null data', () {
      final bloc = HomeBloc(getGreetingUseCase: useCase);
      expect(bloc.state.status, HomeStatus.initial);
      expect(bloc.state.greeting, isNull);
      expect(bloc.state.errorMessage, isNull);
      expect(bloc.state.isLoading, isFalse);
    });

    blocTest<HomeBloc, HomeState>(
      'emits [loading, loaded] when HomeStarted succeeds',
      build: () {
        repository.result = Right(testGreeting);
        return HomeBloc(getGreetingUseCase: useCase);
      },
      act: (bloc) => bloc.add(const HomeStarted()),
      expect: () => [
        const HomeState(status: HomeStatus.loading),
        HomeState(status: HomeStatus.loaded, greeting: testGreeting),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [loading, failure] when HomeStarted fails',
      build: () {
        repository.result = const Left(
          ServerFailure('Unable to load home data'),
        );
        return HomeBloc(getGreetingUseCase: useCase);
      },
      act: (bloc) => bloc.add(const HomeStarted()),
      expect: () => [
        const HomeState(status: HomeStatus.loading),
        const HomeState(
          status: HomeStatus.failure,
          errorMessage: 'Unable to load home data',
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [refreshing, loaded] when HomeRefreshed succeeds',
      build: () {
        repository.result = Right(testGreeting);
        return HomeBloc(getGreetingUseCase: useCase);
      },
      act: (bloc) => bloc.add(const HomeRefreshed()),
      expect: () => [
        const HomeState(status: HomeStatus.refreshing),
        HomeState(status: HomeStatus.loaded, greeting: testGreeting),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [loading, loaded] when HomeRetried is dispatched after error',
      build: () {
        repository.result = Right(testGreeting);
        return HomeBloc(getGreetingUseCase: useCase);
      },
      act: (bloc) => bloc.add(const HomeRetried()),
      expect: () => [
        const HomeState(status: HomeStatus.loading),
        HomeState(status: HomeStatus.loaded, greeting: testGreeting),
      ],
    );
  });
}
