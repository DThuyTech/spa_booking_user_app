import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_detail_entity.freezed.dart';

@freezed
abstract class StoreBusinessHourEntity with _$StoreBusinessHourEntity {
  const factory StoreBusinessHourEntity({
    required int dayOfWeek,
    required String dayName,
    required bool isOpen,
    required String openTime,
    required String closeTime,
  }) = _StoreBusinessHourEntity;
}

@freezed
abstract class StoreBookingSettingsEntity with _$StoreBookingSettingsEntity {
  const factory StoreBookingSettingsEntity({
    @Default(60) int minBookingNoticeMinutes,
    @Default(30) int maxBookingAdvanceDays,
    @Default(120) int minCancellationNoticeMinutes,
    @Default(120) int minRescheduleNoticeMinutes,
    @Default(true) bool autoConfirm,
  }) = _StoreBookingSettingsEntity;
}

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
  }) = _StoreDetailEntity;
}
