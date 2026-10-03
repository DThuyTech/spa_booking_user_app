import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spa_booking/src/presentation/view/booking_flow/models/booking_models.dart';
import 'package:spa_booking/src/presentation/view/booking_flow/select_services/view/select_services_view.dart';
import 'package:spa_booking/src/presentation/view/booking_flow/select_services/widgets/booking_service_selection_card.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('SelectServicesView - Store Navigated Services', () {
    final customStoreServices = [
      const BookingServiceItem(
        id: 'srv_massage_1',
        category: 'Massage Body',
        name: 'Aroma Therapy Full Body Massage',
        duration: '90 min',
        durationMinutes: 90,
        price: 450000,
        priceDisplay: '450,000 VND',
        isSelected: true,
      ),
      const BookingServiceItem(
        id: 'srv_massage_2',
        category: 'Massage Body',
        name: 'Hot Stone Therapy',
        duration: '60 min',
        durationMinutes: 60,
        price: 350000,
        priceDisplay: '350,000 VND',
        isSelected: false,
      ),
      const BookingServiceItem(
        id: 'srv_skincare_1',
        category: 'Skin Care',
        name: 'Deep Cleansing Facial Treatment',
        duration: '45 min',
        durationMinutes: 45,
        price: 250000,
        priceDisplay: '250,000 VND',
        isSelected: false,
      ),
    ];

    testWidgets('displays store services instead of mock data when navigated from store',
        (tester) async {
      tester.view.physicalSize = const Size(800, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        MaterialApp(
          home: SelectServicesView(
            storeId: 'store_spa_royal',
            salonName: 'Royal Spa Retreat',
            initialServices: customStoreServices,
            initialSelectedServiceId: 'srv_massage_1',
          ),
        ),
      );
      await tester.pump();

      // Verify that the custom store services are displayed
      expect(find.text('Aroma Therapy Full Body Massage'), findsOneWidget);
      expect(find.text('Hot Stone Therapy'), findsOneWidget);
      expect(find.text('Deep Cleansing Facial Treatment'), findsOneWidget);

      // Verify that mock data services are NOT present
      expect(find.text('Haircut'), findsNothing);
      expect(find.text('Hair Styling'), findsNothing);
      expect(find.text('Hair Coloring'), findsNothing);

      // Verify dynamic category headers
      expect(find.text('Massage Body Service'), findsOneWidget);
      expect(find.text('Skin Care Service'), findsOneWidget);

      // Verify summary shows initial selected service (1 service, 1h30m, 450,000 VND)
      expect(find.text('1 Service'), findsOneWidget);
      expect(find.text('1h30m'), findsOneWidget);
      expect(find.text('450,000 VND'), findsWidgets);

      // Toggle hot stone therapy (60m, 350,000 VND)
      final hotStoneCard = find.widgetWithText(
        BookingServiceSelectionCard,
        'Hot Stone Therapy',
      );
      await tester.ensureVisible(hotStoneCard);
      await tester.pump();
      await tester.tap(hotStoneCard);
      await tester.pump();

      // Total count should be 2, duration 90m + 60m = 150m = 2h30m, total 800,000 VND
      expect(find.text('2 Service'), findsOneWidget);
      expect(find.text('2h30m'), findsOneWidget);
      expect(find.text('800,000 VND'), findsWidgets);

      // Filter by category: tap 'Skin Care' chip
      final skinCareChip = find.text('Skin Care');
      await tester.ensureVisible(skinCareChip);
      await tester.pump();
      await tester.tap(skinCareChip);
      await tester.pump();

      // Only Skin Care service should be shown
      expect(find.text('Deep Cleansing Facial Treatment'), findsOneWidget);
      expect(find.text('Aroma Therapy Full Body Massage'), findsNothing);
    });
  });
}
