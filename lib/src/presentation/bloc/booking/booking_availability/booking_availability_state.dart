import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/entities/booking/booking_availability_entity.dart';

part 'booking_availability_state.freezed.dart';

enum BookingAvailabilityStatus { initial, loading, loaded, failure }

@freezed
abstract class BookingAvailabilityState with _$BookingAvailabilityState {
  const BookingAvailabilityState._();

  const factory BookingAvailabilityState({
    @Default(BookingAvailabilityStatus.initial)
    BookingAvailabilityStatus status,
    BookingAvailabilityEntity? availability,
    String? selectedTime,
    Failure? failure,
  }) = _BookingAvailabilityState;

  bool get isInitial => status == BookingAvailabilityStatus.initial;
  bool get isLoading => status == BookingAvailabilityStatus.loading;
  bool get isLoaded => status == BookingAvailabilityStatus.loaded;
  bool get isFailure => status == BookingAvailabilityStatus.failure;
}
