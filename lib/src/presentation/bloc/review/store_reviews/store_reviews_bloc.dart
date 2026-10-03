import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/usecases/review/get_store_reviews_usecase.dart';
import 'store_reviews_event.dart';
import 'store_reviews_state.dart';

export 'store_reviews_event.dart';
export 'store_reviews_state.dart';

class StoreReviewsBloc extends Bloc<StoreReviewsEvent, StoreReviewsState> {
  final GetStoreReviewsUseCase getStoreReviewsUseCase;

  StoreReviewsBloc({required this.getStoreReviewsUseCase})
      : super(const StoreReviewsState()) {
    on<FetchStoreReviewsEvent>(_onFetchReviews);
    on<FilterReviewsByRatingEvent>(_onFilterByRating);
  }

  Future<void> _onFetchReviews(
    FetchStoreReviewsEvent event,
    Emitter<StoreReviewsState> emit,
  ) async {
    if (!event.isRefresh) {
      emit(state.copyWith(status: StoreReviewsStatus.loading, failure: null));
    }

    final result = await getStoreReviewsUseCase(
      storeId: event.storeId,
      page: event.page,
      limit: event.limit,
      rating: event.rating ?? state.selectedRatingFilter,
    );

    result.fold(
      (Failure failure) => emit(state.copyWith(
        status: StoreReviewsStatus.failure,
        failure: failure,
      )),
      (reviewData) => emit(state.copyWith(
        status: StoreReviewsStatus.loaded,
        reviewData: reviewData,
        selectedRatingFilter: event.rating ?? state.selectedRatingFilter,
        failure: null,
      )),
    );
  }

  Future<void> _onFilterByRating(
    FilterReviewsByRatingEvent event,
    Emitter<StoreReviewsState> emit,
  ) async {
    final storeId = state.reviewData?.storeId;
    if (storeId == null) return;

    emit(state.copyWith(
      status: StoreReviewsStatus.loading,
      selectedRatingFilter: event.rating,
      failure: null,
    ));

    final result = await getStoreReviewsUseCase(
      storeId: storeId,
      page: 1,
      limit: 10,
      rating: event.rating,
    );

    result.fold(
      (Failure failure) => emit(state.copyWith(
        status: StoreReviewsStatus.failure,
        failure: failure,
      )),
      (reviewData) => emit(state.copyWith(
        status: StoreReviewsStatus.loaded,
        reviewData: reviewData,
        failure: null,
      )),
    );
  }
}
