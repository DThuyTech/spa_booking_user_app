import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/usecases/booking/cancel_booking_usecase.dart';
import '../../../../domain/usecases/booking/reschedule_booking_usecase.dart';
import '../../../../domain/usecases/booking/update_booking_notes_usecase.dart';
import 'booking_action_event.dart';
import 'booking_action_state.dart';

export 'booking_action_event.dart';
export 'booking_action_state.dart';

class BookingActionBloc extends Bloc<BookingActionEvent, BookingActionState> {
  final CancelBookingUseCase cancelBookingUseCase;
  final RescheduleBookingUseCase rescheduleBookingUseCase;
  final UpdateBookingNotesUseCase updateBookingNotesUseCase;

  BookingActionBloc({
    required this.cancelBookingUseCase,
    required this.rescheduleBookingUseCase,
    required this.updateBookingNotesUseCase,
  }) : super(const BookingActionState()) {
    on<CancelBookingEvent>(_onCancelBooking);
    on<RescheduleBookingEvent>(_onRescheduleBooking);
    on<UpdateBookingNotesEvent>(_onUpdateBookingNotes);
    on<ResetBookingActionEvent>(_onReset);
  }


  Future<void> _onCancelBooking(
    CancelBookingEvent event,
    Emitter<BookingActionState> emit,
  ) async {
    emit(state.copyWith(status: BookingActionStatus.loading, failure: null));
    final result = await cancelBookingUseCase(
      bookingId: event.bookingId,
      cancellationReason: event.reason,
    );

    result.fold(
      (Failure failure) => emit(state.copyWith(
        status: BookingActionStatus.failure,
        failure: failure,
      )),
      (booking) => emit(state.copyWith(
        status: BookingActionStatus.cancelledSuccess,
        booking: booking,
        failure: null,
      )),
    );
  }

  Future<void> _onRescheduleBooking(
    RescheduleBookingEvent event,
    Emitter<BookingActionState> emit,
  ) async {
    emit(state.copyWith(status: BookingActionStatus.loading, failure: null));
    final result = await rescheduleBookingUseCase(
      bookingId: event.bookingId,
      startAt: event.startAt,
    );

    result.fold(
      (Failure failure) => emit(state.copyWith(
        status: BookingActionStatus.failure,
        failure: failure,
      )),
      (booking) => emit(state.copyWith(
        status: BookingActionStatus.rescheduledSuccess,
        booking: booking,
        failure: null,
      )),
    );
  }

  Future<void> _onUpdateBookingNotes(
    UpdateBookingNotesEvent event,
    Emitter<BookingActionState> emit,
  ) async {
    emit(state.copyWith(status: BookingActionStatus.loading, failure: null));
    final result = await updateBookingNotesUseCase(
      bookingId: event.bookingId,
      note: event.note,
    );

    result.fold(
      (Failure failure) => emit(state.copyWith(
        status: BookingActionStatus.failure,
        failure: failure,
      )),
      (booking) => emit(state.copyWith(
        status: BookingActionStatus.notesUpdatedSuccess,
        booking: booking,
        failure: null,
      )),
    );
  }

  void _onReset(
    ResetBookingActionEvent event,
    Emitter<BookingActionState> emit,
  ) {
    emit(const BookingActionState());
  }
}

