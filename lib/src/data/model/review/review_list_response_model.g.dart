// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewListResponseModel _$ReviewListResponseModelFromJson(
  Map<String, dynamic> json,
) => ReviewListResponseModel(
  storeId: json['storeId'] as String,
  averageRating: (json['averageRating'] as num?)?.toDouble() ?? 5.0,
  totalReviews: (json['totalReviews'] as num?)?.toInt() ?? 0,
  ratingDistribution: json['ratingDistribution'] as Map<String, dynamic>?,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  pagination: json['pagination'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$ReviewListResponseModelToJson(
  ReviewListResponseModel instance,
) => <String, dynamic>{
  'storeId': instance.storeId,
  'averageRating': instance.averageRating,
  'totalReviews': instance.totalReviews,
  'ratingDistribution': instance.ratingDistribution,
  'items': instance.items,
  'pagination': instance.pagination,
};
