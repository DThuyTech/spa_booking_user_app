import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:board_oi/src/presentation/view/store_detail/view/store_detail_view.dart';
import 'package:board_oi/src/presentation/view/store_detail/widgets/store_available_now_card.dart';
import 'package:board_oi/src/presentation/view/store_detail/widgets/store_header_card.dart';

void main() {
  Widget createTestWidget() {
    return const MaterialApp(home: StoreDetailView());
  }

  group('StoreDetailView Tests', () {
    testWidgets(
      'renders StoreDetailView with header, store name, and overview tab',
      (tester) async {
        await tester.pumpWidget(createTestWidget());
        await tester.pump();

        // Verify StoreHeaderCard contents
        expect(find.byType(StoreHeaderCard), findsOneWidget);
        expect(find.text('LUXE SALON'), findsOneWidget);
        expect(find.text('Open now'), findsOneWidget);
        expect(
          find.text('3 seats available'),
          findsNWidgets(2),
        ); // Badge and bottom bar

        // Verify Overview tab cards
        expect(find.byType(StoreAvailableNowCard), findsOneWidget);
        expect(find.text('Available now'), findsOneWidget);
        expect(find.text('Book a seat'), findsOneWidget);
        expect(find.text('About'), findsOneWidget);
        expect(find.text('Location'), findsOneWidget);
        expect(find.text('Opening Hours'), findsOneWidget);
        expect(find.text('Information'), findsOneWidget);

        // Verify bottom bar in Overview mode
        expect(find.text('Book now'), findsOneWidget);
        expect(find.text(r'From $15'), findsOneWidget);
      },
    );

    testWidgets(
      'switches to Services tab and renders service groups and book buttons',
      (tester) async {
        await tester.pumpWidget(createTestWidget());
        await tester.pump();

        // Tap on 'Services' tab
        await tester.tap(find.text('Services').first);
        await tester.pumpAndSettle();

        // Verify services content
        expect(find.text('Hair'), findsWidgets);
        expect(find.text('Haircut'), findsOneWidget);
        expect(find.text('Popular'), findsOneWidget);
        expect(find.text('Hair Styling'), findsOneWidget);
        expect(find.text('Hair Coloring'), findsOneWidget);
        expect(find.text('Beauty'), findsWidgets);
        expect(find.text('Manicure'), findsOneWidget);
        expect(find.text('Pedicure'), findsOneWidget);

        // Verify Bottom bar shows 'Book Appointment'
        expect(find.text('Book Appointment'), findsOneWidget);
      },
    );

    testWidgets('switches to Gallery tab and renders photos header and chips', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Tap on 'Gallery' tab
      await tester.tap(find.text('Gallery').first);
      await tester.pumpAndSettle();

      // Verify gallery content
      expect(find.text('Salon photos'), findsOneWidget);
      expect(find.text('Interior'), findsWidgets);
      expect(find.text('Book Appointment'), findsOneWidget);
    });

    testWidgets(
      'switches to Reviews tab and renders customer reviews and breakdown',
      (tester) async {
        await tester.pumpWidget(createTestWidget());
        await tester.pump();

        // Tap on 'Reviews' tab
        await tester.tap(find.text('Reviews').first);
        await tester.pumpAndSettle();

        // Verify reviews content
        expect(find.text('Customer reviews'), findsOneWidget);
        expect(find.text('Review'), findsOneWidget);
        expect(find.text('4.8'), findsOneWidget);
        expect(find.text('238 reviews'), findsOneWidget);
        expect(find.text('Sarah Connor'), findsOneWidget);
        expect(find.text('Mia Richards'), findsOneWidget);
        expect(find.text('View all reviews'), findsOneWidget);
        expect(find.text('Book Appointment'), findsOneWidget);

        // Tap 'Review' button to open WriteReviewView
        await tester.tap(find.text('Review'));
        await tester.pumpAndSettle();

        expect(find.text('Write a Review'), findsOneWidget);
        expect(find.text('Post'), findsOneWidget);
      },
    );
  });
}
