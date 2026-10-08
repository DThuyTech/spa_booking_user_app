import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spa_booking/src/domain/entities/review/review_entity.dart';

part 'store_reviews_overview_entity.freezed.dart';

@freezed
abstract class StoreReviewsOverviewEntity with _$StoreReviewsOverviewEntity {
  const factory StoreReviewsOverviewEntity({
    @Default(5.0) double averageRating,
    @Default(0) int totalReviews,
    @Default({}) Map<String, int> ratingDistribution,
    @Default([]) List<ReviewEntity> recentReviews,
  }) = _StoreReviewsOverviewEntity;
}
