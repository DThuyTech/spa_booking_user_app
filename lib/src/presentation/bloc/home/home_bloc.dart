import 'package:spa_booking/src/domain/usecases/home/get_greeting_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetGreetingUseCase getGreetingUseCase;

  HomeBloc({required this.getGreetingUseCase}) : super(const HomeState()) {
    on<HomeStarted>(_onStarted);
    on<HomeRefreshed>(_onRefreshed);
    on<HomeRetried>(_onRetried);
  }

  Future<void> _onStarted(HomeStarted event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading, errorMessage: () => null));

    final result = await getGreetingUseCase();

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: () => failure.message,
        ),
      ),
      (greeting) => emit(
        state.copyWith(
          status: HomeStatus.loaded,
          greeting: () => greeting,
          errorMessage: () => null,
        ),
      ),
    );
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

    final result = await getGreetingUseCase();

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: () => failure.message,
        ),
      ),
      (greeting) => emit(
        state.copyWith(
          status: HomeStatus.loaded,
          greeting: () => greeting,
          errorMessage: () => null,
        ),
      ),
    );
  }

  Future<void> _onRetried(HomeRetried event, Emitter<HomeState> emit) async {
    await _onStarted(const HomeStarted(), emit);
  }
}
