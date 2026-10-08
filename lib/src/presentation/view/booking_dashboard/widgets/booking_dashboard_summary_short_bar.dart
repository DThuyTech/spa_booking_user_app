import 'package:flutter/material.dart';

class BookingDashboardSummaryShortBar extends StatelessWidget {
  final int upcomingCount;
  final int allCount;
  final int pastCount;
  final int cancelledCount;
  final ValueChanged<String>? onFilterSelect;
  final String selectedFilter;

  const BookingDashboardSummaryShortBar({
    super.key,
    required this.upcomingCount,
    required this.allCount,
    required this.pastCount,
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
              isSelected: selectedFilter == 'UPCOMING',
              onTap: () => onFilterSelect?.call('UPCOMING'),
            ),
            const SizedBox(width: 6),
            _buildCompactChip(
              title: 'All',
              count: allCount,
              isSelected: selectedFilter == 'ALL',
              onTap: () => onFilterSelect?.call('ALL'),
            ),
            const SizedBox(width: 6),
            _buildCompactChip(
              title: 'Past',
              count: pastCount,
              isSelected:
                  selectedFilter == 'PAST' || selectedFilter == 'COMPLETED',
              onTap: () => onFilterSelect?.call('PAST'),
            ),
            const SizedBox(width: 6),
            _buildCompactChip(
              title: 'Cancelled',
              count: cancelledCount,
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
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final bool active = isSelected;
    final Color bgColor = active
        ? const Color(0xFFFA7762)
        : const Color(0xFFF8FAFC);
    final Color textColor = active ? Colors.white : const Color(0xFF475569);
    final Color countBgColor = active
        ? Colors.white.withValues(alpha: 0.25)
        : const Color(0xFFE2E8F0);
    final Color countTextColor = active
        ? Colors.white
        : const Color(0xFF1E293B);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: active ? const Color(0xFFFA7762) : const Color(0xFFE2E8F0),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                color: textColor,
              ),
            ),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1.5),
              decoration: BoxDecoration(
                color: countBgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$count',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: countTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
