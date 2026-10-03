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
  }) = _StoreEntity;
}
