// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
  id: json['id'] as String,
  customerName: json['customerName'] as String? ?? 'Customer',
  avatarUrl: json['avatarUrl'] as String?,
  rating: (json['rating'] as num?)?.toInt() ?? 5,
  comment: json['comment'] as String? ?? '',
  images:
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
  serviceNames:
      (json['serviceNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      [],
  staffName: json['staffName'] as String?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerName': instance.customerName,
      'avatarUrl': instance.avatarUrl,
      'rating': instance.rating,
      'comment': instance.comment,
      'images': instance.images,
      'serviceNames': instance.serviceNames,
      'staffName': instance.staffName,
      'createdAt': instance.createdAt,
    };
