import 'package:json_annotation/json_annotation.dart';
import 'package:spa_booking/src/domain/entities/store/store_booking_settings_entity.dart';

part 'store_booking_settings_model.g.dart';

@JsonSerializable()
class StoreBookingSettingsModel {
  final int minBookingNoticeMinutes;
  final int maxBookingAdvanceDays;
  final int minCancellationNoticeMinutes;
  final int minRescheduleNoticeMinutes;
  final bool autoConfirm;

  const StoreBookingSettingsModel({
    this.minBookingNoticeMinutes = 60,
    this.maxBookingAdvanceDays = 30,
    this.minCancellationNoticeMinutes = 120,
    this.minRescheduleNoticeMinutes = 120,
    this.autoConfirm = true,
  });

  factory StoreBookingSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$StoreBookingSettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreBookingSettingsModelToJson(this);

  StoreBookingSettingsEntity toEntity() {
    return StoreBookingSettingsEntity(
      minBookingNoticeMinutes: minBookingNoticeMinutes,
      maxBookingAdvanceDays: maxBookingAdvanceDays,
      minCancellationNoticeMinutes: minCancellationNoticeMinutes,
      minRescheduleNoticeMinutes: minRescheduleNoticeMinutes,
      autoConfirm: autoConfirm,
    );
  }
}
