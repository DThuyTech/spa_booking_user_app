import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/usecases/booking/create_booking_usecase.dart';
import 'create_booking_event.dart';
import 'create_booking_state.dart';

class CreateBookingBloc extends Bloc<CreateBookingEvent, CreateBookingState> {
  final CreateBookingUseCase createBookingUseCase;

  CreateBookingBloc({required this.createBookingUseCase})
    : super(const CreateBookingState()) {
    on<SubmitBookingEvent>(_onSubmitBooking);
    on<ResetCreateBookingEvent>(_onReset);
  }

  Future<void> _onSubmitBooking(
    SubmitBookingEvent event,
    Emitter<CreateBookingState> emit,
  ) async {
    emit(state.copyWith(status: CreateBookingStatus.submitting, failure: null));

    final result = await createBookingUseCase(
      storeId: event.storeId,
      serviceIds: event.serviceIds,
      startAt: event.startAt,
      staffProfileId: event.staffProfileId,
      note: event.note,
    );

    result.fold(
      (Failure failure) => emit(
        state.copyWith(status: CreateBookingStatus.failure, failure: failure),
      ),
      (booking) => emit(
        state.copyWith(
          status: CreateBookingStatus.success,
          booking: booking,
          failure: null,
        ),
      ),
    );
  }

  void _onReset(
    ResetCreateBookingEvent event,
    Emitter<CreateBookingState> emit,
  ) {
    emit(const CreateBookingState());
  }
}
