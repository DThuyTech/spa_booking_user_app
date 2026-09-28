import 'package:board_oi/src/presentation/view/notification/notification_dashboard/view/notification_dashboard_view.dart';
import 'package:board_oi/src/presentation/view/notification/notification_detail_booking/view/booking_notification_view.dart';
import 'package:board_oi/src/presentation/view/notification/notification_detail_booking/widgets/booking_notification_card.dart';
import 'package:board_oi/src/presentation/view/notification/notification_detail_voucher/view/voucher_detail_view.dart';
import 'package:board_oi/src/presentation/view/notification/notification_detail_voucher/widgets/voucher_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('Notification Screen 1: NotificationDashboardView', () {
    testWidgets('renders notifications and supports filtering and read all', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(800, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        const MaterialApp(home: NotificationDashboardView()),
      );
      await tester.pump();

      // Verify Title & Actions
      expect(find.text('Notifications'), findsOneWidget);
      expect(find.text('Read all'), findsOneWidget);

      // Verify Filter Chips
      expect(find.text('All'), findsOneWidget);
      expect(find.text('Bookings'), findsOneWidget);
      expect(find.text('Vouchers'), findsOneWidget);

      // Verify Group headers & items
      expect(find.text('Today'), findsOneWidget);
      expect(find.text('Yesterday'), findsOneWidget);
      expect(find.text('Earlier'), findsOneWidget);

      // Verify specific notification items
      expect(find.text('Booking Confirmed!'), findsOneWidget);
      expect(find.text('20% OFF your next appointment'), findsOneWidget);

      // Filter by Bookings
      await tester.tap(find.text('Bookings'));
      await tester.pump();

      // Only bookings should be visible
      expect(find.text('Booking Confirmed!'), findsOneWidget);
      expect(find.text('20% OFF your next appointment'), findsNothing);

      // Filter by Vouchers
      await tester.tap(find.text('Vouchers'));
      await tester.pump();

      expect(find.text('Booking Confirmed!'), findsNothing);
      expect(find.text('20% OFF your next appointment'), findsOneWidget);

      // Switch back to All and click Read all
      await tester.tap(find.text('All'));
      await tester.pump();

      await tester.tap(find.text('Read all'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 4)); // drain toast timer
    });
  });

  group('Notification Screen 2: VoucherDetailView (Image 2)', () {
    testWidgets('renders all voucher details and action buttons', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(800, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(const MaterialApp(home: VoucherDetailView()));
      await tester.pump();

      // Verify AppBar
      expect(find.text('Detail'), findsOneWidget);

      // Verify Heading & Description
      expect(find.text('20% OFF your next appointment'), findsOneWidget);
      expect(
        find.textContaining('Enjoy 20% off selected beauty services'),
        findsOneWidget,
      );

      // Verify Voucher Info Card contents
      expect(find.byType(VoucherInfoCard), findsOneWidget);
      expect(find.text('DISCOUNT'), findsOneWidget);
      expect(find.text('20% Off'), findsOneWidget);
      expect(find.text('VALID UNTIL'), findsOneWidget);
      expect(find.text('August 31'), findsOneWidget);
      expect(find.text('APPLICABLE SERVICES'), findsOneWidget);
      expect(find.text('Hair'), findsOneWidget);
      expect(find.text('Nails'), findsOneWidget);
      expect(find.text('Facial'), findsOneWidget);

      // Verify Bottom Buttons
      expect(find.text('Book Now'), findsOneWidget);
      expect(find.text('View Coupon'), findsOneWidget);

      // Tap View Coupon
      await tester.tap(find.text('View Coupon'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 4)); // drain toast timer
    });
  });

  group('Notification Screen 3: BookingNotificationView (Image 3)', () {
    testWidgets('renders booking confirmation card and actions', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(800, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        const MaterialApp(home: BookingNotificationView()),
      );
      await tester.pump();

      // Verify AppBar
      expect(find.text('Detail'), findsOneWidget);

      // Verify Header
      expect(find.text('Booking confirmed'), findsOneWidget);
      expect(
        find.text('Your appointment has been successfully confirmed.'),
        findsOneWidget,
      );

      // Verify Booking Card
      expect(find.byType(BookingNotificationCard), findsOneWidget);
      expect(find.text('MIMI Hair Salon'), findsOneWidget);
      expect(find.text('Confirmed'), findsOneWidget);
      expect(find.text('HAIRCUT & STYLING'), findsOneWidget);
      expect(find.text('STYLIST'), findsOneWidget);
      expect(find.text('Emma'), findsOneWidget);
      expect(find.text('DATE'), findsOneWidget);
      expect(find.text('August 28, 2026'), findsOneWidget);
      expect(find.text('TIME'), findsOneWidget);
      expect(find.text('6:30 PM'), findsOneWidget);

      // Verify Timestamp footer
      expect(find.text('Today, 10:32 AM'), findsOneWidget);

      // Verify Bottom Buttons
      expect(find.text('View Booking'), findsOneWidget);
      expect(find.text('Contact Salon'), findsOneWidget);

      // Tap Contact Salon
      await tester.tap(find.text('Contact Salon'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 4)); // drain toast timer
    });
  });
}
