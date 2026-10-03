import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/booking/booking_availability_entity.dart';

part 'booking_availability_model.freezed.dart';
part 'booking_availability_model.g.dart';

@freezed
abstract class BookingSlotModel with _$BookingSlotModel {
  const factory BookingSlotModel({
    required String time,
    required bool available,
    int? availableStaffCount,
    String? reason,
  }) = _BookingSlotModel;

  factory BookingSlotModel.fromJson(Map<String, dynamic> json) {
    final rawTime = json['startTime'] ?? json['time'] ?? '';
    final rawAvailable = json['isAvailable'] ?? json['available'] ?? true;
    return BookingSlotModel(
      time: rawTime.toString(),
      available: rawAvailable is bool ? rawAvailable : true,
      availableStaffCount: (json['availableStaffCount'] as num?)?.toInt(),
      reason: json['reason'] as String?,
    );
  }
}

@freezed
abstract class BookingAvailabilityModel with _$BookingAvailabilityModel {
  const factory BookingAvailabilityModel({
    required String storeId,
    required String date,
    @Default(0) int totalDurationMinutes,
    @Default([]) List<BookingSlotModel> slots,
  }) = _BookingAvailabilityModel;

  factory BookingAvailabilityModel.fromJson(Map<String, dynamic> json) {
    final rawSlots = json['slots'];
    List<BookingSlotModel> slots = [];
    if (rawSlots is List) {
      slots = rawSlots
          .whereType<Map<String, dynamic>>()
          .map(BookingSlotModel.fromJson)
          .toList();
    }
    return BookingAvailabilityModel(
      storeId: json['storeId'] as String? ?? '',
      date: json['date'] as String? ?? '',
      totalDurationMinutes:
          (json['totalDurationMinutes'] as num?)?.toInt() ?? 0,
      slots: slots,
    );
  }
}

extension BookingAvailabilityModelX on BookingAvailabilityModel {
  BookingAvailabilityEntity toEntity() => BookingAvailabilityEntity(
    storeId: storeId,
    date: date,
    totalDurationMinutes: totalDurationMinutes,
    slots: slots
        .map(
          (s) => BookingSlotEntity(
            time: s.time,
            available: s.available,
            availableStaffCount: s.availableStaffCount,
            reason: s.reason,
          ),
        )
        .toList(),
  );
}
