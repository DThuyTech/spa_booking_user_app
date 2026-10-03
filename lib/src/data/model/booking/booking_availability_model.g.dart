// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_availability_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookingSlotModel _$BookingSlotModelFromJson(Map<String, dynamic> json) =>
    _BookingSlotModel(
      time: json['time'] as String,
      available: json['available'] as bool,
      availableStaffCount: (json['availableStaffCount'] as num?)?.toInt(),
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$BookingSlotModelToJson(_BookingSlotModel instance) =>
    <String, dynamic>{
      'time': instance.time,
      'available': instance.available,
      'availableStaffCount': instance.availableStaffCount,
      'reason': instance.reason,
    };

_BookingAvailabilityModel _$BookingAvailabilityModelFromJson(
  Map<String, dynamic> json,
) => _BookingAvailabilityModel(
  storeId: json['storeId'] as String,
  date: json['date'] as String,
  totalDurationMinutes: (json['totalDurationMinutes'] as num?)?.toInt() ?? 0,
  slots:
      (json['slots'] as List<dynamic>?)
          ?.map((e) => BookingSlotModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$BookingAvailabilityModelToJson(
  _BookingAvailabilityModel instance,
) => <String, dynamic>{
  'storeId': instance.storeId,
  'date': instance.date,
  'totalDurationMinutes': instance.totalDurationMinutes,
  'slots': instance.slots,
};
