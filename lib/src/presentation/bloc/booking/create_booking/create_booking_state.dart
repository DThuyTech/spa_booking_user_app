import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/entities/booking/booking_entity.dart';

part 'create_booking_state.freezed.dart';

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
