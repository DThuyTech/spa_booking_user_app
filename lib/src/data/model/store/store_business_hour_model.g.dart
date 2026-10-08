// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_business_hour_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreBusinessHourModel _$StoreBusinessHourModelFromJson(
  Map<String, dynamic> json,
) => StoreBusinessHourModel(
  dayOfWeek: (json['dayOfWeek'] as num).toInt(),
  dayName: json['dayName'] as String,
  isOpen: json['isOpen'] as bool,
  timeRanges: (json['timeRanges'] as List<dynamic>)
      .map((e) => TimeRangesModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$StoreBusinessHourModelToJson(
  StoreBusinessHourModel instance,
) => <String, dynamic>{
  'dayOfWeek': instance.dayOfWeek,
  'dayName': instance.dayName,
  'isOpen': instance.isOpen,
  'timeRanges': instance.timeRanges,
};

TimeRangesModel _$TimeRangesModelFromJson(Map<String, dynamic> json) =>
    TimeRangesModel(
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
    );

Map<String, dynamic> _$TimeRangesModelToJson(TimeRangesModel instance) =>
    <String, dynamic>{
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
