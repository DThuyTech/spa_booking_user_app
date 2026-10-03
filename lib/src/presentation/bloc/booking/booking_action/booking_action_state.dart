import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/entities/booking/booking_entity.dart';

part 'booking_action_state.freezed.dart';

enum BookingActionStatus {
  initial,
  loading,
  cancelledSuccess,
  rescheduledSuccess,
  notesUpdatedSuccess,
  failure,
}

@freezed
abstract class BookingActionState with _$BookingActionState {
  const BookingActionState._();

  const factory BookingActionState({
    @Default(BookingActionStatus.initial) BookingActionStatus status,
    BookingEntity? booking,
    Failure? failure,
  }) = _BookingActionState;

  bool get isInitial => status == BookingActionStatus.initial;
  bool get isLoading => status == BookingActionStatus.loading;
  bool get isCancelledSuccess => status == BookingActionStatus.cancelledSuccess;
  bool get isRescheduledSuccess =>
      status == BookingActionStatus.rescheduledSuccess;
  bool get isNotesUpdatedSuccess =>
      status == BookingActionStatus.notesUpdatedSuccess;
  bool get isFailure => status == BookingActionStatus.failure;
}

