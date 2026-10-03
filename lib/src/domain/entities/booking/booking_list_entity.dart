import 'package:freezed_annotation/freezed_annotation.dart';
import 'booking_entity.dart';

part 'booking_list_entity.freezed.dart';

@freezed
abstract class BookingSummaryEntity with _$BookingSummaryEntity {
  const factory BookingSummaryEntity({
    @Default(0) int total,
    @Default(0) int upcoming,
    @Default(0) int past,
    @Default(0) int cancelled,
  }) = _BookingSummaryEntity;
}

@freezed
abstract class BookingPaginationEntity with _$BookingPaginationEntity {
  const factory BookingPaginationEntity({
    @Default(0) int total,
    @Default(1) int page,
    @Default(20) int limit,
    @Default(1) int totalPages,
  }) = _BookingPaginationEntity;
}

@freezed
abstract class BookingListResponseEntity with _$BookingListResponseEntity {
  const factory BookingListResponseEntity({
    @Default(BookingSummaryEntity()) BookingSummaryEntity summary,
    @Default([]) List<BookingEntity> items,
    @Default(BookingPaginationEntity()) BookingPaginationEntity pagination,
  }) = _BookingListResponseEntity;
}
