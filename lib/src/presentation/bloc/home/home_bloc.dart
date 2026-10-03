import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../../domain/entities/home/greeting.dart';
import '../../../domain/entities/store/store_entity.dart';
import '../../../domain/usecases/home/get_greeting_usecase.dart';
import '../../../domain/usecases/store/get_stores_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetGreetingUseCase getGreetingUseCase;
  final GetStoresUseCase? getStoresUseCase;

  HomeBloc({
    required this.getGreetingUseCase,
    this.getStoresUseCase,
  }) : super(const HomeState()) {
    on<HomeStarted>(_onStarted);
    on<HomeRefreshed>(_onRefreshed);
    on<HomeRetried>(_onRetried);
  }

  Future<void> _onStarted(HomeStarted event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading, errorMessage: () => null));

    final greetingFuture = getGreetingUseCase();
    final storesFuture = getStoresUseCase != null
        ? getStoresUseCase!()
        : Future.value(const Right<Failure, List<StoreEntity>>([]));

    final results = await Future.wait([greetingFuture, storesFuture]);
    final greetingResult = results[0] as Either<Failure, Greeting>;
    final storesResult = results[1] as Either<Failure, List<StoreEntity>>;

    _handleResults(greetingResult, storesResult, emit);
  }

  Future<void> _onRefreshed(
    HomeRefreshed event,
    Emitter<HomeState> emit,
  ) async {
    // Avoid double refresh
    if (state.isRefreshing) return;

    emit(
      state.copyWith(status: HomeStatus.refreshing, errorMessage: () => null),
    );

    final greetingFuture = getGreetingUseCase();
    final storesFuture = getStoresUseCase != null
        ? getStoresUseCase!()
        : Future.value(const Right<Failure, List<StoreEntity>>([]));

    final results = await Future.wait([greetingFuture, storesFuture]);
    final greetingResult = results[0] as Either<Failure, Greeting>;
    final storesResult = results[1] as Either<Failure, List<StoreEntity>>;

    _handleResults(greetingResult, storesResult, emit);
  }

  void _handleResults(
    Either<Failure, Greeting> greetingResult,
    Either<Failure, List<StoreEntity>> storesResult,
    Emitter<HomeState> emit,
  ) {
    Greeting? greeting = state.greeting;
    List<StoreEntity> stores = state.stores;
    String? errorMessage;

    greetingResult.fold(
      (failure) => errorMessage = failure.message,
      (g) => greeting = g,
    );

    storesResult.fold(
      (failure) {
        if (errorMessage == null && greeting == null) {
          errorMessage = failure.message;
        }
      },
      (s) => stores = s,
    );

    if (errorMessage != null && greeting == null && stores.isEmpty) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: () => errorMessage,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: HomeStatus.loaded,
          greeting: () => greeting,
          stores: stores,
          errorMessage: () => null,
        ),
      );
    }
  }

  Future<void> _onRetried(HomeRetried event, Emitter<HomeState> emit) async {
    await _onStarted(const HomeStarted(), emit);
  }
}
