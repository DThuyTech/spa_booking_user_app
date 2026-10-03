import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../domain/entities/booking/booking_availability_entity.dart';
import '../../../../../domain/entities/store/schedule_grid_entity.dart';
import '../../models/booking_models.dart';

/// View data for the booking Excel table (staff rows × time columns).
class ScheduleGridViewData {
  final List<BookingStaffItem> staffMembers;

  /// Display labels, e.g. "09:00 AM".
  final List<String> timeColumns;
  final List<BookingTimeSlotItem> slots;
  final int bookingCount;
  final bool isStoreClosed;

  const ScheduleGridViewData({
    this.staffMembers = const [],
    this.timeColumns = const [],
    this.slots = const [],
    this.bookingCount = 0,
    this.isStoreClosed = false,
  });

  bool get isEmpty => staffMembers.isEmpty || timeColumns.isEmpty;
}

/// Converts the anonymized `schedule-grid` (+ optional `availability`
/// for the selected services) into cells for [BookingScheduleMatrixGrid].
///
/// Cell rules (per staff, per time column):
/// - outside the staff shift      → OFF
/// - overlaps a booked interval   → "Booked" (no customer info: privacy)
/// - store slot not available     → "Full"
/// - selected services don't fit  → "—" (would overlap a booking/shift end,
///   or `availability` says the start time is not possible)
/// - otherwise                    → empty, tappable
class ScheduleGridMapper {
  const ScheduleGridMapper._();

  static const int stepMinutes = 30;
  static const String bookedLabel = 'Booked';
  static const String fullLabel = 'Full';
  static const String notFitLabel = '—';

  static const List<Color> _avatarColors = [
    Color(0xFFB2EBF2),
    Color(0xFFE1BEE7),
    Color(0xFFF8BBD0),
    Color(0xFFB2DFDB),
    Color(0xFFFFCCBC),
  ];

  static final DateFormat _displayTime = DateFormat('hh:mm a', 'en_US');

  /// "HH:mm" → minutes since midnight (null if invalid).
  static int? toMinutes(String hhmm) {
    final parts = hhmm.trim().split(':');
    if (parts.length < 2) return null;
    final h = int.tryParse(parts[0]);
    final m = int.tryParse(parts[1].substring(0, 2));
    if (h == null || m == null) return null;
    return h * 60 + m;
  }

  /// "HH:mm" → "hh:mm AM".
  static String toDisplay(String hhmm) {
    final mins = toMinutes(hhmm);
    if (mins == null) return hhmm;
    return _displayTime.format(DateTime(2000, 1, 1, mins ~/ 60, mins % 60));
  }

  /// "hh:mm AM" or "HH:mm" → minutes since midnight.
  static int? displayToMinutes(String display) {
    final trimmed = display.trim();
    try {
      final dt = _displayTime.parseStrict(trimmed);
      return dt.hour * 60 + dt.minute;
    } catch (_) {
      return toMinutes(trimmed);
    }
  }

  static String initials(String name) {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return '?';
    final parts = trimmed.split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }
    return trimmed.substring(0, trimmed.length >= 2 ? 2 : 1).toUpperCase();
  }

  static ScheduleGridViewData build({
    required ScheduleGridEntity grid,
    required DateTime date,
    BookingAvailabilityEntity? availability,
    int serviceDurationMinutes = 0,
    Map<String, String?> staffAvatarUrls = const {},
  }) {
    if (!grid.isOpen) {
      return const ScheduleGridViewData(isStoreClosed: true);
    }

    final openMin = toMinutes(grid.openTime) ?? 9 * 60;
    final closeMin = toMinutes(grid.closeTime) ?? 21 * 60;

    // 1. Time columns: combine slots from grid and availability, else generate from operating hours.
    final columnMinutes = <int>[];
    final allTimeStrings = <String>[
      for (final s in grid.slots) s.time,
      for (final s in availability?.slots ?? const <BookingSlotEntity>[])
        s.time,
    ];

    if (allTimeStrings.isNotEmpty) {
      for (final t in allTimeStrings) {
        final m = toMinutes(t);
        if (m != null && !columnMinutes.contains(m)) columnMinutes.add(m);
      }
      columnMinutes.sort();
    } else {
      for (var m = openMin; m < closeMin; m += stepMinutes) {
        columnMinutes.add(m);
      }
    }

    final storeSlotMap = <int, ScheduleSlotEntity>{
      for (final s in grid.slots)
        if (toMinutes(s.time) != null) toMinutes(s.time)!: s,
    };
    final storeSlotAvailable = <int, bool>{
      for (final s in grid.slots)
        if (toMinutes(s.time) != null) toMinutes(s.time)!: s.isAvailable,
    };
    final serviceSlotAvailable = <int, bool>{
      for (final s in availability?.slots ?? const <BookingSlotEntity>[])
        if (toMinutes(s.time) != null) toMinutes(s.time)!: s.available,
    };

    // Helper: checks whether a slot m is bookable for unassigned booking.
    // If availability API returned a status for this slot, that is the primary source of truth.
    bool isSlotBookable(int m) {
      if (serviceSlotAvailable.containsKey(m)) {
        return serviceSlotAvailable[m] == true;
      }
      final slot = storeSlotMap[m];
      if (slot != null) {
        if (!slot.canBookUnassigned && !slot.isAvailable) return false;
        if (slot.unassignedRemaining != null &&
            slot.unassignedRemaining! <= 0) {
          return false;
        }
        return slot.isAvailable;
      }
      return storeSlotAvailable[m] ?? true;
    }

    // 2. Booked intervals → local minutes on the selected day.
    final dayStart = DateTime(date.year, date.month, date.day);
    final bookedByStaff = <String?, List<(int, int)>>{};
    for (final b in grid.bookedIntervals) {
      final start = b.startAt.toLocal().difference(dayStart).inMinutes;
      final end = b.endAt.toLocal().difference(dayStart).inMinutes;
      if (end <= 0 || start >= 24 * 60) continue;
      bookedByStaff.putIfAbsent(b.staffProfileId, () => []).add((start, end));
    }

    bool overlapsBooking(String staffId, int from, int to) {
      final ranges = [
        ...?bookedByStaff[staffId],
        ...?bookedByStaff[null], // store-wide blocks
      ];
      return ranges.any((r) => r.$1 < to && r.$2 > from);
    }

    final staffMembers = <BookingStaffItem>[];
    final slots = <BookingTimeSlotItem>[];
    final duration = serviceDurationMinutes > 0
        ? serviceDurationMinutes
        : stepMinutes;

    // 3. Rows from staff shifts (if staff shifts are defined).
    for (var i = 0; i < grid.staffShifts.length; i++) {
      final shift = grid.staffShifts[i];
      final shiftStart = toMinutes(shift.shiftStart);
      final shiftEnd = toMinutes(shift.shiftEnd);
      final isOffAllDay = shiftStart == null || shiftEnd == null;

      staffMembers.add(
        BookingStaffItem(
          id: shift.staffProfileId,
          name: shift.staffName,
          initials: initials(shift.staffName),
          avatarBgColor: _avatarColors[i % _avatarColors.length],
          photoUrl: staffAvatarUrls[shift.staffProfileId],
          isOff: isOffAllDay,
        ),
      );
      if (isOffAllDay) continue;

      for (final m in columnMinutes) {
        final time = toDisplay(
          '${(m ~/ 60).toString().padLeft(2, '0')}:${(m % 60).toString().padLeft(2, '0')}',
        );
        final cellEnd = m + stepMinutes;
        final slot = storeSlotMap[m];

        if (m < shiftStart || m >= shiftEnd) {
          slots.add(
            BookingTimeSlotItem(
              staffId: shift.staffProfileId,
              time: time,
              isOff: true,
            ),
          );
        } else if (overlapsBooking(shift.staffProfileId, m, cellEnd)) {
          slots.add(
            BookingTimeSlotItem(
              staffId: shift.staffProfileId,
              time: time,
              bookedTitle: bookedLabel,
              color: const Color(0xFFDBEAFE),
            ),
          );
        } else if (slot != null &&
            slot.availableStaffIds.isNotEmpty &&
            !slot.availableStaffIds.contains(shift.staffProfileId)) {
          // Staff is busy/not available for this slot
          slots.add(
            BookingTimeSlotItem(
              staffId: shift.staffProfileId,
              time: time,
              isOff: true,
              bookedTitle: fullLabel,
            ),
          );
        } else if (storeSlotAvailable[m] == false &&
            (slot == null ||
                !slot.availableStaffIds.contains(shift.staffProfileId))) {
          slots.add(
            BookingTimeSlotItem(
              staffId: shift.staffProfileId,
              time: time,
              isOff: true,
              bookedTitle: fullLabel,
            ),
          );
        } else if (serviceSlotAvailable[m] == false ||
            m + duration > shiftEnd ||
            overlapsBooking(shift.staffProfileId, m, m + duration)) {
          slots.add(
            BookingTimeSlotItem(
              staffId: shift.staffProfileId,
              time: time,
              isOff: true,
              bookedTitle: notFitLabel,
            ),
          );
        }
        // else: free cell → no item, rendered as tappable empty slot.
      }
    }

    // 4. Unassigned booking rows (when unassigned is allowed or store has no staff).
    final policy = grid.bookingPolicy;
    final showUnassigned =
        policy.allowUnassignedBooking || grid.staffShifts.isEmpty;

    if (showUnassigned) {
      final isUnlimited =
          policy.isUnlimitedUnassigned ||
          (policy.maxConcurrentUnassignedBookings == null &&
              grid.staffShifts.isEmpty &&
              !policy.allowUnassignedBooking);

      if (isUnlimited) {
        // Unlimited: Hide existing bookings and show a single open row for the user to book.
        final openRowId = 'unassigned_open';
        staffMembers.add(
          BookingStaffItem(
            id: openRowId,
            name: grid.staffShifts.isEmpty ? 'Available' : 'Any Staff',
            initials: grid.staffShifts.isEmpty ? 'AV' : 'ANY',
            avatarBgColor: const Color(0xFFD1FAE5),
          ),
        );

        for (final m in columnMinutes) {
          final time = toDisplay(
            '${(m ~/ 60).toString().padLeft(2, '0')}:${(m % 60).toString().padLeft(2, '0')}',
          );

          if (!isSlotBookable(m)) {
            slots.add(
              BookingTimeSlotItem(
                staffId: openRowId,
                time: time,
                isOff: true,
                bookedTitle: fullLabel,
              ),
            );
          } else {
            // If availability API already validated this start time, it fits.
            // Otherwise verify remaining time within operating hours.
            final hasAvailability = serviceSlotAvailable.containsKey(m);
            var fits = true;
            if (!hasAvailability) {
              if (m + duration > closeMin) {
                fits = false;
              } else {
                for (var step = m; step < m + duration; step += stepMinutes) {
                  if (!isSlotBookable(step)) {
                    fits = false;
                    break;
                  }
                }
              }
            }
            if (!fits) {
              slots.add(
                BookingTimeSlotItem(
                  staffId: openRowId,
                  time: time,
                  isOff: true,
                  bookedTitle: notFitLabel,
                ),
              );
            }
          }
        }
      } else {
        // Limited: Partition existing unassigned bookings into non-overlapping lanes,
        // then append 1 open row for the customer to book.
        final targetBookings = grid.staffShifts.isEmpty
            ? grid.bookedIntervals
            : grid.bookedIntervals.where((b) => b.staffProfileId == null);

        final intervals = <(int, int)>[];
        for (final b in targetBookings) {
          final start = b.startAt.toLocal().difference(dayStart).inMinutes;
          final end = b.endAt.toLocal().difference(dayStart).inMinutes;
          if (end <= 0 || start >= 24 * 60) continue;
          intervals.add((start.clamp(0, 24 * 60), end.clamp(0, 24 * 60)));
        }

        // Sort by start time, then end time
        intervals.sort((a, b) {
          final cmp = a.$1.compareTo(b.$1);
          if (cmp != 0) return cmp;
          return a.$2.compareTo(b.$2);
        });

        // Greedy interval partitioning into lanes
        final lanes = <List<(int, int)>>[];
        for (final interval in intervals) {
          var placed = false;
          for (final lane in lanes) {
            final overlaps = lane.any(
              (i) => interval.$1 < i.$2 && interval.$2 > i.$1,
            );
            if (!overlaps) {
              lane.add(interval);
              placed = true;
              break;
            }
          }
          if (!placed) {
            lanes.add([interval]);
          }
        }

        // Add rows for each booked lane
        for (var i = 0; i < lanes.length; i++) {
          final lane = lanes[i];
          final laneId = 'unassigned_lane_${i + 1}';
          final laneName = 'Slot ${i + 1}';

          staffMembers.add(
            BookingStaffItem(
              id: laneId,
              name: laneName,
              initials: 'S${i + 1}',
              avatarBgColor: _avatarColors[i % _avatarColors.length],
            ),
          );

          for (final m in columnMinutes) {
            final time = toDisplay(
              '${(m ~/ 60).toString().padLeft(2, '0')}:${(m % 60).toString().padLeft(2, '0')}',
            );
            final cellEnd = m + stepMinutes;
            final isBookedInLane = lane.any(
              (item) => m < item.$2 && cellEnd > item.$1,
            );

            if (isBookedInLane) {
              slots.add(
                BookingTimeSlotItem(
                  staffId: laneId,
                  time: time,
                  bookedTitle: bookedLabel,
                  color: const Color(0xFFDBEAFE),
                ),
              );
            } else {
              if (!isSlotBookable(m)) {
                slots.add(
                  BookingTimeSlotItem(
                    staffId: laneId,
                    time: time,
                    isOff: true,
                    bookedTitle: fullLabel,
                  ),
                );
              } else if (serviceSlotAvailable[m] == false ||
                  m + duration > closeMin ||
                  lane.any((item) => m < item.$2 && m + duration > item.$1)) {
                slots.add(
                  BookingTimeSlotItem(
                    staffId: laneId,
                    time: time,
                    isOff: true,
                    bookedTitle: notFitLabel,
                  ),
                );
              }
              // else: available empty cell
            }
          }
        }

        // Always show 1 open row for customer booking
        final openRowId = 'unassigned_open';
        staffMembers.add(
          BookingStaffItem(
            id: openRowId,
            name: grid.staffShifts.isEmpty ? 'Available' : 'Any Staff',
            initials: grid.staffShifts.isEmpty ? 'AV' : 'ANY',
            avatarBgColor: const Color(0xFFD1FAE5),
          ),
        );

        for (final m in columnMinutes) {
          final time = toDisplay(
            '${(m ~/ 60).toString().padLeft(2, '0')}:${(m % 60).toString().padLeft(2, '0')}',
          );

          if (!isSlotBookable(m)) {
            slots.add(
              BookingTimeSlotItem(
                staffId: openRowId,
                time: time,
                isOff: true,
                bookedTitle: fullLabel,
              ),
            );
          } else {
            final hasAvailability = serviceSlotAvailable.containsKey(m);
            var fits = true;
            if (!hasAvailability) {
              if (m + duration > closeMin) {
                fits = false;
              } else {
                for (var step = m; step < m + duration; step += stepMinutes) {
                  if (!isSlotBookable(step)) {
                    fits = false;
                    break;
                  }
                }
              }
            }
            if (!fits) {
              slots.add(
                BookingTimeSlotItem(
                  staffId: openRowId,
                  time: time,
                  isOff: true,
                  bookedTitle: notFitLabel,
                ),
              );
            }
            // else: available empty cell
          }
        }
      }
    }

    return ScheduleGridViewData(
      staffMembers: staffMembers,
      timeColumns: [
        for (final m in columnMinutes)
          toDisplay(
            '${(m ~/ 60).toString().padLeft(2, '0')}:${(m % 60).toString().padLeft(2, '0')}',
          ),
      ],
      slots: slots,
      bookingCount: grid.bookedIntervals.length,
    );
  }
}
