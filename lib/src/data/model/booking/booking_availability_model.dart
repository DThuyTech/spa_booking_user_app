import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/booking/booking_availability_entity.dart';

part 'booking_availability_model.freezed.dart';

@freezed
abstract class BookingAvailabilityOptionItemModel
    with _$BookingAvailabilityOptionItemModel {
  const factory BookingAvailabilityOptionItemModel({
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
  }) = _BookingAvailabilityOptionItemModel;

  factory BookingAvailabilityOptionItemModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return BookingAvailabilityOptionItemModel(
      serviceId: json['serviceId'] as String? ?? '',
      serviceName: json['serviceName'] as String?,
      durationMinutes: (json['durationMinutes'] as num?)?.toInt() ?? 0,
      sequence: (json['sequence'] as num?)?.toInt() ?? 1,
      startAt: json['startAt'] as String?,
      endAt: json['endAt'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      staffProfileId: json['staffProfileId'] as String?,
      staffName: json['staffName'] as String?,
      estimatedPrice: (json['estimatedPrice'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
    );
  }
}

extension BookingAvailabilityOptionItemModelX
    on BookingAvailabilityOptionItemModel {
  BookingAvailabilityOptionItemEntity toEntity() =>
      BookingAvailabilityOptionItemEntity(
        serviceId: serviceId,
        serviceName: serviceName,
        durationMinutes: durationMinutes,
        sequence: sequence,
        startAt: startAt,
        endAt: endAt,
        startTime: startTime,
        endTime: endTime,
        staffProfileId: staffProfileId,
        staffName: staffName,
        estimatedPrice: estimatedPrice,
        currency: currency,
      );
}

@freezed
abstract class BookingAvailabilityOptionModel
    with _$BookingAvailabilityOptionModel {
  const factory BookingAvailabilityOptionModel({
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
    @Default([]) List<BookingAvailabilityOptionItemModel> items,
  }) = _BookingAvailabilityOptionModel;

  factory BookingAvailabilityOptionModel.fromJson(Map<String, dynamic> json) {
    final rawItems = json['items'];
    List<BookingAvailabilityOptionItemModel> items = [];
    if (rawItems is List) {
      items = rawItems
          .whereType<Map<String, dynamic>>()
          .map(BookingAvailabilityOptionItemModel.fromJson)
          .toList();
    }

    return BookingAvailabilityOptionModel(
      date: json['date'] as String? ?? '',
      startTime: json['startTime'] as String? ?? '',
      endTime: json['endTime'] as String? ?? '',
      startAt: json['startAt'] as String? ?? '',
      endAt: json['endAt'] as String?,
      totalDurationMinutes:
          (json['totalDurationMinutes'] as num?)?.toInt() ?? 0,
      estimatedPrice: (json['estimatedPrice'] as num?)?.toDouble(),
      currency: json['currency'] as String? ?? 'VND',
      efficiencyScore: (json['efficiencyScore'] as num?)?.toInt(),
      isRecommended: json['isRecommended'] as bool? ?? false,
      slotTag: json['slotTag'] as String?,
      items: items,
    );
  }
}

extension BookingAvailabilityOptionModelX on BookingAvailabilityOptionModel {
  BookingAvailabilityOptionEntity toEntity() => BookingAvailabilityOptionEntity(
    date: date,
    startTime: startTime,
    endTime: endTime,
    startAt: startAt,
    endAt: endAt,
    totalDurationMinutes: totalDurationMinutes,
    estimatedPrice: estimatedPrice,
    currency: currency,
    efficiencyScore: efficiencyScore,
    isRecommended: isRecommended,
    slotTag: slotTag,
    items: items.map((i) => i.toEntity()).toList(),
  );
}

@freezed
abstract class BookingAvailabilityDayModel with _$BookingAvailabilityDayModel {
  const factory BookingAvailabilityDayModel({
    required String date,
    required String dayOfWeek,
    @Default(0) int totalSlots,
    @Default([]) List<BookingAvailabilityOptionModel> options,
  }) = _BookingAvailabilityDayModel;

  factory BookingAvailabilityDayModel.fromJson(Map<String, dynamic> json) {
    final rawOptions = json['options'];
    List<BookingAvailabilityOptionModel> options = [];
    if (rawOptions is List) {
      options = rawOptions
          .whereType<Map<String, dynamic>>()
          .map(BookingAvailabilityOptionModel.fromJson)
          .toList();
    }
    return BookingAvailabilityDayModel(
      date: json['date'] as String? ?? '',
      dayOfWeek: json['dayOfWeek'] as String? ?? '',
      totalSlots: (json['totalSlots'] as num?)?.toInt() ?? options.length,
      options: options,
    );
  }
}

extension BookingAvailabilityDayModelX on BookingAvailabilityDayModel {
  BookingAvailabilityDayEntity toEntity() => BookingAvailabilityDayEntity(
    date: date,
    dayOfWeek: dayOfWeek,
    totalSlots: totalSlots,
    options: options.map((o) => o.toEntity()).toList(),
  );
}

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
    @Default('') String date,
    @Default(0) int totalDurationMinutes,
    @Default('VND') String currency,
    @Default([]) List<BookingAvailabilityDayModel> days,
    @Default([]) List<BookingAvailabilityOptionModel> options,
    @Default([]) List<BookingSlotModel> slots,
  }) = _BookingAvailabilityModel;

  factory BookingAvailabilityModel.fromJson(Map<String, dynamic> json) {
    final rawDays = json['days'];
    List<BookingAvailabilityDayModel> days = [];
    if (rawDays is List) {
      days = rawDays
          .whereType<Map<String, dynamic>>()
          .map(BookingAvailabilityDayModel.fromJson)
          .toList();
    }

    final rawOptions = json['options'];
    List<BookingAvailabilityOptionModel> options = [];
    if (rawOptions is List) {
      options = rawOptions
          .whereType<Map<String, dynamic>>()
          .map(BookingAvailabilityOptionModel.fromJson)
          .toList();
    } else if (days.isNotEmpty) {
      options = days.expand((d) => d.options).toList();
    }

    final rawSlots = json['slots'];
    List<BookingSlotModel> slots = [];
    if (rawSlots is List) {
      slots = rawSlots
          .whereType<Map<String, dynamic>>()
          .map(BookingSlotModel.fromJson)
          .toList();
    } else {
      slots = options
          .map((opt) => BookingSlotModel(time: opt.startTime, available: true))
          .toList();
    }

    return BookingAvailabilityModel(
      storeId: json['storeId'] as String? ?? '',
      date: json['date'] as String? ?? (days.isNotEmpty ? days.first.date : ''),
      totalDurationMinutes:
          (json['totalDurationMinutes'] as num?)?.toInt() ?? 0,
      currency: json['currency'] as String? ?? 'VND',
      days: days,
      options: options,
      slots: slots,
    );
  }
}

extension BookingAvailabilityModelX on BookingAvailabilityModel {
  BookingAvailabilityEntity toEntity() => BookingAvailabilityEntity(
    storeId: storeId,
    date: date,
    totalDurationMinutes: totalDurationMinutes,
    currency: currency,
    days: days.map((d) => d.toEntity()).toList(),
    options: options.map((o) => o.toEntity()).toList(),
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
