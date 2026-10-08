part of 'create_booking_bloc.dart';

enum CreateBookingStatus { initial, submitting, success, failure }

@freezed
abstract class CreateBookingState with _$CreateBookingState {
  const CreateBookingState._();

  const factory CreateBookingState({
    @Default(CreateBookingStatus.initial) CreateBookingStatus status,
    BookingEntity? booking,
    Failure? failure,
  }) = _CreateBookingState;

  bool get isInitial => status == CreateBookingStatus.initial;
  bool get isSubmitting => status == CreateBookingStatus.submitting;
  bool get isSuccess => status == CreateBookingStatus.success;
  bool get isFailure => status == CreateBookingStatus.failure;
}
