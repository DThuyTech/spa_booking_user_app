import 'package:spa_booking/src/presentation/view/insights/mockup_data/my_insights_mock_data.dart';
import 'package:spa_booking/src/presentation/view/insights/widgets/insights_activity_chart_card.dart';
import 'package:spa_booking/src/presentation/view/insights/widgets/insights_favorite_salon_card.dart';
import 'package:spa_booking/src/presentation/view/insights/widgets/insights_favorite_services_card.dart';
import 'package:spa_booking/src/presentation/view/insights/widgets/insights_month_summary_card.dart';
import 'package:spa_booking/src/presentation/view/insights/widgets/insights_spending_chart_card.dart';
import 'package:spa_booking/src/presentation/view/insights/widgets/insights_tip_banner_card.dart';
import 'package:spa_booking/src/presentation/view/insights/widgets/insights_usual_visit_card.dart';
import 'package:spa_booking/src/presentation/view/insights/widgets/insights_visits_card.dart';
import 'package:spa_booking/src/shared/widgets/toast/app_toast.dart';
import 'package:flutter/material.dart';

class MyInsightsBodyView extends StatelessWidget {
  const MyInsightsBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Month Summary (Bookings + Spent)
          const InsightsMonthSummaryCard(
            bookingsCount: MyInsightsMockData.currentMonthBookings,
            bookingsDiff: MyInsightsMockData.bookingsDiff,
            spentDisplay: MyInsightsMockData.spentDisplay,
          ),

          const SizedBox(height: 16),

          // 2. Booking Activity Line Chart
          InsightsActivityChartCard(
            values: MyInsightsMockData.bookingActivityPoints,
            labels: MyInsightsMockData.chartMonths,
            subtitle:
                'You booked ${MyInsightsMockData.currentMonthBookings} times this month',
          ),

          const SizedBox(height: 16),

          // 3. My Spending Line Chart
          const InsightsSpendingChartCard(
            values: MyInsightsMockData.spendingPoints,
            labels: MyInsightsMockData.chartMonths,
            totalDisplay: 'Total: ${MyInsightsMockData.spentDisplay}',
          ),

          const SizedBox(height: 16),

          // 4. Visits Cadence Card
          const InsightsVisitsCard(
            totalVisits: MyInsightsMockData.totalVisitsYear,
            cadenceText: MyInsightsMockData.visitCadence,
          ),

          const SizedBox(height: 16),

          // 5. Favorite Salon Card
          InsightsFavoriteSalonCard(
            salonName: MyInsightsMockData.favoriteSalonName,
            stats: MyInsightsMockData.favoriteSalonStats,
            onViewSalon: () {
              AppToast.info(context, message: 'Opening Beauty House');
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
          const InsightsFavoriteServicesCard(
            services: MyInsightsMockData.favoriteServices,
          ),

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
    );
  }
}
