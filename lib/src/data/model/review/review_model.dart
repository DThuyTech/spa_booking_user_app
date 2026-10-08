import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/review/review_entity.dart';

part 'review_model.g.dart';

@JsonSerializable()
class ReviewModel {
  final String id;

  @JsonKey(defaultValue: 'Customer')
  final String customerName;

  final String? avatarUrl;

  @JsonKey(defaultValue: 5)
  final int rating;

  @JsonKey(defaultValue: '')
  final String comment;

  @JsonKey(defaultValue: [])
  final List<String>? images;

  @JsonKey(defaultValue: [])
  final List<String>? serviceNames;

  final String? staffName;
  final String? createdAt;

  const ReviewModel({
    required this.id,
    required this.customerName,
    this.avatarUrl,
    required this.rating,
    required this.comment,
    this.images,
    this.serviceNames,
    this.staffName,
    this.createdAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    final customer = json['customer'] is Map<String, dynamic>
        ? json['customer'] as Map<String, dynamic>
        : null;

    final user = json['user'] is Map<String, dynamic>
        ? json['user'] as Map<String, dynamic>
        : null;

    final customerName =
        json['customerName'] ??
        customer?['name'] ??
        customer?['fullName'] ??
        user?['name'] ??
        user?['fullName'] ??
        'Customer';

    final avatarUrl =
        json['avatarUrl'] ??
        customer?['avatar'] ??
        customer?['avatarUrl'] ??
        user?['avatar'] ??
        user?['avatarUrl'];

    final rawImages = json['images'];

    final parsedImages = rawImages is List
        ? rawImages.map((e) => e.toString()).toList()
        : <String>[];

    final rawServiceNames = json['serviceNames'];

    final parsedServiceNames = rawServiceNames is List
        ? rawServiceNames.map((e) => e.toString()).toList()
        : <String>[];

    final rawRating = json['rating'];

    final ratingVal = rawRating is num
        ? rawRating.toInt()
        : int.tryParse(rawRating?.toString() ?? '') ?? 5;

    return ReviewModel(
      id: (json['id'] ?? json['_id'] ?? '').toString(),
      customerName: customerName.toString(),
      avatarUrl: avatarUrl?.toString(),
      rating: ratingVal,
      comment: (json['comment'] ?? '').toString(),
      images: parsedImages,
      serviceNames: parsedServiceNames,
      staffName: json['staffName']?.toString(),
      createdAt: json['createdAt']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
  ReviewEntity toEntity() {
    return ReviewEntity(
      id: id,
      customerName: customerName,
      avatarUrl: avatarUrl,
      rating: rating,
      comment: comment,
      images: images ?? [],
      serviceNames: serviceNames ?? [],
      staffName: staffName,
      createdAt: createdAt != null
          ? DateTime.tryParse(createdAt!) ?? DateTime.now()
          : DateTime.now(),
    );
  }
}
