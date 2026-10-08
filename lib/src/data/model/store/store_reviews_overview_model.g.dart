// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_reviews_overview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreReviewsOverviewModel _$StoreReviewsOverviewModelFromJson(
  Map<String, dynamic> json,
) => StoreReviewsOverviewModel(
  averageRating: (json['averageRating'] as num?)?.toDouble() ?? 5.0,
  totalReviews: (json['totalReviews'] as num?)?.toInt() ?? 0,
  ratingDistribution:
      (json['ratingDistribution'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ) ??
      {},
  recentReviews:
      (json['recentReviews'] as List<dynamic>?)
          ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$StoreReviewsOverviewModelToJson(
  StoreReviewsOverviewModel instance,
) => <String, dynamic>{
  'averageRating': instance.averageRating,
  'totalReviews': instance.totalReviews,
  'ratingDistribution': instance.ratingDistribution,
  'recentReviews': instance.recentReviews,
};
