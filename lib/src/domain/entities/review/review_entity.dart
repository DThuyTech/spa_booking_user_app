import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_entity.freezed.dart';

@freezed
abstract class ReviewEntity with _$ReviewEntity {
  const factory ReviewEntity({
    required String id,
    required String customerName,
    String? avatarUrl,
    required int rating,
    required String comment,
    @Default([]) List<String> images,
    @Default([]) List<String> serviceNames,
    String? staffName,
    required DateTime createdAt,
  }) = _ReviewEntity;
}

@freezed
abstract class StoreRatingDistributionEntity with _$StoreRatingDistributionEntity {
  const factory StoreRatingDistributionEntity({
    @Default(0) int star5,
    @Default(0) int star4,
    @Default(0) int star3,
    @Default(0) int star2,
    @Default(0) int star1,
  }) = _StoreRatingDistributionEntity;
}

@freezed
abstract class ReviewListEntity with _$ReviewListEntity {
  const factory ReviewListEntity({
    required String storeId,
    @Default(5.0) double averageRating,
    @Default(0) int totalReviews,
    @Default(StoreRatingDistributionEntity())
    StoreRatingDistributionEntity ratingDistribution,
    @Default([]) List<ReviewEntity> items,
    @Default(1) int page,
    @Default(1) int totalPages,
  }) = _ReviewListEntity;
}
