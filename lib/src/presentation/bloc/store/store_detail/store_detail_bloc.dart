import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/domain/usecases/favorite/get_favorites_usecase.dart';
import 'package:spa_booking/src/domain/usecases/store/get_store_full_detail_usecase.dart';
import 'store_detail_event.dart';
import 'store_detail_state.dart';

export 'store_detail_event.dart';
export 'store_detail_state.dart';

class StoreDetailBloc extends Bloc<StoreDetailEvent, StoreDetailState> {
  final GetStoreFullDetailUseCase getStoreDetailUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;

  StoreDetailBloc({
    required this.getStoreDetailUseCase,
    required this.toggleFavoriteUseCase,
  }) : super(const StoreDetailState()) {
    on<FetchStoreDetailEvent>(_onFetchStoreDetail);
    on<ToggleStoreFavoriteEvent>(_onToggleStoreFavorite);
  }

  Future<void> _onFetchStoreDetail(
    FetchStoreDetailEvent event,
    Emitter<StoreDetailState> emit,
  ) async {
    emit(state.copyWith(status: StoreDetailStatus.loading, failure: null));
    final result = await getStoreDetailUseCase(event.storeId);
    result.fold(
      (Failure failure) => emit(
        state.copyWith(status: StoreDetailStatus.failure, failure: failure),
      ),
      (detail) => emit(
        state.copyWith(
          status: StoreDetailStatus.loaded,
          detail: detail,
          businessHours: detail.businessHours?.days ?? [],
          categories: detail.categories,
          services: detail.services,
          staff: detail.staff,
          failure: null,
        ),
      ),
    );
  }

  Future<void> _onToggleStoreFavorite(
    ToggleStoreFavoriteEvent event,
    Emitter<StoreDetailState> emit,
  ) async {
    final currentDetail = state.detail;
    if (currentDetail == null) return;

    // Optimistic update
    emit(
      state.copyWith(
        detail: currentDetail.copyWith(isFavorite: event.isFavorite),
      ),
    );

    final result = await toggleFavoriteUseCase(
      storeId: event.storeId,
      isFavorite: event.isFavorite,
    );

    result.fold(
      (Failure failure) {
        // Rollback
        emit(state.copyWith(detail: currentDetail, failure: failure));
      },
      (bool isFavorite) {
        emit(
          state.copyWith(
            detail: state.detail?.copyWith(isFavorite: isFavorite),
          ),
        );
      },
    );
  }
}
