import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/entities/booking/booking_entity.dart';
import '../../../../domain/entities/booking/booking_list_entity.dart';

part 'booking_dashboard_state.freezed.dart';

enum BookingDashboardStatus { initial, loading, loaded, failure }

@freezed
abstract class BookingDashboardState with _$BookingDashboardState {
  const BookingDashboardState._();

  const factory BookingDashboardState({
    @Default(BookingDashboardStatus.initial) BookingDashboardStatus status,
    @Default(BookingSummaryEntity()) BookingSummaryEntity summary,
    @Default([]) List<BookingEntity> items,
    @Default('UPCOMING') String currentTab,
    @Default(1) int page,
    @Default(false) bool hasMore,
    Failure? failure,
  }) = _BookingDashboardState;

  bool get isInitial => status == BookingDashboardStatus.initial;
  bool get isLoading => status == BookingDashboardStatus.loading;
  bool get isLoaded => status == BookingDashboardStatus.loaded;
  bool get isFailure => status == BookingDashboardStatus.failure;
}
