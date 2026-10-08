// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_booking_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreBookingSettingsModel _$StoreBookingSettingsModelFromJson(
  Map<String, dynamic> json,
) => StoreBookingSettingsModel(
  minBookingNoticeMinutes:
      (json['minBookingNoticeMinutes'] as num?)?.toInt() ?? 60,
  maxBookingAdvanceDays: (json['maxBookingAdvanceDays'] as num?)?.toInt() ?? 30,
  minCancellationNoticeMinutes:
      (json['minCancellationNoticeMinutes'] as num?)?.toInt() ?? 120,
  minRescheduleNoticeMinutes:
      (json['minRescheduleNoticeMinutes'] as num?)?.toInt() ?? 120,
  autoConfirm: json['autoConfirm'] as bool? ?? true,
);

Map<String, dynamic> _$StoreBookingSettingsModelToJson(
  StoreBookingSettingsModel instance,
) => <String, dynamic>{
  'minBookingNoticeMinutes': instance.minBookingNoticeMinutes,
  'maxBookingAdvanceDays': instance.maxBookingAdvanceDays,
  'minCancellationNoticeMinutes': instance.minCancellationNoticeMinutes,
  'minRescheduleNoticeMinutes': instance.minRescheduleNoticeMinutes,
  'autoConfirm': instance.autoConfirm,
};
