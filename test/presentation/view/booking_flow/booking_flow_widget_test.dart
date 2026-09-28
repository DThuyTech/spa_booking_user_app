import 'package:board_oi/src/presentation/view/booking_flow/booking_detail/view/booking_detail_view.dart';
import 'package:board_oi/src/presentation/view/booking_flow/booking_result/view/booking_result_view.dart';
import 'package:board_oi/src/presentation/view/booking_flow/booking_schedule/view/booking_schedule_view.dart';
import 'package:board_oi/src/presentation/view/booking_flow/booking_schedule/widgets/booking_schedule_matrix_grid.dart';
import 'package:board_oi/src/presentation/view/booking_flow/select_services/view/select_services_view.dart';
import 'package:board_oi/src/presentation/view/booking_flow/select_services/widgets/booking_service_selection_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('Booking Flow Screen 1: SelectServicesView', () {
    testWidgets(
      'renders all service selection components and calculates total',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          const MaterialApp(home: SelectServicesView(salonName: 'LUXE SALON')),
        );
        await tester.pump();

        // Verify Header
        expect(find.text('New Booking'), findsOneWidget);
        expect(find.textContaining('Sarah • 10:00 AM'), findsOneWidget);

        // Verify Summary Card
        expect(find.text('2 Service'), findsOneWidget);
        expect(find.text('1h30m'), findsOneWidget);

        // Verify Service Type Chips
        expect(find.text('All'), findsOneWidget);
        expect(find.text('Hair'), findsOneWidget);
        expect(find.text('Beauty'), findsOneWidget);
        expect(find.text('Team'), findsOneWidget);

        // Verify Services
        expect(find.text('Hair Service'), findsOneWidget);
        expect(find.text('Haircut'), findsWidgets);
        expect(find.text('Hair Styling'), findsOneWidget);
        expect(find.text('Hair Coloring'), findsOneWidget);

        // Verify Sticky Bottom Bar
        expect(find.text('Total Est.'), findsOneWidget);
        expect(find.text('Confirm Booking'), findsOneWidget);

        // Tap on an unselected service to toggle selection
        final stylingFinder = find.widgetWithText(
          BookingServiceSelectionCard,
          'Hair Styling',
        );
        await tester.ensureVisible(stylingFinder);
        await tester.pump();
        await tester.tap(stylingFinder);
        await tester.pump();

        // Selected service count should increase to 3
        expect(find.text('3 Service'), findsOneWidget);
      },
    );
  });

  group('Booking Flow Screen 2: BookingScheduleView', () {
    testWidgets('renders timetable matrix and slot selection', (tester) async {
      tester.view.physicalSize = const Size(800, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        const MaterialApp(
          home: BookingScheduleView(salonName: 'Luminous Salon'),
        ),
      );
      await tester.pump();

      // Verify AppBar
      expect(find.text('Booking'), findsOneWidget);

      // Verify Floating Header Card
      expect(find.text('Luminous Salon'), findsOneWidget);
      expect(find.text('Today'), findsOneWidget);
      expect(find.text('Aug 26, 2026'), findsOneWidget);
      expect(find.text('3 booking'), findsOneWidget);

      // Verify Filter Chips
      expect(find.text('All Staff'), findsOneWidget);
      expect(find.text('All Services'), findsOneWidget);
      expect(find.text('Popular'), findsOneWidget);

      // Verify Excel Timetable Grid & Headers
      expect(find.byType(BookingScheduleMatrixGrid), findsOneWidget);
      expect(find.text('Staff'), findsOneWidget);
      expect(find.text('09:00 AM'), findsOneWidget);
      expect(find.text('09:30 AM'), findsOneWidget);
      expect(find.text('10:00 AM'), findsOneWidget);

      // Verify Staff entries and status in grid
      expect(find.text('Sarah'), findsOneWidget);
      expect(find.text('Mike'), findsOneWidget);
      expect(find.text('Elena'), findsOneWidget);
      expect(find.text('OFF'), findsOneWidget);
      expect(find.text('BREAK'), findsWidgets);

      // Verify Continue Button
      expect(find.textContaining('Continue to Booking Detail'), findsOneWidget);
    });
  });

  group('Booking Flow Screen 3: BookingDetailView', () {
    testWidgets('renders detail cards and allows adding notes', (tester) async {
      tester.view.physicalSize = const Size(800, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        const MaterialApp(
          home: BookingDetailView(
            salonName: 'Aurus Salon',
            selectedDate: 'Aug 26, 2026',
            selectedTime: '10:00 AM – 12:15 PM',
          ),
        ),
      );
      await tester.pump();

      // Verify Title & Status
      expect(find.text('Booking detail'), findsOneWidget);
      expect(find.text('CONFIRMED'), findsOneWidget);
      expect(find.text('#BK-20260826-0012'), findsOneWidget);

      // Verify Salon banner
      expect(find.text('Aurus Salon'), findsOneWidget);
      expect(find.text('Aug 26, 2026'), findsOneWidget);
      expect(find.text('10:00 AM – 12:15 PM'), findsOneWidget);

      // Verify Services Banner & Items
      expect(find.text('SERVICES'), findsOneWidget);
      expect(find.text('Haircut'), findsOneWidget);
      expect(find.text('Hair Coloring'), findsOneWidget);
      expect(find.text('Hair Wash'), findsOneWidget);

      // Verify User Notes
      expect(find.text('USER NOTES'), findsOneWidget);
      expect(find.text('Add Note'), findsOneWidget);
      expect(find.textContaining('First time client'), findsOneWidget);

      // Verify Pricing
      expect(find.text('Subtotal'), findsOneWidget);
      expect(find.text('10% OFF'), findsOneWidget);
      expect(find.text('Total Amount'), findsOneWidget);
      expect(find.text('UNPAID'), findsOneWidget);

      // Verify Action Buttons
      expect(find.text('Back'), findsOneWidget);
      expect(find.text('Confirm'), findsOneWidget);

      // Add a note
      await tester.enterText(
        find.widgetWithText(TextField, 'Write a description...'),
        'Need sensitive scalp shampoo',
      );
      await tester.pump();
      await tester.tap(find.text('Add Note'));
      await tester.pump();
      expect(
        find.textContaining('Need sensitive scalp shampoo'),
        findsOneWidget,
      );

      // Drain the AppToast 3-second timer
      await tester.pump(const Duration(seconds: 4));
    });
  });

  group('Booking Flow Screen 4: BookingResultView', () {
    testWidgets('renders success and allows toggling to failure preview', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(800, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        const MaterialApp(
          home: BookingResultView(
            isSuccess: true,
            bookingCode: '#BK-20260826-0012',
            salonName: 'Aurus Salon',
            dateDisplay: 'Aug 26, 2026',
            timeDisplay: '10:00 AM – 12:15 PM',
            totalAmount: 540000,
          ),
        ),
      );
      await tester.pump();

      // Verify Success State
      expect(find.text('Booking Confirmed!'), findsOneWidget);
      expect(
        find.textContaining('successfully scheduled with Aurus Salon'),
        findsOneWidget,
      );
      expect(find.text('#BK-20260826-0012'), findsOneWidget);
      expect(find.text('View My Bookings'), findsOneWidget);
      expect(find.text('Back to Home'), findsOneWidget);

      // Toggle to Failed state preview
      final toggleFinder = find.text('Preview Failed State');
      expect(toggleFinder, findsOneWidget);
      await tester.ensureVisible(toggleFinder);
      await tester.pump();
      await tester.tap(toggleFinder);
      await tester.pump();

      // Verify Failed State
      expect(find.text('Booking Failed'), findsOneWidget);
      expect(find.text('Try Again'), findsOneWidget);
      expect(find.text('Preview Success State'), findsOneWidget);
    });
  });
}
