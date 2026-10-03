import 'package:bloc_test/bloc_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/data/model/analytics/customer_spending_analytics_model.dart';
import 'package:spa_booking/src/domain/usecases/booking/get_customer_spending_analytics_usecase.dart';
import 'package:spa_booking/src/presentation/bloc/insights/spending_analytics_bloc.dart';
import 'package:spa_booking/src/presentation/bloc/insights/spending_analytics_event.dart';
import 'package:spa_booking/src/presentation/bloc/insights/spending_analytics_state.dart';

class MockGetCustomerSpendingAnalyticsUseCase extends Mock
    implements GetCustomerSpendingAnalyticsUseCase {}

void main() {
  late MockGetCustomerSpendingAnalyticsUseCase mockUseCase;
  late SpendingAnalyticsBloc bloc;

  const mockAnalytics = CustomerSpendingAnalyticsModel(
    summary: SpendingSummaryModel(
      totalSpent: 1500000,
      totalVisits: 3,
      favoriteSalonName: 'Aura Luxury Spa',
      visitCadence: 'Every 2.4 weeks',
    ),
    timeline: [
      SpendingTimelinePointModel(date: '2026-10-01', spent: 500000, visits: 1),
    ],
  );

  setUp(() {
    mockUseCase = MockGetCustomerSpendingAnalyticsUseCase();
    bloc = SpendingAnalyticsBloc(mockUseCase);
  });

  tearDown(() {
    bloc.close();
  });

  group('SpendingAnalyticsBloc', () {
    test('initial state has SpendingAnalyticsStatus.initial', () {
      expect(bloc.state.status, equals(SpendingAnalyticsStatus.initial));
      expect(bloc.state.selectedPeriodLabel, equals('This Month'));
    });

    blocTest<SpendingAnalyticsBloc, SpendingAnalyticsState>(
      'emits [loading, loaded] when FetchSpendingAnalyticsEvent succeeds',
      build: () {
        when(() => mockUseCase(
              period: any(named: 'period'),
              from: any(named: 'from'),
              to: any(named: 'to'),
              storeId: any(named: 'storeId'),
            )).thenAnswer((_) async => const Right(mockAnalytics));
        return bloc;
      },
      act: (b) => b.add(const FetchSpendingAnalyticsEvent()),
      expect: () => [
        const SpendingAnalyticsState(status: SpendingAnalyticsStatus.loading),
        const SpendingAnalyticsState(
          status: SpendingAnalyticsStatus.loaded,
          analytics: mockAnalytics,
        ),
      ],
    );

    blocTest<SpendingAnalyticsBloc, SpendingAnalyticsState>(
      'emits [loading, loaded] with updated label when ChangeSpendingAnalyticsPeriodEvent is added',
      build: () {
        when(() => mockUseCase(
              period: any(named: 'period'),
              from: any(named: 'from'),
              to: any(named: 'to'),
            )).thenAnswer((_) async => const Right(mockAnalytics));
        return bloc;
      },
      act: (b) => b.add(const ChangeSpendingAnalyticsPeriodEvent('This Year')),
      expect: () => [
        const SpendingAnalyticsState(
          status: SpendingAnalyticsStatus.loading,
          selectedPeriodLabel: 'This Year',
        ),
        const SpendingAnalyticsState(
          status: SpendingAnalyticsStatus.loaded,
          analytics: mockAnalytics,
          selectedPeriodLabel: 'This Year',
        ),
      ],
    );

    blocTest<SpendingAnalyticsBloc, SpendingAnalyticsState>(
      'emits [loading, error] when fetch fails',
      build: () {
        when(() => mockUseCase(
              period: any(named: 'period'),
              from: any(named: 'from'),
              to: any(named: 'to'),
              storeId: any(named: 'storeId'),
            )).thenAnswer(
          (_) async => const Left(ServerFailure('Failed to fetch analytics')),
        );
        return bloc;
      },
      act: (b) => b.add(const FetchSpendingAnalyticsEvent()),
      expect: () => [
        const SpendingAnalyticsState(status: SpendingAnalyticsStatus.loading),
        const SpendingAnalyticsState(
          status: SpendingAnalyticsStatus.error,
          errorMessage: 'Failed to fetch analytics',
        ),
      ],
    );
  });
}
