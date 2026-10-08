import 'package:json_annotation/json_annotation.dart';
import 'package:spa_booking/src/data/model/review/review_model.dart';
import 'package:spa_booking/src/domain/entities/store/store_reviews_overview_entity.dart';

part 'store_reviews_overview_model.g.dart';

@JsonSerializable()
class StoreReviewsOverviewModel {
  @JsonKey(defaultValue: 5.0)
  final double averageRating;

  @JsonKey(defaultValue: 0)
  final int totalReviews;

  @JsonKey(defaultValue: {})
  final Map<String, int> ratingDistribution;

  @JsonKey(defaultValue: [])
  final List<ReviewModel> recentReviews;

  const StoreReviewsOverviewModel({
    this.averageRating = 5.0,
    this.totalReviews = 0,
    this.ratingDistribution = const {},
    this.recentReviews = const [],
  });

  factory StoreReviewsOverviewModel.fromJson(Map<String, dynamic> json) =>
      _$StoreReviewsOverviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreReviewsOverviewModelToJson(this);

  StoreReviewsOverviewEntity toEntity() {
    return StoreReviewsOverviewEntity(
      averageRating: averageRating,
      totalReviews: totalReviews,
      ratingDistribution: ratingDistribution,
      recentReviews: recentReviews.map((e) => e.toEntity()).toList(),
    );
  }
}
