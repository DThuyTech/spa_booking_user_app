import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class BookingDashboardSummaryGrid extends StatelessWidget {
  final int upcomingCount;
  final int allCount;
  final int pastCount;
  final int cancelledCount;
  final ValueChanged<String>? onFilterSelect;
  final String selectedFilter;

  const BookingDashboardSummaryGrid({
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
    return Column(
      children: [
        // Row 1: UPCOMING & ALL
        Row(
          children: [
            Expanded(
              child: _buildCard(
                title: 'UPCOMING',
                count: upcomingCount,
                icon: LucideIcons.calendar_clock,
                isSelected: selectedFilter == 'UPCOMING',
                onTap: () => onFilterSelect?.call('UPCOMING'),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: _buildCard(
                title: 'ALL',
                count: allCount,
                icon: LucideIcons.layout_grid,
                isSelected: selectedFilter == 'ALL',
                onTap: () => onFilterSelect?.call('ALL'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        // Row 2: PAST & CANCELLED
        Row(
          children: [
            Expanded(
              child: _buildCard(
                title: 'PAST',
                count: pastCount,
                icon: LucideIcons.calendar_check,
                isSelected:
                    selectedFilter == 'PAST' || selectedFilter == 'COMPLETED',
                onTap: () => onFilterSelect?.call('PAST'),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: _buildCard(
                title: 'CANCELLED',
                count: cancelledCount,
                icon: LucideIcons.calendar_x,
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
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final bool filled = isSelected;
    final Color bgColor = filled ? const Color(0xFFFA7762) : Colors.white;
    final Color titleColor = filled
        ? Colors.white.withValues(alpha: 0.95)
        : const Color(0xFF64748B);
    final Color countColor = filled ? Colors.white : const Color(0xFF1E293B);
    final Color iconColor = filled ? Colors.white : const Color(0xFFFA7762);
    final Color iconBgColor = filled
        ? Colors.white.withValues(alpha: 0.22)
        : const Color(0xFFFFF1EE);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: isSelected
              ? Border.all(color: const Color(0xFFFA7762), width: 1.5)
              : Border.all(color: const Color(0xFFE2E8F0), width: 1.0),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 17, color: iconColor),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: titleColor,
                    letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
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
