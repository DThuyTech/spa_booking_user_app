import 'package:equatable/equatable.dart';

sealed class BookingAvailabilityEvent extends Equatable {
  const BookingAvailabilityEvent();

  @override
  List<Object?> get props => [];
}

class CheckAvailabilitySlotsEvent extends BookingAvailabilityEvent {
  final String storeId;
  final String date;
  final List<String> serviceIds;
  final String? staffProfileId;

  const CheckAvailabilitySlotsEvent({
    required this.storeId,
    required this.date,
    required this.serviceIds,
    this.staffProfileId,
  });

  @override
  List<Object?> get props => [storeId, date, serviceIds, staffProfileId];
}

class SelectBookingSlotEvent extends BookingAvailabilityEvent {
  final String time;

  const SelectBookingSlotEvent(this.time);

  @override
  List<Object?> get props => [time];
}
