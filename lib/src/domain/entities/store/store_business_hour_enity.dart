import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_business_hour_enity.freezed.dart';

@freezed
abstract class StoreBusinessHourEntity with _$StoreBusinessHourEntity {
  const factory StoreBusinessHourEntity({
    required int dayOfWeek,
    required String dayName,
    required bool isOpen,
    required List<TimeRangesEntity> timeRanges,
  }) = _StoreBusinessHourEntity;
}

@freezed
abstract class TimeRangesEntity with _$TimeRangesEntity {
  const factory TimeRangesEntity({
    required String startTime,
    required String endTime,
  }) = _TimeRangesEntity;
}
