import 'package:equatable/equatable.dart';

sealed class BookingDashboardEvent extends Equatable {
  const BookingDashboardEvent();

  @override
  List<Object?> get props => [];
}

class FetchCustomerBookingsEvent extends BookingDashboardEvent {
  final String? tab;
  final bool isRefresh;

  const FetchCustomerBookingsEvent({this.tab, this.isRefresh = false});

  @override
  List<Object?> get props => [tab, isRefresh];
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
