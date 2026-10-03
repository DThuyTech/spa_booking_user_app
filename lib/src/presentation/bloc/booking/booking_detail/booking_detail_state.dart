import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/entities/booking/booking_entity.dart';

part 'booking_detail_state.freezed.dart';

enum BookingDetailStatus { initial, loading, loaded, failure }

@freezed
abstract class BookingDetailState with _$BookingDetailState {
  const BookingDetailState._();

  const factory BookingDetailState({
    @Default(BookingDetailStatus.initial) BookingDetailStatus status,
    BookingEntity? booking,
    Failure? failure,
  }) = _BookingDetailState;

  bool get isInitial => status == BookingDetailStatus.initial;
  bool get isLoading => status == BookingDetailStatus.loading;
  bool get isLoaded => status == BookingDetailStatus.loaded;
  bool get isFailure => status == BookingDetailStatus.failure;
}
