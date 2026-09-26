import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:board_oi/src/domain/usecases/home/get_greeting_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

export 'home_event.dart';
export 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetGreetingUseCase getGreetingUseCase;

  HomeBloc({required this.getGreetingUseCase}) : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
      await event.map(
        loadGreeting: (e) => _onLoadGreeting(e, emit),
        refreshGreeting: (e) => _onRefreshGreeting(e, emit),
      );
    });
  }

  Future<void> _onLoadGreeting(dynamic event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true, failure: null));
    final result = await getGreetingUseCase();

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, failure: failure)),
      (greeting) => emit(state.copyWith(isLoading: false, greeting: greeting)),
    );
  }

  Future<void> _onRefreshGreeting(
    dynamic event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isRefreshing: true, failure: null));
    final result = await getGreetingUseCase();

    result.fold(
      (failure) => emit(state.copyWith(isRefreshing: false, failure: failure)),
      (greeting) =>
          emit(state.copyWith(isRefreshing: false, greeting: greeting)),
    );
  }
}
