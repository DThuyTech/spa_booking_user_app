import 'package:flutter/material.dart';

class BookingDashboardSummaryGrid extends StatelessWidget {
  final int upcomingCount;
  final int todayCount;
  final int completedCount;
  final int cancelledCount;
  final ValueChanged<String>? onFilterSelect;
  final String selectedFilter;

  const BookingDashboardSummaryGrid({
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
    return Column(
      children: [
        // Row 1: UPCOMING & TODAY
        Row(
          children: [
            Expanded(
              child: _buildCard(
                title: 'UPCOMING',
                count: upcomingCount,
                isPrimary: true,
                isSelected: selectedFilter == 'UPCOMING',
                onTap: () => onFilterSelect?.call('UPCOMING'),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: _buildCard(
                title: 'TODAY',
                count: todayCount,
                isPrimary: false,
                isSelected: selectedFilter == 'TODAY',
                onTap: () => onFilterSelect?.call('TODAY'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        // Row 2: COMPLETED & CANCELLED
        Row(
          children: [
            Expanded(
              child: _buildCard(
                title: 'COMPLETED',
                count: completedCount,
                isPrimary: false,
                isSelected: selectedFilter == 'COMPLETED',
                onTap: () => onFilterSelect?.call('COMPLETED'),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: _buildCard(
                title: 'CANCELLED',
                count: cancelledCount,
                isPrimary: false,
                isSelected: selectedFilter == 'CANCELLED',
                onTap: () => onFilterSelect?.call('CANCELLED'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCard({
    required String title,
    required int count,
    required bool isPrimary,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final bool filled = isPrimary;
    final Color bgColor = filled ? const Color(0xFFFA7762) : Colors.white;
    final Color titleColor = filled
        ? Colors.white.withValues(alpha: 0.9)
        : const Color(0xFF64748B);
    final Color countColor = filled ? Colors.white : const Color(0xFF1E293B);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: isSelected && !filled
              ? Border.all(color: const Color(0xFFFA7762), width: 1.6)
              : Border.all(color: const Color(0xFFF1F5F9), width: 1.0),
          boxShadow: [
            BoxShadow(
              color: filled
                  ? const Color(0xFFFA7762).withValues(alpha: 0.3)
                  : Colors.black.withValues(alpha: 0.03),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: titleColor,
                letterSpacing: 0.8,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '$count',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: countColor,
                height: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
