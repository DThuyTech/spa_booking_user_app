import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_booking_settings_entity.freezed.dart';

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
