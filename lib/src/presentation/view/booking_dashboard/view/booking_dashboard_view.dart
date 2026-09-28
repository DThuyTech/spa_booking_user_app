import 'package:board_oi/src/presentation/view/booking_dashboard/body_view/booking_dashboard_body_view.dart';
import 'package:board_oi/src/shared/design_system/components/navigation/app_app_bar.dart';
import 'package:flutter/material.dart';

class BookingDashboardView extends StatelessWidget {
  final bool showAppBar;

  const BookingDashboardView({super.key, this.showAppBar = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: showAppBar
          ? const AppAppBar(title: 'Bookings', showBackButton: false)
          : null,
      body: const SafeArea(bottom: false, child: BookingDashboardBodyView()),
    );
  }
}
