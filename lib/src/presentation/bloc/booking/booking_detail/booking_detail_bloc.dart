import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/usecases/booking/get_booking_detail_usecase.dart';
import 'booking_detail_event.dart';
import 'booking_detail_state.dart';

export 'booking_detail_event.dart';
export 'booking_detail_state.dart';

class BookingDetailBloc extends Bloc<BookingDetailEvent, BookingDetailState> {
  final GetBookingDetailUseCase getBookingDetailUseCase;

  BookingDetailBloc({required this.getBookingDetailUseCase})
      : super(const BookingDetailState()) {
    on<LoadBookingDetailEvent>(_onLoadDetail);
    on<UpdateBookingEntityEvent>(_onUpdateBooking);
  }

  Future<void> _onLoadDetail(
    LoadBookingDetailEvent event,
    Emitter<BookingDetailState> emit,
  ) async {
    emit(state.copyWith(
      status: BookingDetailStatus.loading,
      failure: null,
    ));

    final result = await getBookingDetailUseCase(event.bookingId);
    result.fold(
      (Failure failure) => emit(state.copyWith(
        status: BookingDetailStatus.failure,
        failure: failure,
      )),
      (booking) => emit(state.copyWith(
        status: BookingDetailStatus.loaded,
        booking: booking,
        failure: null,
      )),
    );
  }

  void _onUpdateBooking(
    UpdateBookingEntityEvent event,
    Emitter<BookingDetailState> emit,
  ) {
    emit(state.copyWith(booking: event.updated));
  }
}
