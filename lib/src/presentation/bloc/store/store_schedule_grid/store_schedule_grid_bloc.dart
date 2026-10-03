import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/entities/store/schedule_grid_entity.dart';
import '../../../../domain/usecases/store/get_store_schedule_grid_usecase.dart';

// ---------------- Events ----------------
sealed class StoreScheduleGridEvent extends Equatable {
  const StoreScheduleGridEvent();

  @override
  List<Object?> get props => [];
}

class FetchScheduleGridEvent extends StoreScheduleGridEvent {
  final String storeId;

  /// YYYY-MM-DD
  final String date;
  final String? staffProfileId;

  const FetchScheduleGridEvent({
    required this.storeId,
    required this.date,
    this.staffProfileId,
  });

  @override
  List<Object?> get props => [storeId, date, staffProfileId];
}

// ---------------- State ----------------
enum StoreScheduleGridStatus { initial, loading, loaded, failure }

class StoreScheduleGridState extends Equatable {
  final StoreScheduleGridStatus status;
  final ScheduleGridEntity? grid;
  final Failure? failure;

  const StoreScheduleGridState({
    this.status = StoreScheduleGridStatus.initial,
    this.grid,
    this.failure,
  });

  bool get isLoading => status == StoreScheduleGridStatus.loading;
  bool get isLoaded => status == StoreScheduleGridStatus.loaded;
  bool get isFailure => status == StoreScheduleGridStatus.failure;

  StoreScheduleGridState copyWith({
    StoreScheduleGridStatus? status,
    ScheduleGridEntity? grid,
    Failure? failure,
    bool clearFailure = false,
  }) {
    return StoreScheduleGridState(
      status: status ?? this.status,
      grid: grid ?? this.grid,
      failure: clearFailure ? null : (failure ?? this.failure),
    );
  }

  @override
  List<Object?> get props => [status, grid, failure];
}

// ---------------- Bloc ----------------
class StoreScheduleGridBloc
    extends Bloc<StoreScheduleGridEvent, StoreScheduleGridState> {
  final GetStoreScheduleGridUseCase getStoreScheduleGridUseCase;

  StoreScheduleGridBloc({required this.getStoreScheduleGridUseCase})
      : super(const StoreScheduleGridState()) {
    on<FetchScheduleGridEvent>(_onFetch);
  }

  Future<void> _onFetch(
    FetchScheduleGridEvent event,
    Emitter<StoreScheduleGridState> emit,
  ) async {
    emit(state.copyWith(
      status: StoreScheduleGridStatus.loading,
      clearFailure: true,
    ));

    final result = await getStoreScheduleGridUseCase(
      storeId: event.storeId,
      date: event.date,
      staffProfileId: event.staffProfileId,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        status: StoreScheduleGridStatus.failure,
        failure: failure,
      )),
      (grid) => emit(StoreScheduleGridState(
        status: StoreScheduleGridStatus.loaded,
        grid: grid,
      )),
    );
  }
}
