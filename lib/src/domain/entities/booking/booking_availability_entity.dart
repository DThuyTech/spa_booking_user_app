import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_availability_entity.freezed.dart';

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
    required String date,
    @Default(0) int totalDurationMinutes,
    @Default([]) List<BookingSlotEntity> slots,
  }) = _BookingAvailabilityEntity;
}
