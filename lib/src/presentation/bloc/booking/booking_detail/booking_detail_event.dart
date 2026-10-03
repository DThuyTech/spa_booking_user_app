import 'package:equatable/equatable.dart';
import '../../../../domain/entities/booking/booking_entity.dart';

sealed class BookingDetailEvent extends Equatable {
  const BookingDetailEvent();

  @override
  List<Object?> get props => [];
}

class LoadBookingDetailEvent extends BookingDetailEvent {
  final String bookingId;

  const LoadBookingDetailEvent(this.bookingId);

  @override
  List<Object?> get props => [bookingId];
}

class UpdateBookingEntityEvent extends BookingDetailEvent {
  final BookingEntity updated;

  const UpdateBookingEntityEvent(this.updated);

  @override
  List<Object?> get props => [updated];
}
