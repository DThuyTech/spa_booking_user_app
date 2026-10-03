import 'package:equatable/equatable.dart';
import 'package:spa_booking/src/domain/entities/store/schedule_grid_entity.dart';

extension StoreScheduleGridModelX on StoreScheduleGridModel {
  ScheduleGridEntity toEntity() => ScheduleGridEntity(
        storeId: storeId,
        date: date,
        isOpen: operatingHours?.isOpen ?? true,
        openTime: operatingHours?.openTime ?? '09:00',
        closeTime: operatingHours?.closeTime ?? '21:00',
        bookingPolicy: bookingPolicy?.toEntity() ?? const BookingPolicyEntity(),
        staffShifts: staffShifts
            .map((s) => StaffShiftEntity(
                  staffProfileId: s.staffProfileId,
                  staffName: s.staffName,
                  shiftStart: s.shiftStart,
                  shiftEnd: s.shiftEnd,
                ))
            .toList(),
        bookedIntervals: bookedIntervals
            .map((b) => BookedIntervalEntity(
                  startAt: b.startAt,
                  endAt: b.endAt,
                  staffProfileId: b.staffProfileId,
                ))
            .toList(),
        slots: slots
            .map((s) => ScheduleSlotEntity(
                  time: s.time,
                  isAvailable: s.isAvailable,
                  availableStaffCount: s.availableStaffCount,
                  maxCapacity: s.maxCapacity,
                  availableStaffIds: s.availableStaffIds,
                  canBookUnassigned: s.canBookUnassigned,
                  unassignedBookedCount: s.unassignedBookedCount,
                  unassignedRemaining: s.unassignedRemaining,
                ))
            .toList(),
      );
}

class StoreBookingPolicyModel extends Equatable {
  final bool allowUnassignedBooking;
  final int? maxConcurrentUnassignedBookings;
  final bool isUnlimitedUnassigned;

  const StoreBookingPolicyModel({
    this.allowUnassignedBooking = false,
    this.maxConcurrentUnassignedBookings,
    this.isUnlimitedUnassigned = false,
  });

  factory StoreBookingPolicyModel.fromJson(Map<String, dynamic> json) {
    return StoreBookingPolicyModel(
      allowUnassignedBooking: json['allowUnassignedBooking'] as bool? ?? false,
      maxConcurrentUnassignedBookings:
          (json['maxConcurrentUnassignedBookings'] as num?)?.toInt(),
      isUnlimitedUnassigned: json['isUnlimitedUnassigned'] as bool? ?? false,
    );
  }

  BookingPolicyEntity toEntity() => BookingPolicyEntity(
        allowUnassignedBooking: allowUnassignedBooking,
        maxConcurrentUnassignedBookings: maxConcurrentUnassignedBookings,
        isUnlimitedUnassigned: isUnlimitedUnassigned,
      );

  @override
  List<Object?> get props => [
        allowUnassignedBooking,
        maxConcurrentUnassignedBookings,
        isUnlimitedUnassigned,
      ];
}

class StoreOperatingHoursModel extends Equatable {
  final bool isOpen;
  final String openTime;
  final String closeTime;

  const StoreOperatingHoursModel({
    this.isOpen = true,
    this.openTime = '09:00',
    this.closeTime = '21:00',
  });

  factory StoreOperatingHoursModel.fromJson(Map<String, dynamic> json) {
    return StoreOperatingHoursModel(
      isOpen: json['isOpen'] as bool? ?? true,
      openTime: json['openTime'] as String? ?? '09:00',
      closeTime: json['closeTime'] as String? ?? '21:00',
    );
  }

  @override
  List<Object?> get props => [isOpen, openTime, closeTime];
}

class StoreStaffShiftModel extends Equatable {
  final String staffProfileId;
  final String staffName;
  final String shiftStart;
  final String shiftEnd;

  const StoreStaffShiftModel({
    required this.staffProfileId,
    required this.staffName,
    required this.shiftStart,
    required this.shiftEnd,
  });

  factory StoreStaffShiftModel.fromJson(Map<String, dynamic> json) {
    return StoreStaffShiftModel(
      staffProfileId: (json['staffProfileId'] ?? json['id'] ?? '') as String,
      staffName: (json['staffName'] ?? json['name'] ?? '') as String,
      shiftStart: json['shiftStart'] as String? ?? '',
      shiftEnd: json['shiftEnd'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [staffProfileId, staffName, shiftStart, shiftEnd];
}

class StoreBookedIntervalModel extends Equatable {
  final DateTime startAt;
  final DateTime endAt;
  final String? staffProfileId;

  const StoreBookedIntervalModel({
    required this.startAt,
    required this.endAt,
    this.staffProfileId,
  });

  factory StoreBookedIntervalModel.fromJson(Map<String, dynamic> json) {
    DateTime parseTime(dynamic raw) {
      if (raw == null) return DateTime.now();
      return DateTime.tryParse(raw.toString()) ?? DateTime.now();
    }

    return StoreBookedIntervalModel(
      startAt: parseTime(json['startAt']),
      endAt: parseTime(json['endAt']),
      staffProfileId: json['staffProfileId'] as String?,
    );
  }

  @override
  List<Object?> get props => [startAt, endAt, staffProfileId];
}

class StoreScheduleSlotModel extends Equatable {
  final String time;
  final bool isAvailable;
  final int availableStaffCount;
  final int maxCapacity;
  final List<String> availableStaffIds;
  final bool canBookUnassigned;
  final int unassignedBookedCount;
  final int? unassignedRemaining;

  const StoreScheduleSlotModel({
    required this.time,
    this.isAvailable = true,
    this.availableStaffCount = 0,
    this.maxCapacity = 0,
    this.availableStaffIds = const [],
    this.canBookUnassigned = false,
    this.unassignedBookedCount = 0,
    this.unassignedRemaining,
  });

  factory StoreScheduleSlotModel.fromJson(Map<String, dynamic> json) {
    final rawStaffIds = json['availableStaffIds'];
    List<String> staffIds = [];
    if (rawStaffIds is List) {
      staffIds = rawStaffIds.map((e) => e.toString()).toList();
    }

    final rawTime = json['startTime'] ?? json['time'] ?? '';
    final rawAvailable = json['isAvailable'] ?? json['available'] ?? true;
    final isAvail = rawAvailable is bool ? rawAvailable : true;

    return StoreScheduleSlotModel(
      time: rawTime.toString(),
      isAvailable: isAvail,
      availableStaffCount: (json['availableStaffCount'] as num?)?.toInt() ?? 0,
      maxCapacity: (json['maxCapacity'] as num?)?.toInt() ?? 0,
      availableStaffIds: staffIds,
      canBookUnassigned: json['canBookUnassigned'] as bool? ?? isAvail,
      unassignedBookedCount:
          (json['unassignedBookedCount'] as num?)?.toInt() ?? 0,
      unassignedRemaining: (json['unassignedRemaining'] as num?)?.toInt(),
    );
  }

  @override
  List<Object?> get props => [
        time,
        isAvailable,
        availableStaffCount,
        maxCapacity,
        availableStaffIds,
        canBookUnassigned,
        unassignedBookedCount,
        unassignedRemaining,
      ];
}

class StoreScheduleGridModel extends Equatable {
  final String storeId;
  final String date;
  final StoreOperatingHoursModel? operatingHours;
  final StoreBookingPolicyModel? bookingPolicy;
  final List<StoreStaffShiftModel> staffShifts;
  final List<StoreBookedIntervalModel> bookedIntervals;
  final List<StoreScheduleSlotModel> slots;

  const StoreScheduleGridModel({
    required this.storeId,
    required this.date,
    this.operatingHours,
    this.bookingPolicy,
    this.staffShifts = const [],
    this.bookedIntervals = const [],
    this.slots = const [],
  });

  factory StoreScheduleGridModel.fromJson(Map<String, dynamic> json) {
    final rawHours = json['operatingHours'];
    StoreOperatingHoursModel? operatingHours;
    if (rawHours is Map<String, dynamic>) {
      operatingHours = StoreOperatingHoursModel.fromJson(rawHours);
    }

    final rawPolicy = json['bookingPolicy'];
    StoreBookingPolicyModel? bookingPolicy;
    if (rawPolicy is Map<String, dynamic>) {
      bookingPolicy = StoreBookingPolicyModel.fromJson(rawPolicy);
    }

    final rawShifts = json['staffShifts'];
    List<StoreStaffShiftModel> staffShifts = [];
    if (rawShifts is List) {
      staffShifts = rawShifts
          .whereType<Map<String, dynamic>>()
          .map(StoreStaffShiftModel.fromJson)
          .toList();
    }

    final rawBooked = json['bookedIntervals'];
    List<StoreBookedIntervalModel> bookedIntervals = [];
    if (rawBooked is List) {
      bookedIntervals = rawBooked
          .whereType<Map<String, dynamic>>()
          .map(StoreBookedIntervalModel.fromJson)
          .toList();
    }

    final rawSlots = json['slots'];
    List<StoreScheduleSlotModel> slots = [];
    if (rawSlots is List) {
      slots = rawSlots
          .whereType<Map<String, dynamic>>()
          .map(StoreScheduleSlotModel.fromJson)
          .toList();
    }

    return StoreScheduleGridModel(
      storeId: json['storeId'] as String? ?? '',
      date: json['date'] as String? ?? '',
      operatingHours: operatingHours,
      bookingPolicy: bookingPolicy,
      staffShifts: staffShifts,
      bookedIntervals: bookedIntervals,
      slots: slots,
    );
  }

  @override
  List<Object?> get props => [
        storeId,
        date,
        operatingHours,
        bookingPolicy,
        staffShifts,
        bookedIntervals,
        slots,
      ];
}
