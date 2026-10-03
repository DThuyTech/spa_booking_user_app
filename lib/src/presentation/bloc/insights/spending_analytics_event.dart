import 'package:equatable/equatable.dart';

abstract class SpendingAnalyticsEvent extends Equatable {
  const SpendingAnalyticsEvent();

  @override
  List<Object?> get props => [];
}

class FetchSpendingAnalyticsEvent extends SpendingAnalyticsEvent {
  final String? period;
  final String? from;
  final String? to;
  final String? storeId;

  const FetchSpendingAnalyticsEvent({
    this.period,
    this.from,
    this.to,
    this.storeId,
  });

  @override
  List<Object?> get props => [period, from, to, storeId];
}

class ChangeSpendingAnalyticsPeriodEvent extends SpendingAnalyticsEvent {
  final String periodLabel;

  const ChangeSpendingAnalyticsPeriodEvent(this.periodLabel);

  @override
  List<Object?> get props => [periodLabel];
}
