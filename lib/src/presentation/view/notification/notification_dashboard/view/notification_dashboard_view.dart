import 'package:auto_route/auto_route.dart';
import 'package:board_oi/src/shared/design_system/components/navigation/app_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:board_oi/src/shared/widgets/toast/app_toast.dart';
import '../../models/notification_models.dart';
import '../../notification_detail_booking/view/booking_notification_view.dart';
import '../../notification_detail_voucher/view/voucher_detail_view.dart';
import '../body_view/notification_dashboard_body_view.dart';
import '../mockup_data/notification_dashboard_mock_data.dart';

@RoutePage()
class NotificationDashboardPage extends StatelessWidget {
  const NotificationDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const NotificationDashboardView();
  }
}

class NotificationDashboardView extends StatefulWidget {
  const NotificationDashboardView({super.key});

  @override
  State<NotificationDashboardView> createState() =>
      _NotificationDashboardViewState();
}

class _NotificationDashboardViewState extends State<NotificationDashboardView> {
  late List<NotificationItem> _notifications;
  String _selectedFilter = 'All';

  static const Color _coralColor = Color(0xFFFF6F59);

  @override
  void initState() {
    super.initState();
    _notifications = List.from(NotificationDashboardMockData.notifications);
  }

  void _onNotificationTap(NotificationItem item) {
    // Mark as read
    setState(() {
      final index = _notifications.indexWhere((n) => n.id == item.id);
      if (index != -1) {
        _notifications[index] = _notifications[index].copyWith(isRead: true);
      }
    });

    if (item.type == NotificationType.voucher && item.voucherData != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => VoucherDetailView(voucher: item.voucherData!),
        ),
      );
    } else if (item.type == NotificationType.booking &&
        item.bookingData != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => BookingNotificationView(booking: item.bookingData!),
        ),
      );
    } else {
      AppToast.info(context, message: item.title);
    }
  }

  void _onMarkAllAsRead() {
    setState(() {
      _notifications = _notifications
          .map((item) => item.copyWith(isRead: true))
          .toList();
    });
    AppToast.success(context, message: 'All notifications marked as read');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppAppBar(
        title: 'Notifications',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: TextButton(
              onPressed: _onMarkAllAsRead,
              style: TextButton.styleFrom(
                foregroundColor: _coralColor,
                textStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              child: const Text('Read all'),
            ),
          ),
        ],
      ),
      body: NotificationDashboardBodyView(
        notifications: _notifications,
        selectedFilter: _selectedFilter,
        onFilterChanged: (filter) {
          setState(() {
            _selectedFilter = filter;
          });
        },
        onNotificationTap: _onNotificationTap,
      ),
    );
  }
}
