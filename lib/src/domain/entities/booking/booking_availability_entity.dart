import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_availability_entity.freezed.dart';

@freezed
abstract class BookingAvailabilityOptionItemEntity
    with _$BookingAvailabilityOptionItemEntity {
  const factory BookingAvailabilityOptionItemEntity({
    required String serviceId,
    String? serviceName,
    @Default(0) int durationMinutes,
    @Default(1) int sequence,
    String? startAt,
    String? endAt,
    String? startTime,
    String? endTime,
    String? staffProfileId,
    String? staffName,
    double? estimatedPrice,
    String? currency,
  }) = _BookingAvailabilityOptionItemEntity;
}

@freezed
abstract class BookingAvailabilityOptionEntity
    with _$BookingAvailabilityOptionEntity {
  const factory BookingAvailabilityOptionEntity({
    required String date,
    required String startTime,
    required String endTime,
    required String startAt,
    String? endAt,
    @Default(0) int totalDurationMinutes,
    double? estimatedPrice,
    String? currency,
    int? efficiencyScore,
    @Default(false) bool isRecommended,
    String? slotTag,
    @Default([]) List<BookingAvailabilityOptionItemEntity> items,
  }) = _BookingAvailabilityOptionEntity;
}

@freezed
abstract class BookingAvailabilityDayEntity
    with _$BookingAvailabilityDayEntity {
  const factory BookingAvailabilityDayEntity({
    required String date,
    required String dayOfWeek,
    @Default(0) int totalSlots,
    @Default([]) List<BookingAvailabilityOptionEntity> options,
  }) = _BookingAvailabilityDayEntity;
}

@freezed
abstract class BookingSlotEntity with _$BookingSlotEntity {
  const factory BookingSlotEntity({
    required String time,
    required bool available,
    int? availableStaffCount,
    String? reason,
  }) = _BookingSlotEntity;
}

@freezed
abstract class BookingAvailabilityEntity with _$BookingAvailabilityEntity {
  const factory BookingAvailabilityEntity({
    required String storeId,
    @Default('') String date,
    @Default(0) int totalDurationMinutes,
    @Default('VND') String currency,
    @Default([]) List<BookingAvailabilityDayEntity> days,
    @Default([]) List<BookingAvailabilityOptionEntity> options,
    @Default([]) List<BookingSlotEntity> slots,
  }) = _BookingAvailabilityEntity;
}
