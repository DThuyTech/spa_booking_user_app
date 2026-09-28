import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../../models/notification_models.dart';
import '../widgets/notification_filter_chips.dart';
import '../widgets/notification_item_card.dart';

class NotificationDashboardBodyView extends StatelessWidget {
  final List<NotificationItem> notifications;
  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;
  final ValueChanged<NotificationItem> onNotificationTap;

  const NotificationDashboardBodyView({
    super.key,
    required this.notifications,
    required this.selectedFilter,
    required this.onFilterChanged,
    required this.onNotificationTap,
  });

  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
    // Filter items
    final filteredItems = notifications.where((item) {
      if (selectedFilter == 'Bookings') {
        return item.type == NotificationType.booking;
      }
      if (selectedFilter == 'Vouchers') {
        return item.type == NotificationType.voucher;
      }
      return true;
    }).toList();

    // Group items
    final todayItems = filteredItems
        .where((i) => i.timeGroup == 'Today')
        .toList();
    final yesterdayItems = filteredItems
        .where((i) => i.timeGroup == 'Yesterday')
        .toList();
    final earlierItems = filteredItems
        .where((i) => i.timeGroup == 'Earlier')
        .toList();

    return Column(
      children: [
        // 1. Filter Chips Row
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: NotificationFilterChips(
            selectedFilter: selectedFilter,
            onFilterChanged: onFilterChanged,
          ),
        ),

        // 2. Notification List
        Expanded(
          child: filteredItems.isEmpty
              ? _buildEmptyState()
              : SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (todayItems.isNotEmpty) ...[
                        _buildGroupHeader('Today'),
                        const SizedBox(height: 10),
                        ...todayItems.map(
                          (item) => NotificationItemCard(
                            notification: item,
                            onTap: () => onNotificationTap(item),
                          ),
                        ),
                        const SizedBox(height: 14),
                      ],
                      if (yesterdayItems.isNotEmpty) ...[
                        _buildGroupHeader('Yesterday'),
                        const SizedBox(height: 10),
                        ...yesterdayItems.map(
                          (item) => NotificationItemCard(
                            notification: item,
                            onTap: () => onNotificationTap(item),
                          ),
                        ),
                        const SizedBox(height: 14),
                      ],
                      if (earlierItems.isNotEmpty) ...[
                        _buildGroupHeader('Earlier'),
                        const SizedBox(height: 10),
                        ...earlierItems.map(
                          (item) => NotificationItemCard(
                            notification: item,
                            onTap: () => onNotificationTap(item),
                          ),
                        ),
                        const SizedBox(height: 14),
                      ],
                    ],
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildGroupHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: _textMuted,
        letterSpacing: 0.2,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: const BoxDecoration(
              color: Color(0xFFF1F5F9),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              LucideIcons.bell_off,
              size: 32,
              color: Color(0xFF94A3B8),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'No notifications yet',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: _textDark,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'You do not have any notifications in this category.',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: _textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
