import 'package:flutter/material.dart';
import 'package:spa_booking/src/shared/shared.dart';
import '../../models/notification_models.dart';
import '../widgets/notification_filter_chips.dart';
import '../widgets/notification_item_card.dart';

class NotificationDashboardBodyView extends StatelessWidget {
  final List<NotificationItem> notifications;
  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;
  final ValueChanged<NotificationItem> onNotificationTap;
  final Future<void> Function()? onRefresh;

  const NotificationDashboardBodyView({
    super.key,
    required this.notifications,
    required this.selectedFilter,
    required this.onFilterChanged,
    required this.onNotificationTap,
    this.onRefresh,
  });

  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
    // Filter items
    final filteredItems = notifications.where((item) {
      if (selectedFilter == 'Unread') {
        return !item.isRead;
      }
      if (selectedFilter == 'Bookings') {
        return item.type == NotificationType.booking;
      }
      if (selectedFilter == 'System') {
        return item.type == NotificationType.system;
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

    Widget content = filteredItems.isEmpty
        ? _buildEmptyState(context)
        : SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
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
          );

    if (onRefresh != null) {
      content = RefreshIndicator(
        onRefresh: onRefresh!,
        color: const Color(0xFFFF6F59),
        child: content,
      );
    }

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
        Expanded(child: content),
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

  Widget _buildEmptyState(BuildContext context) {
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
          Text(
            context.l10n.noNotificationsYet,
            style: const TextStyle(
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
