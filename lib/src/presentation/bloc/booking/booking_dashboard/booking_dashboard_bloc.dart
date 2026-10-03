import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/usecases/booking/get_customer_bookings_usecase.dart';
import 'booking_dashboard_event.dart';
import 'booking_dashboard_state.dart';

export 'booking_dashboard_event.dart';
export 'booking_dashboard_state.dart';

class BookingDashboardBloc
    extends Bloc<BookingDashboardEvent, BookingDashboardState> {
  final GetCustomerBookingsUseCase getCustomerBookingsUseCase;

  BookingDashboardBloc({required this.getCustomerBookingsUseCase})
      : super(const BookingDashboardState()) {
    on<FetchCustomerBookingsEvent>(_onFetchBookings);
    on<ChangeBookingTabEvent>(_onChangeTab);
    on<LoadMoreBookingsEvent>(_onLoadMore);
  }

  Future<void> _onFetchBookings(
    FetchCustomerBookingsEvent event,
    Emitter<BookingDashboardState> emit,
  ) async {
    final tab = event.tab ?? state.currentTab;
    if (!event.isRefresh) {
      emit(state.copyWith(
        status: BookingDashboardStatus.loading,
        failure: null,
      ));
    }

    final result = await getCustomerBookingsUseCase(
      tab: tab,
      page: 1,
      limit: 20,
    );

    result.fold(
      (Failure failure) => emit(state.copyWith(
        status: BookingDashboardStatus.failure,
        failure: failure,
      )),
      (response) => emit(state.copyWith(
        status: BookingDashboardStatus.loaded,
        summary: response.summary,
        items: response.items,
        currentTab: tab,
        page: 1,
        hasMore: response.pagination.page < response.pagination.totalPages,
        failure: null,
      )),
    );
  }

  Future<void> _onChangeTab(
    ChangeBookingTabEvent event,
    Emitter<BookingDashboardState> emit,
  ) async {
    emit(state.copyWith(
      status: BookingDashboardStatus.loading,
      currentTab: event.tab,
      failure: null,
    ));

    final result = await getCustomerBookingsUseCase(
      tab: event.tab,
      page: 1,
      limit: 20,
    );

    result.fold(
      (Failure failure) => emit(state.copyWith(
        status: BookingDashboardStatus.failure,
        failure: failure,
      )),
      (response) => emit(state.copyWith(
        status: BookingDashboardStatus.loaded,
        summary: response.summary,
        items: response.items,
        currentTab: event.tab,
        page: 1,
        hasMore: response.pagination.page < response.pagination.totalPages,
        failure: null,
      )),
    );
  }

  Future<void> _onLoadMore(
    LoadMoreBookingsEvent event,
    Emitter<BookingDashboardState> emit,
  ) async {
    if (!state.hasMore || state.isLoading) return;

    final nextPage = state.page + 1;
    final result = await getCustomerBookingsUseCase(
      tab: state.currentTab,
      page: nextPage,
      limit: 20,
    );

    result.fold(
      (Failure failure) => emit(state.copyWith(failure: failure)),
      (response) => emit(state.copyWith(
        summary: response.summary,
        items: [...state.items, ...response.items],
        page: nextPage,
        hasMore: response.pagination.page < response.pagination.totalPages,
      )),
    );
  }
}
