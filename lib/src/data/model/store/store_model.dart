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
    @Default(false) bool isFavorite,
    String? city,
    String? district,
    String? description,
    String? email,
    double? latitude,
    double? longitude,
    double? distanceKm,
    int? minPrice,
    DateTime? lastBookingAt,
    String? lastBookingCode,
    String? lastBookingStatus,
    int? totalBookingsCount,
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

    final isFav = json['isFavorite'] == true;

    DateTime? lastBookingAtVal;
    if (json['lastBookingAt'] != null) {
      lastBookingAtVal = DateTime.tryParse(json['lastBookingAt'].toString());
    }

    final rawAddress = json['address'] as String? ?? '';
    final lowerAddr = rawAddress.toLowerCase();

    String? cityVal = json['city'] as String?;
    if (cityVal == null || cityVal.trim().isEmpty) {
      if (lowerAddr.contains('hồ chí minh') ||
          lowerAddr.contains('ho chi minh') ||
          lowerAddr.contains('hcm') ||
          lowerAddr.contains('sài gòn') ||
          lowerAddr.contains('sai gon')) {
        cityVal = 'Thành phố Hồ Chí Minh';
      } else if (lowerAddr.contains('hà nội') || lowerAddr.contains('ha noi')) {
        cityVal = 'Hà Nội';
      } else if (lowerAddr.contains('đà nẵng') ||
          lowerAddr.contains('da nang')) {
        cityVal = 'Đà Nẵng';
      } else if (lowerAddr.contains('cần thơ') ||
          lowerAddr.contains('can tho')) {
        cityVal = 'Cần Thơ';
      } else if (lowerAddr.contains('hải phòng') ||
          lowerAddr.contains('hai phong')) {
        cityVal = 'Hải Phòng';
      }
    }

    String? districtVal = json['district'] as String?;
    if (districtVal == null || districtVal.trim().isEmpty) {
      final parts = rawAddress.split(',');
      for (final part in parts) {
        final p = part.trim();
        final lowerP = p.toLowerCase();
        if (lowerP.startsWith('quận') ||
            lowerP.startsWith('huyện') ||
            lowerP.startsWith('thị xã') ||
            lowerP.startsWith('district')) {
          districtVal = p;
          break;
        }
      }
    }

    return StoreModel(
      id: (json['id'] ?? json['_id'] ?? '') as String,
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      logoUrl: (json['logoUrl'] ?? json['avatarUrl']) as String?,
      coverUrl: (json['coverUrl'] ?? json['coverImageUrl']) as String?,
      address: rawAddress,
      phoneNumber: json['phoneNumber'] as String? ?? '',
      rating: ratingVal,
      reviewCount: reviewCountVal,
      priceRange: priceRangeVal,
      isFavorite: isFav,
      city: cityVal,
      district: districtVal,
      description: json['description'] as String?,
      email: json['email'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      distanceKm:
          ((json['distanceKm'] ?? json['distance'] ?? json['radius']) as num?)
              ?.toDouble(),
      minPrice: (json['minPrice'] as num?)?.toInt(),
      lastBookingAt: lastBookingAtVal,
      lastBookingCode: json['lastBookingCode'] as String?,
      lastBookingStatus: json['lastBookingStatus'] as String?,
      totalBookingsCount: (json['totalBookingsCount'] as num?)?.toInt(),
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
    isFavorite: isFavorite,
    city: city,
    district: district,
    description: description,
    email: email,
    latitude: latitude,
    longitude: longitude,
    distanceKm: distanceKm,
    minPrice: minPrice,
    lastBookingAt: lastBookingAt,
    lastBookingCode: lastBookingCode,
    lastBookingStatus: lastBookingStatus,
    totalBookingsCount: totalBookingsCount,
  );
}
