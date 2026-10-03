import 'package:equatable/equatable.dart';

sealed class BookingActionEvent extends Equatable {
  const BookingActionEvent();

  @override
  List<Object?> get props => [];
}

class CancelBookingEvent extends BookingActionEvent {
  final String bookingId;
  final String? reason;

  const CancelBookingEvent({required this.bookingId, this.reason});

  @override
  List<Object?> get props => [bookingId, reason];
}

class RescheduleBookingEvent extends BookingActionEvent {
  final String bookingId;
  final String startAt;

  const RescheduleBookingEvent({
    required this.bookingId,
    required this.startAt,
  });

  @override
  List<Object?> get props => [bookingId, startAt];
}

class UpdateBookingNotesEvent extends BookingActionEvent {
  final String bookingId;
  final String note;

  const UpdateBookingNotesEvent({
    required this.bookingId,
    required this.note,
  });

  @override
  List<Object?> get props => [bookingId, note];
}

class ResetBookingActionEvent extends BookingActionEvent {
  const ResetBookingActionEvent();
}

