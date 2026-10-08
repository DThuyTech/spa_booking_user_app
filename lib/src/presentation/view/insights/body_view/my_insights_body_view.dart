import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../data/model/analytics/customer_spending_analytics_model.dart';
import '../../../bloc/insights/spending_analytics_bloc.dart';
import '../../../bloc/insights/spending_analytics_event.dart';
import '../../../bloc/insights/spending_analytics_state.dart';
import '../models/insights_models.dart';
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
    final int bookingsCount = analytics?.summary.totalVisits ?? 0;
    final String bookingsDiff =
        analytics != null && analytics.summary.totalVisits > 0
        ? '+${analytics.summary.totalVisits}'
        : '0';
    final String spentDisplay = analytics != null
        ? _formatVnd(analytics.summary.totalSpent)
        : '0 đ';

    final List<double> activityPoints =
        (analytics?.timeline.isNotEmpty ?? false)
        ? analytics!.timeline.map((e) => e.visits.toDouble()).toList()
        : const [];

    final List<double> spendingPoints =
        (analytics?.timeline.isNotEmpty ?? false)
        ? analytics!.timeline.map((e) => e.spent.toDouble()).toList()
        : const [];

    final List<String> chartLabels = (analytics?.timeline.isNotEmpty ?? false)
        ? analytics!.timeline.map((e) => e.date).toList()
        : const [];

    final int totalVisits = analytics?.summary.totalVisits ?? 0;
    final String visitCadence = analytics?.summary.visitCadence ?? '0 lượt';

    final String favoriteSalonName =
        analytics?.summary.favoriteSalonName ??
        analytics?.summary.mostVisitedStore?.storeName ??
        'Chưa có dữ liệu';

    final String favoriteSalonStats =
        analytics?.summary.mostVisitedStore != null
        ? '${analytics!.summary.mostVisitedStore!.visitCount} lần • ${_formatVnd(analytics.summary.mostVisitedStore!.totalSpent)}'
        : '0 lần';

    final List<FavoriteServiceItem> services =
        (analytics?.servicesBreakdown.isNotEmpty ?? false)
        ? analytics!.servicesBreakdown.asMap().entries.map((entry) {
            return FavoriteServiceItem(
              name: entry.value.serviceName,
              lastBooked: 'Đã đặt ${entry.value.bookingCount} lần',
              bookingsCount: entry.value.bookingCount,
              iconType: entry.key == 0
                  ? 'scissors'
                  : (entry.key == 1 ? 'palette' : 'smile'),
            );
          }).toList()
        : const [];

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
            InsightsUsualVisitCard(
              day: analytics?.summary.mostVisitedStore != null
                  ? 'Cuối tuần'
                  : '---',
              time: analytics?.summary.mostVisitedStore != null
                  ? 'Chiều'
                  : '---',
            ),

            if (services.isNotEmpty) ...[
              const SizedBox(height: 16),
              InsightsFavoriteServicesCard(services: services),
              const SizedBox(height: 16),
              InsightsTipBannerCard(
                item: InsightsTipItem(
                  title: 'Dịch vụ yêu thích',
                  message: 'Bạn thường đặt ${services.first.name} nhiều nhất.',
                ),
              ),
            ],

            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
