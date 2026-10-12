part of 'create_booking_bloc.dart';

sealed class CreateBookingEvent extends Equatable {
  const CreateBookingEvent();

  @override
  List<Object?> get props => [];
}

class SubmitBookingEvent extends CreateBookingEvent {
  final String storeId;
  final String? startAt;
  final List<BookingItemParam>? items;
  final List<String>? serviceIds;
  final String? staffProfileId;
  final String? note;

  const SubmitBookingEvent({
    required this.storeId,
    this.startAt,
    this.items,
    this.serviceIds,
    this.staffProfileId,
    this.note,
  });

  @override
  List<Object?> get props => [
    storeId,
    startAt,
    items,
    serviceIds,
    staffProfileId,
    note,
  ];
}

class ResetCreateBookingEvent extends CreateBookingEvent {
  const ResetCreateBookingEvent();
}
