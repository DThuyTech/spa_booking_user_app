import 'package:freezed_annotation/freezed_annotation.dart';

import 'store_booking_settings_entity.dart';
import 'store_business_hour_enity.dart';

part 'store_detail_entity.freezed.dart';

@freezed
abstract class StoreDetailEntity with _$StoreDetailEntity {
  const factory StoreDetailEntity({
    required String id,
    required String name,
    required String slug,
    String? description,
    required String address,
    required String phoneNumber,
    String? logoUrl,
    String? coverUrl,
    @Default([]) List<String> images,
    @Default([]) List<StoreBusinessHourEntity> businessHours,
    StoreBookingSettingsEntity? bookingSettings,
    double? latitude,
    double? longitude,
    String? district,
    String? city,
    @Default(false) bool isFavorite,
  }) = _StoreDetailEntity;
}
