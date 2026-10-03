import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/usecases/booking/get_availability_usecase.dart';
import 'booking_availability_event.dart';
import 'booking_availability_state.dart';

class BookingAvailabilityBloc
    extends Bloc<BookingAvailabilityEvent, BookingAvailabilityState> {
  final GetAvailabilityUseCase getAvailabilityUseCase;

  BookingAvailabilityBloc({required this.getAvailabilityUseCase})
      : super(const BookingAvailabilityState()) {
    on<CheckAvailabilitySlotsEvent>(_onCheckSlots);
    on<SelectBookingSlotEvent>(_onSelectSlot);
  }

  Future<void> _onCheckSlots(
    CheckAvailabilitySlotsEvent event,
    Emitter<BookingAvailabilityState> emit,
  ) async {
    emit(state.copyWith(
      status: BookingAvailabilityStatus.loading,
      failure: null,
    ));

    final result = await getAvailabilityUseCase(
      storeId: event.storeId,
      date: event.date,
      serviceIds: event.serviceIds,
      staffProfileId: event.staffProfileId,
    );

    result.fold(
      (Failure failure) => emit(state.copyWith(
        status: BookingAvailabilityStatus.failure,
        failure: failure,
      )),
      (availability) {
        String? firstAvailable;
        for (final slot in availability.slots) {
          if (slot.available) {
            firstAvailable = slot.time;
            break;
          }
        }
        emit(state.copyWith(
          status: BookingAvailabilityStatus.loaded,
          availability: availability,
          selectedTime: firstAvailable,
          failure: null,
        ));
      },
    );
  }

  void _onSelectSlot(
    SelectBookingSlotEvent event,
    Emitter<BookingAvailabilityState> emit,
  ) {
    emit(state.copyWith(selectedTime: event.time));
  }
}
