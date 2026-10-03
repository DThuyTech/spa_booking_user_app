import 'package:equatable/equatable.dart';
import '../../../data/model/analytics/customer_spending_analytics_model.dart';

enum SpendingAnalyticsStatus { initial, loading, loaded, error }

class SpendingAnalyticsState extends Equatable {
  final SpendingAnalyticsStatus status;
  final CustomerSpendingAnalyticsModel? analytics;
  final String selectedPeriodLabel;
  final String? errorMessage;

  const SpendingAnalyticsState({
    this.status = SpendingAnalyticsStatus.initial,
    this.analytics,
    this.selectedPeriodLabel = 'This Month',
    this.errorMessage,
  });

  bool get isLoading => status == SpendingAnalyticsStatus.loading;
  bool get isLoaded => status == SpendingAnalyticsStatus.loaded;

  SpendingAnalyticsState copyWith({
    SpendingAnalyticsStatus? status,
    CustomerSpendingAnalyticsModel? analytics,
    String? selectedPeriodLabel,
    String? errorMessage,
  }) {
    return SpendingAnalyticsState(
      status: status ?? this.status,
      analytics: analytics ?? this.analytics,
      selectedPeriodLabel: selectedPeriodLabel ?? this.selectedPeriodLabel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    analytics,
    selectedPeriodLabel,
    errorMessage,
  ];
}
