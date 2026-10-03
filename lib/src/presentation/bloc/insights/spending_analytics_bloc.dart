import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/booking/get_customer_spending_analytics_usecase.dart';
import 'spending_analytics_event.dart';
import 'spending_analytics_state.dart';

class SpendingAnalyticsBloc
    extends Bloc<SpendingAnalyticsEvent, SpendingAnalyticsState> {
  final GetCustomerSpendingAnalyticsUseCase _getSpendingAnalyticsUseCase;

  SpendingAnalyticsBloc(this._getSpendingAnalyticsUseCase)
    : super(const SpendingAnalyticsState()) {
    on<FetchSpendingAnalyticsEvent>(_onFetchSpendingAnalytics);
    on<ChangeSpendingAnalyticsPeriodEvent>(_onChangePeriod);
  }

  Future<void> _onFetchSpendingAnalytics(
    FetchSpendingAnalyticsEvent event,
    Emitter<SpendingAnalyticsState> emit,
  ) async {
    emit(state.copyWith(status: SpendingAnalyticsStatus.loading));

    final result = await _getSpendingAnalyticsUseCase(
      period: event.period,
      from: event.from,
      to: event.to,
      storeId: event.storeId,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: SpendingAnalyticsStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (data) => emit(
        state.copyWith(status: SpendingAnalyticsStatus.loaded, analytics: data),
      ),
    );
  }

  Future<void> _onChangePeriod(
    ChangeSpendingAnalyticsPeriodEvent event,
    Emitter<SpendingAnalyticsState> emit,
  ) async {
    final label = event.periodLabel;
    final now = DateTime.now();
    String? from;
    String? to;
    String period = 'MONTH';

    if (label == 'This Month') {
      period = 'DAY';
      final start = DateTime(now.year, now.month, 1);
      from = _formatDate(start);
      to = _formatDate(now);
    } else if (label == 'Last 3 Months') {
      period = 'MONTH';
      final start = DateTime(now.year, now.month - 2, 1);
      from = _formatDate(start);
      to = _formatDate(now);
    } else if (label == 'This Year') {
      period = 'MONTH';
      final start = DateTime(now.year, 1, 1);
      from = _formatDate(start);
      to = _formatDate(now);
    }

    emit(
      state.copyWith(
        selectedPeriodLabel: label,
        status: SpendingAnalyticsStatus.loading,
      ),
    );

    final result = await _getSpendingAnalyticsUseCase(
      period: period,
      from: from,
      to: to,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: SpendingAnalyticsStatus.error,
          errorMessage: failure.message,
        ),
      ),
      (data) => emit(
        state.copyWith(status: SpendingAnalyticsStatus.loaded, analytics: data),
      ),
    );
  }

  String _formatDate(DateTime dt) {
    return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
  }
}
