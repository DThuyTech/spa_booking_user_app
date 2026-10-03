import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/di/dependency_injection.dart';
import '../../../../shared/design_system/components/navigation/app_app_bar.dart';
import '../../../bloc/booking/booking_dashboard/booking_dashboard_bloc.dart';
import '../body_view/booking_dashboard_body_view.dart';

class BookingDashboardView extends StatelessWidget {
  final bool showAppBar;
  final String? initialTab;

  const BookingDashboardView({
    super.key,
    this.showAppBar = false,
    this.initialTab,
  });

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();
    final hasBloc = () {
      try {
        BlocProvider.of<BookingDashboardBloc>(context);
        return true;
      } catch (_) {
        return sl.isRegistered<BookingDashboardBloc>();
      }
    }();

    if (!hasBloc) {
      return Scaffold(
        backgroundColor: const Color(0xFFF8FAFC),
        appBar: showAppBar
            ? AppAppBar(title: 'Bookings', showBackButton: canPop)
            : null,
        body: SafeArea(
          bottom: false,
          child: BookingDashboardBodyView(initialTab: initialTab),
        ),
      );
    }

    return BlocProvider<BookingDashboardBloc>(
      create: (_) =>
          sl<BookingDashboardBloc>()
            ..add(FetchCustomerBookingsEvent(tab: initialTab ?? 'UPCOMING')),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFC),
        appBar: showAppBar
            ? AppAppBar(title: 'Bookings', showBackButton: canPop)
            : null,
        body: SafeArea(
          bottom: false,
          child: BookingDashboardBodyView(initialTab: initialTab),
        ),
      ),
    );
  }
}
