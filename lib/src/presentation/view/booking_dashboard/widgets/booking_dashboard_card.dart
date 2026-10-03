import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';
import '../mockup_data/booking_dashboard_mock_data.dart';

class BookingDashboardCard extends StatelessWidget {
  final BookingDashboardItem item;
  final VoidCallback? onView;
  final VoidCallback? onReschedule;

  const BookingDashboardCard({
    super.key,
    required this.item,
    this.onView,
    this.onReschedule,
  });

  @override
  Widget build(BuildContext context) {
    if (item.isHighlighted) {
      return _buildHighlightedCard(context);
    }
    return _buildStandardCard(context);
  }

  Widget _buildHighlightedCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFFA7762),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFA7762).withValues(alpha: 0.35),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Info Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Time Badge
              Container(
                width: 60,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.time,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF8B2C1A),
                      ),
                    ),
                    Text(
                      item.amPm,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 14),

              // Title and Store
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    if (item.storeName != null)
                      Row(
                        children: [
                          const Icon(
                            LucideIcons.store,
                            size: 13,
                            color: Colors.white70,
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              item.storeName!,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (item.timeRange != null) ...[
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          const Icon(
                            LucideIcons.clock,
                            size: 13,
                            color: Colors.white70,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            item.timeRange!,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Divider
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.white.withValues(alpha: 0.3),
          ),

          const SizedBox(height: 14),

          // Buttons Row
          Row(
            children: [
              Expanded(
                child: AppButton(
                  text: 'View',
                  onPressed: onView,
                  backgroundColor: Colors.white,
                  textColor: const Color(0xFF334155),
                  borderRadius: BorderRadius.circular(10),
                  height: 38,
                  size: AppButtonSize.sm,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: AppButton(
                  text: 'Reschedule',
                  onPressed: onReschedule,
                  backgroundColor: Colors.white,
                  textColor: const Color(0xFFFA7762),
                  borderRadius: BorderRadius.circular(10),
                  height: 38,
                  size: AppButtonSize.sm,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStandardCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Time Badge
              Container(
                width: 60,
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.time,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    Text(
                      item.amPm,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 14),

              // Title and Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        if (item.duration != null) ...[
                          const Icon(
                            LucideIcons.clock,
                            size: 13,
                            color: Color(0xFF64748B),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            item.duration!,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF64748B),
                            ),
                          ),
                        ],
                        if (item.duration != null && item.staffName != null)
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Text(
                              '•',
                              style: TextStyle(
                                color: Color(0xFF94A3B8),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        if (item.staffName != null) ...[
                          const Icon(
                            LucideIcons.user,
                            size: 13,
                            color: Color(0xFF64748B),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              item.staffName!,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF64748B),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0F7F6),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        item.status,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF0F766E),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Buttons Row
          Row(
            children: [
              Expanded(
                child: AppButton(
                  text: 'View',
                  onPressed: onView,
                  backgroundColor: const Color(0xFFF1F5F9),
                  textColor: const Color(0xFF334155),
                  borderRadius: BorderRadius.circular(10),
                  height: 38,
                  size: AppButtonSize.sm,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: AppButton(
                  text: 'Reschedule',
                  onPressed: onReschedule,
                  variant: AppButtonVariant.outline,
                  textColor: const Color(0xFFE05243),
                  borderRadius: BorderRadius.circular(10),
                  height: 38,
                  size: AppButtonSize.sm,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
