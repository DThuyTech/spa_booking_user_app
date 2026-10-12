import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../domain/entities/booking/booking_availability_entity.dart';
import '../../../../../shared/shared.dart';
import '../../models/booking_models.dart';
import '../utils/schedule_grid_mapper.dart';

class BookingScheduleBodyView extends StatelessWidget {
  final String salonName;
  final String selectedDate;
  final DateTime selectedDateTime;
  final ValueChanged<DateTime>? onDateSelected;
  final List<BookingStaffItem> staffMembers;
  final List<String> timeColumns;
  final List<BookingTimeSlotItem> slots;
  final String? selectedStaffId;
  final String selectedTime;
  final void Function(String staffId, String time) onSelectSlot;
  final BookingAvailabilityEntity? availability;
  final void Function(BookingAvailabilityOptionEntity option)? onSelectOption;
  final bool isToday;
  final bool isLoading;
  final String? emptyMessage;
  final VoidCallback? onDateTap;
  final bool isQuickBook;

  const BookingScheduleBodyView({
    super.key,
    required this.salonName,
    required this.selectedDate,
    required this.selectedDateTime,
    this.onDateSelected,
    required this.staffMembers,
    required this.timeColumns,
    required this.slots,
    required this.selectedStaffId,
    required this.selectedTime,
    required this.onSelectSlot,
    this.availability,
    this.onSelectOption,
    this.isToday = true,
    this.isLoading = false,
    this.emptyMessage,
    this.onDateTap,
    this.isQuickBook = false,
  });

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
    final isVi = Localizations.localeOf(context).languageCode == 'vi';

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isQuickBook)
            Container(
              margin: const EdgeInsets.fromLTRB(20, 12, 20, 4),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFBEB),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFFDE68A)),
              ),
              child: Row(
                children: [
                  const Icon(
                    LucideIcons.zap,
                    size: 16,
                    color: Color(0xFFD97706),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      isVi
                          ? '⚡ Đặt nhanh: Chọn khung giờ rảnh phù hợp, salon sẽ bố trí chuyên viên tốt nhất cho bạn.'
                          : '⚡ Quick Book: Pick an available slot, salon will assign the best specialist for you.',
                      style: const TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF92400E),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          // 1. Calendar Header & Horizontal Date Bar
          _buildCalendarDateSelector(context, isVi),

          const SizedBox(height: 16),

          // 2. Available Time Slots Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: isLoading
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 60),
                    child: Center(
                      child: CircularProgressIndicator(color: _coralColor),
                    ),
                  )
                : _buildTimeSlotsSection(context, isVi),
          ),
        ],
      ),
    );
  }

  // MARK: - Calendar Date Selector Bar
  Widget _buildCalendarDateSelector(BuildContext context, bool isVi) {
    final today = DateTime.now();
    final todayNormalized = DateTime(today.year, today.month, today.day);

    // Generate 14 upcoming days
    final days = List.generate(
      14,
      (i) => todayNormalized.add(Duration(days: i)),
    );

    final dayFmt = DateFormat('E', isVi ? 'vi' : 'en');
    final dateDisplayFmt = DateFormat('EEEE, dd/MM/yyyy', isVi ? 'vi' : 'en');

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row: Ngày đang chọn + Nút mở Calendar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isVi ? 'Chọn ngày đặt lịch' : 'Select Booking Date',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: _textMuted,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        dateDisplayFmt.format(selectedDateTime),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: _textDark,
                          letterSpacing: -0.2,
                        ),
                      ),
                    ],
                  ),
                ),
                // Icon Button mở Calendar Date Picker
                InkWell(
                  onTap: onDateTap,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: _coralColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          LucideIcons.calendar,
                          size: 16,
                          color: _coralColor,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          isVi ? 'Lịch' : 'Calendar',
                          style: const TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w700,
                            color: _coralColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // Horizontal scroll date cards
          SizedBox(
            height: 76,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: days.length,
              itemBuilder: (context, index) {
                final date = days[index];
                final isSelected =
                    date.year == selectedDateTime.year &&
                    date.month == selectedDateTime.month &&
                    date.day == selectedDateTime.day;
                final isTodayItem =
                    date.year == todayNormalized.year &&
                    date.month == todayNormalized.month &&
                    date.day == todayNormalized.day;

                return GestureDetector(
                  onTap: () => onDateSelected?.call(date),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 58,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: isSelected ? _coralColor : const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected
                            ? _coralColor
                            : const Color(0xFFE2E8F0),
                        width: isSelected ? 1.5 : 1,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: _coralColor.withValues(alpha: 0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ]
                          : null,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isTodayItem
                              ? (isVi ? 'Nay' : 'Today')
                              : dayFmt.format(date),
                          style: TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? Colors.white.withValues(alpha: 0.9)
                                : _textMuted,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${date.day}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: isSelected ? Colors.white : _textDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // MARK: - Time Slots Section
  Widget _buildTimeSlotsSection(BuildContext context, bool isVi) {
    // 1. If API availability is provided, use real options directly!
    if (availability != null) {
      final dateStr = DateFormat('yyyy-MM-dd').format(selectedDateTime);
      final day = availability!.days
          .where((d) => d.date == dateStr)
          .firstOrNull;

      List<BookingAvailabilityOptionEntity> availableOptions = [];
      if (day != null && day.options.isNotEmpty) {
        availableOptions = day.options;
      } else if (availability!.options.isNotEmpty) {
        availableOptions = availability!.options
            .where((o) => o.date == dateStr || o.date.isEmpty)
            .toList();
        if (availableOptions.isEmpty && availability!.days.isEmpty) {
          availableOptions = availability!.options;
        }
      }

      // If no slots available for this day, show empty state immediately
      if (availableOptions.isEmpty) {
        return _buildEmptyState(isVi);
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSlotsHeader(isVi, availableOptions.length),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: availableOptions.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2.2,
            ),
            itemBuilder: (context, index) {
              final opt = availableOptions[index];
              final isSelected =
                  selectedTime == opt.startTime ||
                  selectedTime == '${opt.startTime} - ${opt.endTime}';
              final isEarliest = opt.slotTag == 'EARLIEST';
              final isRecommended =
                  opt.isRecommended || opt.slotTag == 'RECOMMENDED';

              // Primary staff id from items if present
              final staffId = opt.items.isNotEmpty
                  ? (opt.items.first.staffProfileId ??
                        selectedStaffId ??
                        'unassigned')
                  : (selectedStaffId ?? 'unassigned');

              return GestureDetector(
                onTap: () {
                  onSelectOption?.call(opt);
                  onSelectSlot(staffId, opt.startTime);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  decoration: BoxDecoration(
                    color: isSelected ? _coralColor : Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isSelected ? _coralColor : const Color(0xFFE2E8F0),
                      width: isSelected ? 1.6 : 1,
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: _coralColor.withValues(alpha: 0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ]
                        : [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.02),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            opt.startTime,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: isSelected
                                  ? FontWeight.w800
                                  : FontWeight.w600,
                              color: isSelected ? Colors.white : _textDark,
                            ),
                          ),
                          if (isSelected) ...[
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.check_rounded,
                              size: 14,
                              color: Colors.white,
                            ),
                          ],
                        ],
                      ),
                      if (!isSelected && (isEarliest || isRecommended))
                        PositionToBadge(
                          isVi: isVi,
                          isRecommended: isRecommended && !isEarliest,
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      );
    }

    // 2. Fallback / Mock preview mode (Chỉ hiện các giờ có thể book, không hiện giờ gạch ngang / disable)
    final distinctTimes = <String>[];
    if (timeColumns.isNotEmpty) {
      for (final t in timeColumns) {
        if (!distinctTimes.contains(t)) distinctTimes.add(t);
      }
    } else {
      for (final s in slots) {
        if (!distinctTimes.contains(s.time)) distinctTimes.add(s.time);
      }
    }

    if (distinctTimes.isEmpty) {
      distinctTimes.addAll([
        '09:00 AM',
        '09:30 AM',
        '10:00 AM',
        '10:30 AM',
        '11:00 AM',
        '01:00 PM',
        '02:00 PM',
        '03:00 PM',
        '04:00 PM',
        '05:00 PM',
      ]);
    }

    final now = DateTime.now();
    final nowMins = now.hour * 60 + now.minute;

    // Filter ONLY bookable hours
    final bookableTimes = <String>[];
    final slotStaffMap = <String, String>{};

    for (final t in distinctTimes) {
      if (isToday) {
        final m = ScheduleGridMapper.displayToMinutes(t);
        if (m != null && m <= nowMins) continue; // Skip passed hours
      }

      final matchingSlots = slots.where((s) => s.time == t).toList();
      if (matchingSlots.isEmpty) {
        bookableTimes.add(t);
        slotStaffMap[t] =
            selectedStaffId ??
            (staffMembers.isNotEmpty ? staffMembers.first.id : 'unassigned');
      } else {
        final availableSlot = matchingSlots
            .where(
              (s) =>
                  !s.isOff &&
                  !s.isBreak &&
                  (s.bookedTitle == null || s.bookedTitle!.isEmpty),
            )
            .firstOrNull;
        if (availableSlot != null) {
          bookableTimes.add(t);
          slotStaffMap[t] = availableSlot.staffId;
        }
      }
    }

    if (bookableTimes.isEmpty) {
      return _buildEmptyState(isVi);
    }

    final earliestTime = bookableTimes.first;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSlotsHeader(isVi, bookableTimes.length),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: bookableTimes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2.2,
          ),
          itemBuilder: (context, index) {
            final timeStr = bookableTimes[index];
            final isSelected = selectedTime == timeStr;
            final isEarliest = timeStr == earliestTime;
            final staffId =
                slotStaffMap[timeStr] ?? (selectedStaffId ?? 'unassigned');

            return GestureDetector(
              onTap: () => onSelectSlot(staffId, timeStr),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                decoration: BoxDecoration(
                  color: isSelected ? _coralColor : Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isSelected ? _coralColor : const Color(0xFFE2E8F0),
                    width: isSelected ? 1.6 : 1,
                  ),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: _coralColor.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ]
                      : [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.02),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          timeStr,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: isSelected
                                ? FontWeight.w800
                                : FontWeight.w600,
                            color: isSelected ? Colors.white : _textDark,
                          ),
                        ),
                        if (isSelected) ...[
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.check_rounded,
                            size: 14,
                            color: Colors.white,
                          ),
                        ],
                      ],
                    ),
                    if (isEarliest && !isSelected) PositionToBadge(isVi: isVi),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSlotsHeader(bool isVi, int availableCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isVi ? 'Khung giờ khả dụng' : 'Available Time Slots',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: _textDark,
                letterSpacing: -0.2,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              isVi
                  ? 'Chọn giờ thuận tiện nhất cho bạn'
                  : 'Pick a convenient start time',
              style: const TextStyle(fontSize: 12.5, color: _textMuted),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '$availableCount ${isVi ? 'giờ trống' : 'slots'}',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF475569),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState(bool isVi) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: [
          const Icon(
            LucideIcons.calendar_x,
            size: 38,
            color: Color(0xFFCBD5E1),
          ),
          const SizedBox(height: 12),
          Text(
            emptyMessage ??
                (isVi
                    ? 'Không có giờ trống trong ngày này'
                    : 'No available slots on this day'),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            isVi
                ? 'Vui lòng chọn ngày khác trên lịch'
                : 'Please select another date on the calendar',
            style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
          ),
        ],
      ),
    );
  }
}

class PositionToBadge extends StatelessWidget {
  final bool isVi;
  final bool isRecommended;
  const PositionToBadge({
    super.key,
    required this.isVi,
    this.isRecommended = false,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isRecommended
        ? const Color(0xFFEFF6FF)
        : const Color(0xFFFEF3C7);
    final textColor = isRecommended
        ? const Color(0xFF2563EB)
        : const Color(0xFFD97706);
    final text = isRecommended
        ? (isVi ? '⭐ Tối ưu' : '⭐ Best')
        : (isVi ? '⚡ Sớm nhất' : '⚡ Sớm');

    return Positioned(
      top: 3,
      right: 5,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 7.5,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
