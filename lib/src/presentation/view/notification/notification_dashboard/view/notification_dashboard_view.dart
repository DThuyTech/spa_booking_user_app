import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_booking/src/app/di/dependency_injection.dart';
import 'package:spa_booking/src/presentation/bloc/notification/notification_bloc.dart';
import 'package:spa_booking/src/shared/shared.dart';
import '../../models/notification_models.dart';
import '../../notification_detail_booking/view/booking_notification_view.dart';
import '../../notification_detail_voucher/view/voucher_detail_view.dart';
import '../body_view/notification_dashboard_body_view.dart';

@RoutePage()
class NotificationDashboardPage extends StatelessWidget {
  const NotificationDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NotificationBloc>()
        ..add(const FetchNotificationsEvent())
        ..add(const FetchUnreadCountEvent()),
      child: const NotificationDashboardView(),
    );
  }
}

class NotificationDashboardView extends StatefulWidget {
  const NotificationDashboardView({super.key});

  @override
  State<NotificationDashboardView> createState() =>
      _NotificationDashboardViewState();
}

class _NotificationDashboardViewState extends State<NotificationDashboardView> {
  String _selectedFilter = 'All';

  static const Color _coralColor = Color(0xFFFF6F59);

  void _onNotificationTap(NotificationItem item) {
    // Mark as read in API
    if (!item.isRead) {
      context.read<NotificationBloc>().add(
        MarkNotificationAsReadEvent(item.id),
      );
    }

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
    context.read<NotificationBloc>().add(
      const MarkAllNotificationsAsReadEvent(),
    );
    AppToast.success(context, message: context.l10n.readAll);
  }

  void _onFilterChanged(String filter) {
    setState(() {
      _selectedFilter = filter;
    });

    final bloc = context.read<NotificationBloc>();
    switch (filter) {
      case 'Unread':
        bloc.add(const FetchNotificationsEvent(status: 'UNREAD'));
        break;
      case 'Bookings':
        bloc.add(const FetchNotificationsEvent(type: 'BOOKING'));
        break;
      case 'System':
        bloc.add(const FetchNotificationsEvent(type: 'SYSTEM'));
        break;
      default:
        bloc.add(const FetchNotificationsEvent(status: 'ALL'));
    }
  }

  Future<void> _onRefresh() async {
    _onFilterChanged(_selectedFilter);
    context.read<NotificationBloc>().add(const FetchUnreadCountEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationBloc, NotificationState>(
      listener: (context, state) {
        if (state.isFailure && state.failure != null) {
          AppToast.error(context, message: state.failure!.message);
        }
      },
      builder: (context, state) {
        final notifications = state.items
            .map(NotificationItem.fromEntity)
            .toList();
        final hasUnread = state.items.any((n) => !n.isRead);

        Widget bodyContent;
        if (state.isLoading && state.items.isEmpty) {
          bodyContent = const Center(
            child: CircularProgressIndicator(color: _coralColor),
          );
        } else {
          bodyContent = NotificationDashboardBodyView(
            notifications: notifications,
            selectedFilter: _selectedFilter,
            onFilterChanged: _onFilterChanged,
            onNotificationTap: _onNotificationTap,
            onRefresh: _onRefresh,
          );
        }

        return Scaffold(
          backgroundColor: const Color(0xFFF8F9FA),
          appBar: AppAppBar(
            title: context.l10n.notifications,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: TextButton(
                  onPressed: hasUnread ? _onMarkAllAsRead : null,
                  style: TextButton.styleFrom(
                    foregroundColor: _coralColor,
                    disabledForegroundColor: const Color(0xFFCBD5E1),
                    textStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  child: Text(context.l10n.readAll),
                ),
              ),
            ],
          ),
          body: bodyContent,
        );
      },
    );
  }
}
