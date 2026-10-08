import 'package:equatable/equatable.dart';

sealed class BookingDashboardEvent extends Equatable {
  const BookingDashboardEvent();

  @override
  List<Object?> get props => [];
}

class FetchCustomerBookingsEvent extends BookingDashboardEvent {
  final String? tab;
  final String? status;
  final String? date;
  final bool isRefresh;

  const FetchCustomerBookingsEvent({
    this.tab,
    this.status,
    this.date,
    this.isRefresh = false,
  });

  @override
  List<Object?> get props => [tab, status, date, isRefresh];
}

class ChangeBookingTabEvent extends BookingDashboardEvent {
  final String tab;

  const ChangeBookingTabEvent(this.tab);

  @override
  List<Object?> get props => [tab];
}

class LoadMoreBookingsEvent extends BookingDashboardEvent {
  const LoadMoreBookingsEvent();
}
