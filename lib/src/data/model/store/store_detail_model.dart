import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/store/store_detail_entity.dart';

part 'store_detail_model.freezed.dart';

@freezed
abstract class StoreBusinessHourModel with _$StoreBusinessHourModel {
  const factory StoreBusinessHourModel({
    required int dayOfWeek,
    required String dayName,
    required bool isOpen,
    required String openTime,
    required String closeTime,
  }) = _StoreBusinessHourModel;

  factory StoreBusinessHourModel.fromJson(Map<String, dynamic> json) {
    int dayOfWeekInt;
    String dayNameStr;

    final rawDay = json['dayOfWeek'];
    if (rawDay is int) {
      dayOfWeekInt = rawDay;
      dayNameStr = json['dayName'] as String? ?? _dayNameFromInt(dayOfWeekInt);
    } else {
      final str = rawDay?.toString().toUpperCase() ?? '';
      switch (str) {
        case 'MONDAY':
          dayOfWeekInt = 1;
          dayNameStr = 'Monday';
          break;
        case 'TUESDAY':
          dayOfWeekInt = 2;
          dayNameStr = 'Tuesday';
          break;
        case 'WEDNESDAY':
          dayOfWeekInt = 3;
          dayNameStr = 'Wednesday';
          break;
        case 'THURSDAY':
          dayOfWeekInt = 4;
          dayNameStr = 'Thursday';
          break;
        case 'FRIDAY':
          dayOfWeekInt = 5;
          dayNameStr = 'Friday';
          break;
        case 'SATURDAY':
          dayOfWeekInt = 6;
          dayNameStr = 'Saturday';
          break;
        case 'SUNDAY':
          dayOfWeekInt = 7;
          dayNameStr = 'Sunday';
          break;
        default:
          dayOfWeekInt = int.tryParse(str) ?? 1;
          dayNameStr = json['dayName'] as String? ?? 'Day $dayOfWeekInt';
      }
    }

    String openTimeStr = json['openTime'] as String? ?? '';
    String closeTimeStr = json['closeTime'] as String? ?? '';

    final timeRanges = json['timeRanges'];
    if (timeRanges is List && timeRanges.isNotEmpty) {
      final firstRange = timeRanges.first;
      if (firstRange is Map<String, dynamic>) {
        openTimeStr = firstRange['startTime'] as String? ?? openTimeStr;
        closeTimeStr = firstRange['endTime'] as String? ?? closeTimeStr;
      }
    }

    return StoreBusinessHourModel(
      dayOfWeek: dayOfWeekInt,
      dayName: dayNameStr,
      isOpen: json['isOpen'] as bool? ?? false,
      openTime: openTimeStr,
      closeTime: closeTimeStr,
    );
  }
}

String _dayNameFromInt(int day) {
  switch (day) {
    case 1:
      return 'Monday';
    case 2:
      return 'Tuesday';
    case 3:
      return 'Wednesday';
    case 4:
      return 'Thursday';
    case 5:
      return 'Friday';
    case 6:
      return 'Saturday';
    case 7:
    case 0:
      return 'Sunday';
    default:
      return 'Day $day';
  }
}

@freezed
abstract class StoreBookingSettingsModel with _$StoreBookingSettingsModel {
  const factory StoreBookingSettingsModel({
    @Default(60) int minBookingNoticeMinutes,
    @Default(30) int maxBookingAdvanceDays,
    @Default(120) int minCancellationNoticeMinutes,
    @Default(120) int minRescheduleNoticeMinutes,
    @Default(true) bool autoConfirm,
  }) = _StoreBookingSettingsModel;

  factory StoreBookingSettingsModel.fromJson(Map<String, dynamic> json) {
    return StoreBookingSettingsModel(
      minBookingNoticeMinutes: (json['minBookingNoticeMinutes'] ??
              json['minimumNoticeMinutes'] ??
              json['bookingIntervalMinutes'] ??
              60) as int? ??
          60,
      maxBookingAdvanceDays: (json['maxBookingAdvanceDays'] ??
              json['maximumAdvanceDays'] ??
              30) as int? ??
          30,
      minCancellationNoticeMinutes:
          (json['minCancellationNoticeMinutes'] as num?)?.toInt() ?? 120,
      minRescheduleNoticeMinutes:
          (json['minRescheduleNoticeMinutes'] as num?)?.toInt() ?? 120,
      autoConfirm: (json['autoConfirm'] ?? json['allowUnassignedBooking'])
              as bool? ??
          true,
    );
  }
}

@freezed
abstract class StoreDetailModel with _$StoreDetailModel {
  const factory StoreDetailModel({
    required String id,
    required String name,
    required String slug,
    String? description,
    required String address,
    required String phoneNumber,
    String? logoUrl,
    String? coverUrl,
    @Default([]) List<String> images,
    @Default([]) List<StoreBusinessHourModel> businessHours,
    StoreBookingSettingsModel? bookingSettings,
  }) = _StoreDetailModel;

  factory StoreDetailModel.fromJson(Map<String, dynamic> json) {
    final storeObj = (json['store'] is Map<String, dynamic>)
        ? json['store'] as Map<String, dynamic>
        : json;

    final rawHours = json['businessHours'] ?? storeObj['businessHours'];
    List<StoreBusinessHourModel> parsedHours = [];
    if (rawHours is List) {
      parsedHours = rawHours
          .whereType<Map<String, dynamic>>()
          .map(StoreBusinessHourModel.fromJson)
          .toList();
    } else if (rawHours is Map<String, dynamic>) {
      final days = rawHours['days'];
      if (days is List) {
        parsedHours = days
            .whereType<Map<String, dynamic>>()
            .map(StoreBusinessHourModel.fromJson)
            .toList();
      }
    }

    final rawImages = json['images'] ?? storeObj['images'];
    List<String> parsedImages = [];
    if (rawImages is List) {
      parsedImages = rawImages.map((e) => e.toString()).toList();
    }

    final rawSettings = json['bookingSettings'] ?? storeObj['bookingSettings'];
    StoreBookingSettingsModel? settings;
    if (rawSettings is Map<String, dynamic>) {
      settings = StoreBookingSettingsModel.fromJson(rawSettings);
    }

    return StoreDetailModel(
      id: (storeObj['id'] ?? json['id'] ?? '') as String,
      name: (storeObj['name'] ?? json['name'] ?? '') as String,
      slug: (storeObj['slug'] ?? json['slug'] ?? '') as String,
      description: (storeObj['description'] ?? json['description']) as String?,
      address: (storeObj['address'] ?? json['address'] ?? '') as String,
      phoneNumber:
          (storeObj['phoneNumber'] ?? json['phoneNumber'] ?? '') as String,
      logoUrl: (storeObj['logoUrl'] ??
          storeObj['avatarUrl'] ??
          json['logoUrl'] ??
          json['avatarUrl']) as String?,
      coverUrl: (storeObj['coverUrl'] ??
          storeObj['coverImageUrl'] ??
          json['coverUrl'] ??
          json['coverImageUrl']) as String?,
      images: parsedImages,
      businessHours: parsedHours,
      bookingSettings: settings,
    );
  }
}

extension StoreDetailModelX on StoreDetailModel {
  StoreDetailEntity toEntity() => StoreDetailEntity(
        id: id,
        name: name,
        slug: slug,
        description: description,
        address: address,
        phoneNumber: phoneNumber,
        logoUrl: logoUrl,
        coverUrl: coverUrl,
        images: images,
        businessHours: businessHours
            .map((b) => StoreBusinessHourEntity(
                  dayOfWeek: b.dayOfWeek,
                  dayName: b.dayName,
                  isOpen: b.isOpen,
                  openTime: b.openTime,
                  closeTime: b.closeTime,
                ))
            .toList(),
        bookingSettings: bookingSettings != null
            ? StoreBookingSettingsEntity(
                minBookingNoticeMinutes:
                    bookingSettings!.minBookingNoticeMinutes,
                maxBookingAdvanceDays:
                    bookingSettings!.maxBookingAdvanceDays,
                minCancellationNoticeMinutes:
                    bookingSettings!.minCancellationNoticeMinutes,
                minRescheduleNoticeMinutes:
                    bookingSettings!.minRescheduleNoticeMinutes,
                autoConfirm: bookingSettings!.autoConfirm,
              )
            : null,
      );
}
