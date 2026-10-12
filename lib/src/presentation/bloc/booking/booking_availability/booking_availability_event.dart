import 'package:equatable/equatable.dart';
import '../../../../domain/entities/booking/booking_availability_entity.dart';
import '../../../../domain/entities/booking/booking_item_param.dart';

sealed class BookingAvailabilityEvent extends Equatable {
  const BookingAvailabilityEvent();

  @override
  List<Object?> get props => [];
}

class CheckAvailabilitySlotsEvent extends BookingAvailabilityEvent {
  final String storeId;
  final List<BookingItemParam> services;
  final String? dateFrom;
  final String? dateTo;
  final int stepMinutes;
  final String mode;
  final String orderMode;

  const CheckAvailabilitySlotsEvent({
    required this.storeId,
    required this.services,
    this.dateFrom,
    this.dateTo,
    this.stepMinutes = 15,
    this.mode = 'SLOT_SEARCH',
    this.orderMode = 'FLEXIBLE',
  });

  @override
  List<Object?> get props => [
    storeId,
    services,
    dateFrom,
    dateTo,
    stepMinutes,
    mode,
    orderMode,
  ];
}

class SelectBookingSlotEvent extends BookingAvailabilityEvent {
  final String time;
  final BookingAvailabilityOptionEntity? option;

  const SelectBookingSlotEvent(this.time, {this.option});

  @override
  List<Object?> get props => [time, option];
}
