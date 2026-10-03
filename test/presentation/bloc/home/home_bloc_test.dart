import 'package:bloc_test/bloc_test.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/domain/entities/home/greeting.dart';
import 'package:spa_booking/src/domain/entities/store/store_entity.dart';
import 'package:spa_booking/src/domain/repositories/home/home_repository.dart';
import 'package:spa_booking/src/domain/repositories/store/store_repository.dart';
import 'package:spa_booking/src/domain/usecases/home/get_greeting_usecase.dart';
import 'package:spa_booking/src/domain/usecases/store/get_stores_usecase.dart';
import 'package:spa_booking/src/presentation/bloc/home/home_bloc.dart';
import 'package:spa_booking/src/presentation/bloc/home/home_event.dart';
import 'package:spa_booking/src/presentation/bloc/home/home_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeRepository implements HomeRepository {
  Either<Failure, Greeting>? result;

  @override
  Future<Either<Failure, Greeting>> getGreeting() async {
    return result!;
  }
}

class MockStoreRepository extends Mock implements StoreRepository {}

void main() {
  group('HomeBloc Tests (END-USER-04)', () {
    late MockHomeRepository repository;
    late GetGreetingUseCase useCase;
    late MockStoreRepository mockStoreRepository;
    late GetStoresUseCase getStoresUseCase;

    setUp(() {
      repository = MockHomeRepository();
      useCase = GetGreetingUseCase(repository);
      mockStoreRepository = MockStoreRepository();
      getStoresUseCase = GetStoresUseCase(mockStoreRepository);
    });

    final testGreeting = Greeting(
      id: 'h-1',
      title: 'Welcome Back',
      message: 'Explore relaxing spa services near you',
      timestamp: DateTime(2026, 9, 26),
    );

    const testStore = StoreEntity(
      id: 'store-1',
      name: 'Lotus Spa',
      slug: 'lotus-spa',
      address: '123 Nguyen Hue, District 1, Ho Chi Minh',
      phoneNumber: '0901234567',
      rating: 4.9,
      reviewCount: 50,
    );

    test('initial state should be initial with null data', () {
      final bloc = HomeBloc(getGreetingUseCase: useCase);
      expect(bloc.state.status, HomeStatus.initial);
      expect(bloc.state.greeting, isNull);
      expect(bloc.state.stores, isEmpty);
      expect(bloc.state.errorMessage, isNull);
      expect(bloc.state.isLoading, isFalse);
    });

    blocTest<HomeBloc, HomeState>(
      'emits [loading, loaded] when HomeStarted succeeds without getStoresUseCase',
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
      'emits [loading, loaded] with stores when HomeStarted succeeds with getStoresUseCase',
      build: () {
        repository.result = Right(testGreeting);
        when(
          () => mockStoreRepository.getStores(
            search: any(named: 'search'),
            province: any(named: 'province'),
            district: any(named: 'district'),
            page: any(named: 'page'),
            limit: any(named: 'limit'),
          ),
        ).thenAnswer((_) async => const Right([testStore]));
        return HomeBloc(
          getGreetingUseCase: useCase,
          getStoresUseCase: getStoresUseCase,
        );
      },
      act: (bloc) => bloc.add(const HomeStarted()),
      expect: () => [
        const HomeState(status: HomeStatus.loading),
        HomeState(
          status: HomeStatus.loaded,
          greeting: testGreeting,
          stores: const [testStore],
        ),
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
