import 'package:equatable/equatable.dart';

sealed class StoreReviewsEvent extends Equatable {
  const StoreReviewsEvent();

  @override
  List<Object?> get props => [];
}

class FetchStoreReviewsEvent extends StoreReviewsEvent {
  final String storeId;
  final int page;
  final int limit;
  final int? rating;
  final bool isRefresh;

  const FetchStoreReviewsEvent({
    required this.storeId,
    this.page = 1,
    this.limit = 10,
    this.rating,
    this.isRefresh = false,
  });

  @override
  List<Object?> get props => [storeId, page, limit, rating, isRefresh];
}

class FilterReviewsByRatingEvent extends StoreReviewsEvent {
  final int? rating;

  const FilterReviewsByRatingEvent(this.rating);

  @override
  List<Object?> get props => [rating];
}
