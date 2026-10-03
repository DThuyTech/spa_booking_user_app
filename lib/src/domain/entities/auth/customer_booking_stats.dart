import 'package:equatable/equatable.dart';

class CustomerBookingStats extends Equatable {
  final int totalBookings;
  final int upcomingBookings;
  final int completedBookings;
  final int cancelledBookings;
  final int totalSpent;
  final String? lastBookingDate;
  final String? lastBookingStoreName;

  const CustomerBookingStats({
    this.totalBookings = 0,
    this.upcomingBookings = 0,
    this.completedBookings = 0,
    this.cancelledBookings = 0,
    this.totalSpent = 0,
    this.lastBookingDate,
    this.lastBookingStoreName,
  });

  @override
  List<Object?> get props => [
        totalBookings,
        upcomingBookings,
        completedBookings,
        cancelledBookings,
        totalSpent,
        lastBookingDate,
        lastBookingStoreName,
      ];
}
