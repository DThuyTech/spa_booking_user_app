import 'package:equatable/equatable.dart';

class BookingPolicyEntity extends Equatable {
  final bool allowUnassignedBooking;
  final int? maxConcurrentUnassignedBookings;
  final bool isUnlimitedUnassigned;

  const BookingPolicyEntity({
    this.allowUnassignedBooking = false,
    this.maxConcurrentUnassignedBookings,
    this.isUnlimitedUnassigned = false,
  });

  @override
  List<Object?> get props => [
    allowUnassignedBooking,
    maxConcurrentUnassignedBookings,
    isUnlimitedUnassigned,
  ];
}

/// Anonymized store schedule grid (Excel table view) for a single day.
/// Mirrors `GET /public/stores/:storeId/schedule-grid?date=YYYY-MM-DD`.
class ScheduleGridEntity extends Equatable {
  final String storeId;
  final String date;
  final bool isOpen;
  final String openTime;
  final String closeTime;
  final BookingPolicyEntity bookingPolicy;
  final List<StaffShiftEntity> staffShifts;
  final List<BookedIntervalEntity> bookedIntervals;
  final List<ScheduleSlotEntity> slots;

  const ScheduleGridEntity({
    required this.storeId,
    required this.date,
    this.isOpen = true,
    this.openTime = '09:00',
    this.closeTime = '21:00',
    this.bookingPolicy = const BookingPolicyEntity(),
    this.staffShifts = const [],
    this.bookedIntervals = const [],
    this.slots = const [],
  });

  @override
  List<Object?> get props => [
    storeId,
    date,
    isOpen,
    openTime,
    closeTime,
    bookingPolicy,
    staffShifts,
    bookedIntervals,
    slots,
  ];
}

class StaffShiftEntity extends Equatable {
  final String staffProfileId;
  final String staffName;

  /// "HH:mm"
  final String shiftStart;

  /// "HH:mm"
  final String shiftEnd;

  const StaffShiftEntity({
    required this.staffProfileId,
    required this.staffName,
    required this.shiftStart,
    required this.shiftEnd,
  });

  @override
  List<Object?> get props => [staffProfileId, staffName, shiftStart, shiftEnd];
}

class BookedIntervalEntity extends Equatable {
  final DateTime startAt;
  final DateTime endAt;
  final String? staffProfileId;

  const BookedIntervalEntity({
    required this.startAt,
    required this.endAt,
    this.staffProfileId,
  });

  @override
  List<Object?> get props => [startAt, endAt, staffProfileId];
}

class ScheduleSlotEntity extends Equatable {
  /// "HH:mm"
  final String time;
  final bool isAvailable;
  final int availableStaffCount;
  final int maxCapacity;
  final List<String> availableStaffIds;
  final bool canBookUnassigned;
  final int unassignedBookedCount;
  final int? unassignedRemaining;

  const ScheduleSlotEntity({
    required this.time,
    this.isAvailable = true,
    this.availableStaffCount = 0,
    this.maxCapacity = 0,
    this.availableStaffIds = const [],
    this.canBookUnassigned = false,
    this.unassignedBookedCount = 0,
    this.unassignedRemaining,
  });

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
