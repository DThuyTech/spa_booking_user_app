import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../../models/booking_models.dart';
import '../widgets/booking_schedule_matrix_grid.dart';

class BookingScheduleBodyView extends StatelessWidget {
  final String salonName;
  final String selectedDate;
  final String selectedFilterChip;
  final ValueChanged<String> onFilterChipChanged;
  final List<BookingStaffItem> staffMembers;
  final List<String> timeColumns;
  final List<BookingTimeSlotItem> slots;
  final String? selectedStaffId;
  final String selectedTime;
  final void Function(String staffId, String time) onSelectSlot;
  final VoidCallback onAddCustomBooking;

  const BookingScheduleBodyView({
    super.key,
    required this.salonName,
    required this.selectedDate,
    required this.selectedFilterChip,
    required this.onFilterChipChanged,
    required this.staffMembers,
    required this.timeColumns,
    required this.slots,
    required this.selectedStaffId,
    required this.selectedTime,
    required this.onSelectSlot,
    required this.onAddCustomBooking,
  });

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF2C241F);

  static const List<String> _chips = ['All Staff', 'All Services', 'Popular'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Floating Salon Header Card with Date Pill & 3 Booking Badge (Matching Image 3)
          _buildFloatingHeaderCard(context),

          const SizedBox(height: 16),

          // 2. Filter Pills Row & Floating Add Button
          _buildFilterChipsRow(),

          const SizedBox(height: 16),

          // 3. Timetable Matrix Grid (Staff Rows x Time Columns)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BookingScheduleMatrixGrid(
              staffMembers: staffMembers,
              timeColumns: timeColumns,
              slots: slots,
              selectedStaffId: selectedStaffId,
              selectedTime: selectedTime,
              onSlotTap: onSelectSlot,
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildFloatingHeaderCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Salon Name
          Text(
            salonName,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 14),

          // Date Selector & Booking Count Badge
          Row(
            children: [
              // "Today" Pill
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF475569),
                  ),
                ),
              ),
              const SizedBox(width: 8),

              // Date Dropdown Pill
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        LucideIcons.calendar,
                        size: 14,
                        color: _textDark,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        selectedDate,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: _textDark,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        LucideIcons.chevron_down,
                        size: 14,
                        color: Color(0xFF64748B),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),

              // 3 booking pill
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: _coralColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '3 booking',
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChipsRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: _chips.map((chip) {
                  final isSelected = selectedFilterChip == chip;
                  IconData icon;
                  if (chip == 'All Staff') {
                    icon = LucideIcons.users;
                  } else if (chip == 'All Services') {
                    icon = LucideIcons.scissors;
                  } else {
                    icon = LucideIcons.star;
                  }

                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      onTap: () => onFilterChipChanged(chip),
                      borderRadius: BorderRadius.circular(20),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? _coralColor : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected
                                ? _coralColor
                                : const Color(0xFFE2E8F0),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              icon,
                              size: 13,
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFF475569),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              chip,
                              style: TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                    ? Colors.white
                                    : const Color(0xFF334155),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(width: 8),

          // Orange Floating "+" Button (Matching Image 3)
          GestureDetector(
            onTap: onAddCustomBooking,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: _coralColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: _coralColor.withValues(alpha: 0.35),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                LucideIcons.plus,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
