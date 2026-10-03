import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../../models/booking_models.dart';

class BookingScheduleMatrixGrid extends StatelessWidget {
  final List<BookingStaffItem> staffMembers;
  final List<String> timeColumns;
  final List<BookingTimeSlotItem> slots;
  final String? selectedStaffId;
  final String selectedTime;
  final void Function(String staffId, String time) onSlotTap;

  const BookingScheduleMatrixGrid({
    super.key,
    required this.staffMembers,
    required this.timeColumns,
    required this.slots,
    required this.selectedStaffId,
    required this.selectedTime,
    required this.onSlotTap,
  });

  static const double _staffColWidth = 84.0;
  static const double _timeColWidth = 110.0;
  static const double _rowHeight = 72.0;

  static const Color _borderColor = Color(0xFFE2E8F0);
  static const Color _textDark = Color(0xFF2C241F);
  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _coralLightBg = Color(0xFFFFF5F3);
  static const Color _breakBg = Color(0xFFF1F5F9);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: _staffColWidth + (timeColumns.length * _timeColWidth),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header Row: Staff | 09:00 AM | 09:30 AM | ...
              _buildHeaderRow(),

              // Rows for each staff
              ...staffMembers.map((staff) => _buildStaffRow(staff)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Container(
      height: 52,
      decoration: const BoxDecoration(
        color: Color(0xFFFCFDFD),
        border: Border(bottom: BorderSide(color: _borderColor, width: 1.0)),
      ),
      child: Row(
        children: [
          // "Staff" label cell
          Container(
            width: _staffColWidth,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(color: _borderColor, width: 1.0),
              ),
            ),
            child: const Text(
              'Staff',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF64748B),
              ),
            ),
          ),

          // Time slot header labels
          ...timeColumns.map(
            (time) => Container(
              width: _timeColWidth,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(color: _borderColor, width: 1.0),
                ),
              ),
              child: Text(
                time,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF475569),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStaffRow(BookingStaffItem staff) {
    return Container(
      height: _rowHeight,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: _borderColor, width: 1.0)),
      ),
      child: Row(
        children: [
          // Staff Profile Info Cell
          Container(
            width: _staffColWidth,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(color: _borderColor, width: 1.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: staff.avatarBgColor,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    staff.initials,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF334155),
                    ),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  staff.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: _textDark,
                  ),
                ),
              ],
            ),
          ),

          // If staff is OFF, span full row with OFF (Matching Image 3 & 4)
          if (staff.isOff)
            Expanded(
              child: Container(
                color: const Color(0xFFF1F5F9),
                alignment: Alignment.center,
                child: const Text(
                  'OFF',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF94A3B8),
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            )
          else
            // Time cells
            ...timeColumns.map((time) {
              final slot = slots.firstWhere(
                (s) => s.staffId == staff.id && s.time == time,
                orElse: () =>
                    BookingTimeSlotItem(staffId: staff.id, time: time),
              );

              final isCurrentlySelected =
                  selectedStaffId == staff.id &&
                  selectedTime == time &&
                  !slot.isBreak &&
                  !slot.isOff &&
                  slot.bookedTitle == null;

              return Container(
                width: _timeColWidth,
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(color: _borderColor, width: 1.0),
                  ),
                ),
                padding: const EdgeInsets.all(4),
                child: _buildSlotContent(
                  staff: staff,
                  time: time,
                  slot: slot,
                  isSelected: isCurrentlySelected,
                ),
              );
            }),
        ],
      ),
    );
  }

  Widget _buildSlotContent({
    required BookingStaffItem staff,
    required String time,
    required BookingTimeSlotItem slot,
    required bool isSelected,
  }) {
    // 1. Break slot
    if (slot.isBreak) {
      return Container(
        decoration: BoxDecoration(
          color: _breakBg,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: const Text(
          'BREAK',
          style: TextStyle(
            fontSize: 11.5,
            fontWeight: FontWeight.w700,
            color: Color(0xFF64748B),
            letterSpacing: 0.8,
          ),
        ),
      );
    }

    // 1b. Unavailable cell (outside shift / store full / services don't fit)
    if (slot.isOff) {
      return Container(
        decoration: BoxDecoration(
          color: _breakBg,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          slot.bookedTitle ?? 'OFF',
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: Color(0xFF94A3B8),
            letterSpacing: 0.6,
          ),
        ),
      );
    }

    // 2. Booked slot with colored pill (Green, Orange, Blue matching Image 3 & 4)
    if (slot.bookedTitle != null) {
      final accentColor = slot.bookedTitle == 'Haircut'
          ? const Color(0xFF10B981)
          : slot.bookedTitle == 'Coloring'
          ? const Color(0xFFEA580C)
          : const Color(0xFF2563EB);

      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: slot.color ?? const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(8),
          border: Border(left: BorderSide(color: accentColor, width: 3.5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              slot.bookedTitle!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: accentColor,
              ),
            ),
            if (slot.clientName != null) ...[
              const SizedBox(height: 2),
              Text(
                slot.clientName!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF475569),
                ),
              ),
            ],
          ],
        ),
      );
    }

    // 3. Selected Active Slot (Matching "+" cell in Image 4 with coral border)
    if (isSelected || slot.isSelected) {
      return GestureDetector(
        onTap: () => onSlotTap(staff.id, time),
        child: Container(
          decoration: BoxDecoration(
            color: _coralLightBg,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: _coralColor, width: 1.5),
          ),
          alignment: Alignment.center,
          child: const Icon(LucideIcons.plus, color: _coralColor, size: 20),
        ),
      );
    }

    // 4. Empty Available Slot (Tappable)
    return InkWell(
      onTap: () => onSlotTap(staff.id, time),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
