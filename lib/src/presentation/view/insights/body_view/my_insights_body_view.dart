import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../data/model/analytics/customer_spending_analytics_model.dart';
import '../../../bloc/insights/spending_analytics_bloc.dart';
import '../../../bloc/insights/spending_analytics_event.dart';
import '../../../bloc/insights/spending_analytics_state.dart';
import '../mockup_data/my_insights_mock_data.dart';
import '../widgets/insights_activity_chart_card.dart';
import '../widgets/insights_favorite_salon_card.dart';
import '../widgets/insights_favorite_services_card.dart';
import '../widgets/insights_month_summary_card.dart';
import '../widgets/insights_spending_chart_card.dart';
import '../widgets/insights_tip_banner_card.dart';
import '../widgets/insights_usual_visit_card.dart';
import '../widgets/insights_visits_card.dart';
import '../../../../shared/widgets/toast/app_toast.dart';

class MyInsightsBodyView extends StatelessWidget {
  const MyInsightsBodyView({super.key});

  bool _hasBloc(BuildContext context) {
    try {
      BlocProvider.of<SpendingAnalyticsBloc>(context);
      return true;
    } catch (_) {
      return false;
    }
  }

  String _formatVnd(int amount) {
    final formatter = NumberFormat('#,###', 'vi_VN');
    return '${formatter.format(amount)} đ';
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasBloc(context)) {
      return _buildContent(context, null, 'This Month');
    }

    return BlocBuilder<SpendingAnalyticsBloc, SpendingAnalyticsState>(
      builder: (context, state) {
        if (state.isLoading && state.analytics == null) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 60),
              child: CircularProgressIndicator(color: Color(0xFFFF6F59)),
            ),
          );
        }

        return _buildContent(
          context,
          state.analytics,
          state.selectedPeriodLabel,
        );
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    CustomerSpendingAnalyticsModel? analytics,
    String selectedPeriodLabel,
  ) {

        final int bookingsCount =
            analytics?.summary.totalVisits ?? MyInsightsMockData.currentMonthBookings;
        final String bookingsDiff = analytics != null
            ? (analytics.summary.totalVisits > 0 ? '+${analytics.summary.totalVisits}' : '0')
            : MyInsightsMockData.bookingsDiff;
        final String spentDisplay = analytics != null
            ? _formatVnd(analytics.summary.totalSpent)
            : MyInsightsMockData.spentDisplay;

        final List<double> activityPoints = (analytics?.timeline.isNotEmpty ?? false)
            ? analytics!.timeline.map((e) => e.visits.toDouble()).toList()
            : MyInsightsMockData.bookingActivityPoints;

        final List<double> spendingPoints = (analytics?.timeline.isNotEmpty ?? false)
            ? analytics!.timeline.map((e) => e.spent.toDouble()).toList()
            : MyInsightsMockData.spendingPoints;

        final List<String> chartLabels = (analytics?.timeline.isNotEmpty ?? false)
            ? analytics!.timeline.map((e) => e.date).toList()
            : MyInsightsMockData.chartMonths;

        final int totalVisits =
            analytics?.summary.totalVisits ?? MyInsightsMockData.totalVisitsYear;
        final String visitCadence =
            analytics?.summary.visitCadence ?? MyInsightsMockData.visitCadence;

        final String favoriteSalonName = analytics?.summary.favoriteSalonName ??
            analytics?.summary.mostVisitedStore?.storeName ??
            MyInsightsMockData.favoriteSalonName;

        final String favoriteSalonStats = analytics?.summary.mostVisitedStore != null
            ? '${analytics!.summary.mostVisitedStore!.visitCount} visits • ${_formatVnd(analytics.summary.mostVisitedStore!.totalSpent)}'
            : MyInsightsMockData.favoriteSalonStats;

        final List<FavoriteServiceItem> services =
            (analytics?.servicesBreakdown.isNotEmpty ?? false)
                ? analytics!.servicesBreakdown.asMap().entries.map((entry) {
                    return FavoriteServiceItem(
                      name: entry.value.serviceName,
                      lastBooked: 'Booked ${entry.value.bookingCount} times',
                      bookingsCount: entry.value.bookingCount,
                      iconType: entry.key == 0
                          ? 'scissors'
                          : (entry.key == 1 ? 'palette' : 'smile'),
                    );
                  }).toList()
                : MyInsightsMockData.favoriteServices;

        return RefreshIndicator(
          color: const Color(0xFFFF6F59),
          onRefresh: () async {
            if (_hasBloc(context)) {
              try {
                context.read<SpendingAnalyticsBloc>().add(
                      ChangeSpendingAnalyticsPeriodEvent(selectedPeriodLabel),
                    );
              } catch (_) {}
            }
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 1. Month Summary (Bookings + Spent)
                InsightsMonthSummaryCard(
                  bookingsCount: bookingsCount,
                  bookingsDiff: bookingsDiff,
                  spentDisplay: spentDisplay,
                ),

                const SizedBox(height: 16),

                // 2. Booking Activity Line Chart
                InsightsActivityChartCard(
                  values: activityPoints,
                  labels: chartLabels,
                  subtitle: analytics != null
                      ? 'You booked $bookingsCount times ${selectedPeriodLabel.toLowerCase()}'
                      : 'You booked 4 times this month',
                ),

                const SizedBox(height: 16),

                // 3. My Spending Line Chart
                InsightsSpendingChartCard(
                  values: spendingPoints,
                  labels: chartLabels,
                  totalDisplay: 'Total: $spentDisplay',
                ),

                const SizedBox(height: 16),

                // 4. Visits Cadence Card
                InsightsVisitsCard(
                  totalVisits: totalVisits,
                  cadenceText: visitCadence,
                ),

                const SizedBox(height: 16),

                // 5. Favorite Salon Card
                InsightsFavoriteSalonCard(
                  salonName: favoriteSalonName,
                  stats: favoriteSalonStats,
                  onViewSalon: () {
                    AppToast.info(context, message: 'Opening $favoriteSalonName');
                  },
                ),

                const SizedBox(height: 16),

                // 6. Usual Visit (Day + Time + Clock Watermark)
                const InsightsUsualVisitCard(
                  day: MyInsightsMockData.usualVisitDay,
                  time: MyInsightsMockData.usualVisitTime,
                ),

                const SizedBox(height: 16),

                // 7. Favorite Services List
                InsightsFavoriteServicesCard(services: services),

                const SizedBox(height: 16),

                // 8. Tip 1: Top Service
                if (MyInsightsMockData.tips.isNotEmpty)
                  InsightsTipBannerCard(item: MyInsightsMockData.tips[0]),

                const SizedBox(height: 12),

                // 9. Tip 2: Spending Trend
                if (MyInsightsMockData.tips.length > 1)
                  InsightsTipBannerCard(item: MyInsightsMockData.tips[1]),

                const SizedBox(height: 48),
              ],
            ),
          ),
        );
  }
}

