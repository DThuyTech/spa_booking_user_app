import 'package:flutter_test/flutter_test.dart';
import 'package:spa_booking/src/domain/entities/booking/booking_availability_entity.dart';
import 'package:spa_booking/src/domain/entities/store/schedule_grid_entity.dart';
import 'package:spa_booking/src/presentation/view/booking_flow/booking_schedule/utils/schedule_grid_mapper.dart';

void main() {
  final date = DateTime(2026, 10, 15);

  ScheduleGridEntity grid({
    List<BookedIntervalEntity> booked = const [],
    List<ScheduleSlotEntity> slots = const [],
    bool isOpen = true,
  }) => ScheduleGridEntity(
    storeId: 'store_1',
    date: '2026-10-15',
    isOpen: isOpen,
    openTime: '09:00',
    closeTime: '11:00',
    staffShifts: const [
      StaffShiftEntity(
        staffProfileId: 'staff_01',
        staffName: 'Lê Thị Lan',
        shiftStart: '09:30',
        shiftEnd: '11:00',
      ),
      StaffShiftEntity(
        staffProfileId: 'staff_02',
        staffName: 'Minh',
        shiftStart: '',
        shiftEnd: '',
      ),
    ],
    bookedIntervals: booked,
    slots: slots,
  );

  test('builds columns from operating hours and rows from staff shifts', () {
    final data = ScheduleGridMapper.build(grid: grid(), date: date);

    expect(data.timeColumns, ['09:00 AM', '09:30 AM', '10:00 AM', '10:30 AM']);
    expect(data.staffMembers.map((s) => s.name), ['Lê Thị Lan', 'Minh']);
    expect(data.staffMembers.first.initials, 'LL');
    expect(data.staffMembers.last.isOff, isTrue);

    // 09:00 is before Lan's shift → OFF cell
    final offCell = data.slots.firstWhere((s) => s.time == '09:00 AM');
    expect(offCell.isOff, isTrue);
    expect(offCell.bookedTitle, isNull);
  });

  test('booked intervals are anonymized and mapped to local cells', () {
    final data = ScheduleGridMapper.build(
      grid: grid(
        booked: [
          BookedIntervalEntity(
            startAt: DateTime(2026, 10, 15, 10, 0),
            endAt: DateTime(2026, 10, 15, 10, 30),
            staffProfileId: 'staff_01',
          ),
        ],
      ),
      date: date,
    );

    final booked = data.slots.firstWhere((s) => s.time == '10:00 AM');
    expect(booked.bookedTitle, ScheduleGridMapper.bookedLabel);
    expect(booked.clientName, isNull);
    expect(data.bookingCount, 1);
  });

  test('store-full slots and services that do not fit are blocked', () {
    final data = ScheduleGridMapper.build(
      grid: grid(
        slots: const [
          ScheduleSlotEntity(time: '09:00'),
          ScheduleSlotEntity(time: '09:30'),
          ScheduleSlotEntity(time: '10:00', isAvailable: false),
          ScheduleSlotEntity(time: '10:30'),
        ],
      ),
      date: date,
      availability: const BookingAvailabilityEntity(
        storeId: 'store_1',
        date: '2026-10-15',
        slots: [BookingSlotEntity(time: '09:30', available: false)],
      ),
      serviceDurationMinutes: 60,
    );

    String? label(String t) =>
        data.slots.where((s) => s.time == t).firstOrNull?.bookedTitle;

    expect(label('09:30 AM'), ScheduleGridMapper.notFitLabel); // availability
    expect(label('10:00 AM'), ScheduleGridMapper.fullLabel); // store full
    expect(
      label('10:30 AM'),
      ScheduleGridMapper.notFitLabel,
    ); // 60m > shift end
  });

  test('closed store returns closed flag', () {
    final data = ScheduleGridMapper.build(
      grid: grid(isOpen: false),
      date: date,
    );
    expect(data.isStoreClosed, isTrue);
    expect(data.isEmpty, isTrue);
  });

  test('display time helpers round-trip', () {
    expect(ScheduleGridMapper.toDisplay('14:30'), '02:30 PM');
    expect(ScheduleGridMapper.displayToMinutes('02:30 PM'), 14 * 60 + 30);
    expect(ScheduleGridMapper.displayToMinutes('09:00'), 9 * 60);
  });

  group('Unassigned booking policies', () {
    test(
      'unlimited unassigned booking hides existing bookings and provides a single open row',
      () {
        final unlimitedGrid = ScheduleGridEntity(
          storeId: 'store_unlimited',
          date: '2026-10-15',
          openTime: '09:00',
          closeTime: '17:00',
          bookingPolicy: const BookingPolicyEntity(
            allowUnassignedBooking: true,
            isUnlimitedUnassigned: true,
          ),
          staffShifts: const [],
          bookedIntervals: [
            BookedIntervalEntity(
              startAt: DateTime(2026, 10, 15, 9, 0),
              endAt: DateTime(2026, 10, 15, 11, 0),
            ),
          ],
        );

        final data = ScheduleGridMapper.build(grid: unlimitedGrid, date: date);

        // Only 1 open row ('Available') is shown
        expect(data.staffMembers.length, 1);
        expect(data.staffMembers.first.id, 'unassigned_open');
        expect(data.staffMembers.first.name, 'Available');

        // The 09:00 slot is not marked as 'Booked' (it's hidden/available for user booking)
        final slot9am = data.slots
            .where((s) => s.time == '09:00 AM')
            .firstOrNull;
        expect(slot9am?.bookedTitle, isNull);
      },
    );

    test(
      'limited concurrency with non-overlapping bookings packs them into 1 lane + 1 open row',
      () {
        final limitedGrid = ScheduleGridEntity(
          storeId: 'store_limited_1',
          date: '2026-10-15',
          openTime: '08:00',
          closeTime: '18:00',
          bookingPolicy: const BookingPolicyEntity(
            allowUnassignedBooking: true,
            maxConcurrentUnassignedBookings: 2,
          ),
          staffShifts: const [],
          bookedIntervals: [
            BookedIntervalEntity(
              startAt: DateTime(2026, 10, 15, 9, 0),
              endAt: DateTime(2026, 10, 15, 11, 0),
            ),
            BookedIntervalEntity(
              startAt: DateTime(2026, 10, 15, 14, 0),
              endAt: DateTime(2026, 10, 15, 16, 0),
            ),
          ],
        );

        final data = ScheduleGridMapper.build(grid: limitedGrid, date: date);

        // 9h-11h and 14h-16h do not overlap → 1 lane + 1 open row = 2 rows
        expect(data.staffMembers.length, 2);
        expect(data.staffMembers[0].name, 'Slot 1');
        expect(data.staffMembers[1].name, 'Available');

        // In Slot 1, both 9:00 AM and 2:00 PM are marked as Booked
        final slot1_9am = data.slots.firstWhere(
          (s) => s.staffId == 'unassigned_lane_1' && s.time == '09:00 AM',
        );
        final slot1_2pm = data.slots.firstWhere(
          (s) => s.staffId == 'unassigned_lane_1' && s.time == '02:00 PM',
        );
        expect(slot1_9am.bookedTitle, ScheduleGridMapper.bookedLabel);
        expect(slot1_2pm.bookedTitle, ScheduleGridMapper.bookedLabel);
      },
    );

    test(
      'limited concurrency with overlapping bookings splits into 2 lanes + 1 open row',
      () {
        final limitedGrid = ScheduleGridEntity(
          storeId: 'store_limited_2',
          date: '2026-10-15',
          openTime: '08:00',
          closeTime: '18:00',
          bookingPolicy: const BookingPolicyEntity(
            allowUnassignedBooking: true,
            maxConcurrentUnassignedBookings: 3,
          ),
          staffShifts: const [],
          bookedIntervals: [
            BookedIntervalEntity(
              startAt: DateTime(2026, 10, 15, 9, 0),
              endAt: DateTime(2026, 10, 15, 11, 0),
            ),
            BookedIntervalEntity(
              startAt: DateTime(2026, 10, 15, 10, 0),
              endAt: DateTime(2026, 10, 15, 12, 0),
            ),
          ],
        );

        final data = ScheduleGridMapper.build(grid: limitedGrid, date: date);

        // Overlapping bookings → 2 lanes + 1 open row = 3 rows
        expect(data.staffMembers.length, 3);
        expect(data.staffMembers[0].name, 'Slot 1');
        expect(data.staffMembers[1].name, 'Slot 2');
        expect(data.staffMembers[2].name, 'Available');

        // Slot 1 has 9:00 AM booked
        final slot1_9am = data.slots.firstWhere(
          (s) => s.staffId == 'unassigned_lane_1' && s.time == '09:00 AM',
        );
        expect(slot1_9am.bookedTitle, ScheduleGridMapper.bookedLabel);

        // Slot 2 has 10:00 AM booked
        final slot2_10am = data.slots.firstWhere(
          (s) => s.staffId == 'unassigned_lane_2' && s.time == '10:00 AM',
        );
        expect(slot2_10am.bookedTitle, ScheduleGridMapper.bookedLabel);
      },
    );

    test(
      'user payload with startTime 14:30 and empty availableStaffIds renders available open slot',
      () {
        final userGrid = ScheduleGridEntity(
          storeId: 'bceb5a1a-ec23-4d75-af72-89cbcaed34c3',
          date: '2026-10-03',
          openTime: '09:00',
          closeTime: '20:00',
          bookingPolicy: const BookingPolicyEntity(
            allowUnassignedBooking: true,
            isUnlimitedUnassigned: true,
          ),
          staffShifts: const [],
          slots: const [
            ScheduleSlotEntity(
              time: '14:30',
              isAvailable: true,
              canBookUnassigned: true,
              availableStaffIds: [],
            ),
            ScheduleSlotEntity(
              time: '15:00',
              isAvailable: true,
              canBookUnassigned: true,
              availableStaffIds: [],
            ),
          ],
        );

        const userAvailability = BookingAvailabilityEntity(
          storeId: 'bceb5a1a-ec23-4d75-af72-89cbcaed34c3',
          date: '2026-10-03',
          totalDurationMinutes: 60,
          slots: [
            BookingSlotEntity(time: '14:30', available: true),
            BookingSlotEntity(time: '15:00', available: true),
          ],
        );

        final data = ScheduleGridMapper.build(
          grid: userGrid,
          date: DateTime(2026, 10, 3),
          availability: userAvailability,
          serviceDurationMinutes: 60,
        );

        expect(data.staffMembers.length, 1);
        expect(data.staffMembers.first.name, 'Available');
        expect(data.timeColumns.contains('02:30 PM'), isTrue);

        // Slot at 02:30 PM must NOT be Full or Off - it must be open (no slot item in data.slots)
        final slot1430 = data.slots
            .where((s) => s.time == '02:30 PM')
            .firstOrNull;
        expect(slot1430, isNull);
      },
    );
  });
}
