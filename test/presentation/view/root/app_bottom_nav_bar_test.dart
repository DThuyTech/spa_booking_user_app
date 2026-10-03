import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spa_booking/src/presentation/view/root/widgets/app_bottom_nav_bar.dart';

void main() {
  group('AppBottomNavBar Tests with CurvedNavigationBar', () {
    testWidgets('renders CurvedNavigationBar with 5 items', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: AppBottomNavBar(
              currentIndex: 0,
              onTabSelected: (_) {},
              onCenterAction: () {},
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(CurvedNavigationBar), findsOneWidget);
      expect(find.byIcon(LucideIcons.house), findsWidgets);
      expect(find.byIcon(LucideIcons.search), findsOneWidget);
      expect(find.byIcon(LucideIcons.sparkles), findsOneWidget);
      expect(find.byIcon(LucideIcons.calendar), findsOneWidget);
      expect(find.byIcon(LucideIcons.user), findsOneWidget);
    });

    testWidgets('triggers onCenterAction when center item tapped', (
      tester,
    ) async {
      int selectedTab = 0;
      bool centerActionTriggered = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: AppBottomNavBar(
              currentIndex: 0,
              onTabSelected: (index) => selectedTab = index,
              onCenterAction: () => centerActionTriggered = true,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Tap center action item (sparkles)
      await tester.tap(find.byIcon(LucideIcons.sparkles));
      await tester.pumpAndSettle();

      expect(centerActionTriggered, isTrue);
      // Selected tab remains untouched
      expect(selectedTab, equals(0));
    });

    testWidgets('triggers onTabSelected with mapped page indices', (
      tester,
    ) async {
      int selectedTab = -1;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            bottomNavigationBar: AppBottomNavBar(
              currentIndex: 0,
              onTabSelected: (index) => selectedTab = index,
              onCenterAction: () {},
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Tap Search (bar index 1 -> page index 1)
      await tester.tap(find.byIcon(LucideIcons.search));
      await tester.pumpAndSettle();
      expect(selectedTab, equals(1));

      // Tap Bookings (bar index 3 -> page index 2)
      await tester.tap(find.byIcon(LucideIcons.calendar));
      await tester.pumpAndSettle();
      expect(selectedTab, equals(2));

      // Tap Profile (bar index 4 -> page index 3)
      await tester.tap(find.byIcon(LucideIcons.user));
      await tester.pumpAndSettle();
      expect(selectedTab, equals(3));
    });
  });
}
