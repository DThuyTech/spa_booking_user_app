import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/store/store_entity.dart';

part 'store_model.freezed.dart';

@freezed
abstract class StoreModel with _$StoreModel {
  const factory StoreModel({
    required String id,
    required String name,
    required String slug,
    String? logoUrl,
    String? coverUrl,
    required String address,
    required String phoneNumber,
    @Default(5.0) double rating,
    @Default(0) int reviewCount,
    String? priceRange,
  }) = _StoreModel;

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    final rawRating = json['rating'] ?? json['averageRating'];
    final ratingVal = (rawRating is num)
        ? rawRating.toDouble()
        : (double.tryParse(rawRating?.toString() ?? '') ?? 5.0);

    final rawReviewCount = json['reviewCount'] ?? json['totalReviews'];
    final reviewCountVal = (rawReviewCount is num)
        ? rawReviewCount.toInt()
        : (int.tryParse(rawReviewCount?.toString() ?? '') ?? 0);

    String? priceRangeVal = json['priceRange'] as String?;
    if (priceRangeVal == null && json['minPrice'] != null) {
      priceRangeVal = 'Từ ${json['minPrice']} đ';
    }

    return StoreModel(
      id: (json['id'] ?? json['_id'] ?? '') as String,
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      logoUrl: (json['logoUrl'] ?? json['avatarUrl']) as String?,
      coverUrl: (json['coverUrl'] ?? json['coverImageUrl']) as String?,
      address: json['address'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      rating: ratingVal,
      reviewCount: reviewCountVal,
      priceRange: priceRangeVal,
    );
  }
}

extension StoreModelX on StoreModel {
  StoreEntity toEntity() => StoreEntity(
    id: id,
    name: name,
    slug: slug,
    logoUrl: logoUrl,
    coverUrl: coverUrl,
    address: address,
    phoneNumber: phoneNumber,
    rating: rating,
    reviewCount: reviewCount,
    priceRange: priceRange,
  );
}
