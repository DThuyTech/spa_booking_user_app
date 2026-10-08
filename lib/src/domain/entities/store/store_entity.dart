import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_entity.freezed.dart';

@freezed
abstract class StoreEntity with _$StoreEntity {
  const factory StoreEntity({
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
  }) = _StoreEntity;
}
