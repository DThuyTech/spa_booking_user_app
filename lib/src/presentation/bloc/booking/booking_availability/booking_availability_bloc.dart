import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/entities/booking/booking_availability_entity.dart';
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
    emit(
      state.copyWith(status: BookingAvailabilityStatus.loading, failure: null),
    );

    final result = await getAvailabilityUseCase(
      storeId: event.storeId,
      services: event.services,
      dateFrom: event.dateFrom,
      dateTo: event.dateTo,
      stepMinutes: event.stepMinutes,
      mode: event.mode,
      orderMode: event.orderMode,
    );

    result.fold(
      (Failure failure) => emit(
        state.copyWith(
          status: BookingAvailabilityStatus.failure,
          failure: failure,
        ),
      ),
      (availability) {
        BookingAvailabilityOptionEntity? firstOption;
        if (availability.options.isNotEmpty) {
          firstOption = availability.options.first;
        } else if (availability.days.isNotEmpty &&
            availability.days.first.options.isNotEmpty) {
          firstOption = availability.days.first.options.first;
        }

        DateTime? startAtDate;
        if (firstOption != null) {
          startAtDate = DateTime.tryParse(firstOption.startAt);
        }

        emit(
          state.copyWith(
            status: BookingAvailabilityStatus.loaded,
            availability: availability,
            selectedOption: firstOption,
            selectedTime: firstOption?.startTime,
            selectedStartAt: startAtDate,
            failure: null,
          ),
        );
      },
    );
  }

  void _onSelectSlot(
    SelectBookingSlotEvent event,
    Emitter<BookingAvailabilityState> emit,
  ) {
    DateTime? startAtDate;
    if (event.option != null) {
      startAtDate = DateTime.tryParse(event.option!.startAt);
    }
    emit(
      state.copyWith(
        selectedTime: event.time,
        selectedOption: event.option ?? state.selectedOption,
        selectedStartAt: startAtDate ?? state.selectedStartAt,
      ),
    );
  }
}
