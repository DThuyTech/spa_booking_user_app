import 'package:flutter/material.dart';

class BookingDashboardSummaryShortBar extends StatelessWidget {
  final int upcomingCount;
  final int todayCount;
  final int completedCount;
  final int cancelledCount;
  final ValueChanged<String>? onFilterSelect;
  final String selectedFilter;

  const BookingDashboardSummaryShortBar({
    super.key,
    required this.upcomingCount,
    required this.todayCount,
    required this.completedCount,
    required this.cancelledCount,
    this.onFilterSelect,
    this.selectedFilter = 'UPCOMING',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildCompactChip(
              title: 'Upcoming',
              count: upcomingCount,
              isPrimary: true,
              isSelected: selectedFilter == 'UPCOMING',
              onTap: () => onFilterSelect?.call('UPCOMING'),
            ),
            const SizedBox(width: 6),
            _buildCompactChip(
              title: 'Today',
              count: todayCount,
              isPrimary: false,
              isSelected: selectedFilter == 'TODAY',
              onTap: () => onFilterSelect?.call('TODAY'),
            ),
            const SizedBox(width: 6),
            _buildCompactChip(
              title: 'Completed',
              count: completedCount,
              isPrimary: false,
              isSelected: selectedFilter == 'COMPLETED',
              onTap: () => onFilterSelect?.call('COMPLETED'),
            ),
            const SizedBox(width: 6),
            _buildCompactChip(
              title: 'Cancelled',
              count: cancelledCount,
              isPrimary: false,
              isSelected: selectedFilter == 'CANCELLED',
              onTap: () => onFilterSelect?.call('CANCELLED'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompactChip({
    required String title,
    required int count,
    required bool isPrimary,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final bool active = isSelected;
    final Color bgColor = active
        ? const Color(0xFFFA7762)
        : (isPrimary ? const Color(0xFFFFF0EC) : const Color(0xFFF8FAFC));
    final Color textColor = active
        ? Colors.white
        : (isPrimary ? const Color(0xFFE05243) : const Color(0xFF475569));

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: active ? FontWeight.w700 : FontWeight.w600,
                color: textColor,
              ),
            ),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1.5),
              decoration: BoxDecoration(
                color: active
                    ? Colors.white.withValues(alpha: 0.25)
                    : Colors.black.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$count',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
