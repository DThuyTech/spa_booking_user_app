import 'package:spa_booking/src/presentation/view/insights/view/my_insights_view.dart';
import 'package:spa_booking/src/presentation/view/insights/widgets/insights_activity_chart_card.dart';
import 'package:spa_booking/src/presentation/view/insights/widgets/insights_favorite_salon_card.dart';
import 'package:spa_booking/src/presentation/view/insights/widgets/insights_favorite_services_card.dart';
import 'package:spa_booking/src/presentation/view/insights/widgets/insights_month_summary_card.dart';
import 'package:spa_booking/src/presentation/view/insights/widgets/insights_spending_chart_card.dart';
import 'package:spa_booking/src/presentation/view/insights/widgets/insights_usual_visit_card.dart';
import 'package:spa_booking/src/presentation/view/insights/widgets/insights_visits_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('My Insights View & Cards Test Suite', () {
    testWidgets(
      'renders all summary, charts, visit, salon, service and tip cards',
      (tester) async {
        tester.view.physicalSize = const Size(800, 2000);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(const MaterialApp(home: MyInsightsView()));
        await tester.pumpAndSettle();

        // 1. Header & Period Pill
        expect(find.text('My Insights'), findsOneWidget);
        expect(find.text('This Month'), findsOneWidget);

        // 2. Month Summary Card
        expect(find.byType(InsightsMonthSummaryCard), findsOneWidget);
        expect(find.text('Your Month'), findsOneWidget);
        expect(
          find.descendant(
            of: find.byType(InsightsMonthSummaryCard),
            matching: find.text('4'),
          ),
          findsOneWidget,
        );
        expect(find.text('+2 vs last month'), findsOneWidget);
        expect(find.text('₫1,250,000'), findsWidgets);

        // 3. Activity Chart Card
        expect(find.byType(InsightsActivityChartCard), findsOneWidget);
        expect(find.text('Booking Activity'), findsOneWidget);
        expect(find.text('You booked 4 times this month'), findsOneWidget);

        // 4. Spending Chart Card
        expect(find.byType(InsightsSpendingChartCard), findsOneWidget);
        expect(find.text('My Spending'), findsOneWidget);
        expect(find.text('Total: ₫1,250,000'), findsOneWidget);

        // 5. Visits Card
        expect(find.byType(InsightsVisitsCard), findsOneWidget);
        expect(find.text('YOUR VISITS'), findsOneWidget);
        expect(find.text('18'), findsOneWidget);
        expect(find.text('visits this year'), findsOneWidget);

        // 6. Favorite Salon Card
        expect(find.byType(InsightsFavoriteSalonCard), findsOneWidget);
        expect(find.text('FAVORITE SALON'), findsOneWidget);
        expect(find.text('Beauty House'), findsOneWidget);
        expect(find.text('8 visits (62% of bookings)'), findsOneWidget);
        expect(find.text('View Salon'), findsOneWidget);

        // Tap on View Salon
        await tester.tap(find.text('View Salon'));
        await tester.pump(const Duration(seconds: 4));

        // 7. Usual Visit Card
        expect(find.byType(InsightsUsualVisitCard), findsOneWidget);
        expect(find.text('YOUR USUAL VISIT'), findsOneWidget);
        expect(find.text('Saturday'), findsOneWidget);
        expect(find.text('5 PM – 7 PM'), findsOneWidget);

        // 8. Favorite Services Card
        expect(find.byType(InsightsFavoriteServicesCard), findsOneWidget);
        expect(find.text('Favorite Services'), findsOneWidget);
        expect(find.text('Haircut'), findsOneWidget);
        expect(find.text('Hair Color'), findsOneWidget);
        expect(find.text('Facial'), findsOneWidget);

        // 9. Recommendation / Tip Cards
        expect(find.text('Top Service'), findsOneWidget);
        expect(
          find.text(
            'Haircut is your most booked service. Want to try a new stylist?',
          ),
          findsOneWidget,
        );
        expect(find.text('Spending Trend'), findsOneWidget);
        expect(
          find.text('You spent 18% more this month compared to your average.'),
          findsOneWidget,
        );
      },
    );

    testWidgets('allows period selection from popup menu', (tester) async {
      tester.view.physicalSize = const Size(800, 1600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(const MaterialApp(home: MyInsightsView()));
      await tester.pumpAndSettle();

      // Tap on period selector popup
      await tester.tap(find.text('This Month'));
      await tester.pumpAndSettle();

      // Popup items should appear
      expect(find.text('Last 3 Months'), findsOneWidget);
      expect(find.text('This Year'), findsOneWidget);

      // Select 'Last 3 Months'
      await tester.tap(find.text('Last 3 Months'));
      await tester.pumpAndSettle();

      // Pill should now show 'Last 3 Months'
      expect(find.text('Last 3 Months'), findsOneWidget);
    });
  });
}
