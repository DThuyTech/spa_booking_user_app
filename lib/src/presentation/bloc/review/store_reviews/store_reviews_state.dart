import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/entities/review/review_entity.dart';

part 'store_reviews_state.freezed.dart';

enum StoreReviewsStatus { initial, loading, loaded, failure }

@freezed
abstract class StoreReviewsState with _$StoreReviewsState {
  const StoreReviewsState._();

  const factory StoreReviewsState({
    @Default(StoreReviewsStatus.initial) StoreReviewsStatus status,
    ReviewListEntity? reviewData,
    int? selectedRatingFilter,
    Failure? failure,
  }) = _StoreReviewsState;

  bool get isInitial => status == StoreReviewsStatus.initial;
  bool get isLoading => status == StoreReviewsStatus.loading;
  bool get isLoaded => status == StoreReviewsStatus.loaded;
  bool get isFailure => status == StoreReviewsStatus.failure;
}
