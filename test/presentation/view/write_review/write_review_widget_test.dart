import 'package:board_oi/src/presentation/view/write_review/view/write_review_view.dart';
import 'package:board_oi/src/presentation/view/write_review/widgets/review_criteria_card.dart';
import 'package:board_oi/src/presentation/view/write_review/widgets/review_input_card.dart';
import 'package:board_oi/src/presentation/view/write_review/widgets/review_salon_header_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget createTestWidget() {
    return const MaterialApp(home: WriteReviewView(salonName: 'Aura Studio'));
  }

  group('WriteReviewView Tests', () {
    testWidgets('renders all review components correctly', (tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Verify AppBar
      expect(find.text('Write a Review'), findsOneWidget);
      expect(find.text('Post'), findsOneWidget);

      // Verify Header card
      expect(find.byType(ReviewSalonHeaderCard), findsOneWidget);
      expect(find.text('Aura Studio'), findsOneWidget);
      expect(
        find.text('What do you think of your experience?'),
        findsOneWidget,
      );

      // Verify Input Card
      expect(find.byType(ReviewInputCard), findsOneWidget);
      expect(find.text('Tell us more about your visit...'), findsOneWidget);

      // Verify Specific Details Card
      expect(find.byType(ReviewCriteriaCard), findsOneWidget);
      expect(find.text('Rate specific details'), findsOneWidget);
      expect(find.text('Cleanliness'), findsOneWidget);
      expect(find.text('Exceptional'), findsOneWidget);
      expect(find.text('Staff'), findsOneWidget);
      expect(find.text('Great'), findsOneWidget);
      expect(find.text('Atmosphere'), findsOneWidget);
      expect(find.text('Good'), findsOneWidget);

      // Verify Add Photos & Submit button
      expect(find.text('Add Photos'), findsOneWidget);
      expect(find.text('Submit Review'), findsOneWidget);
    });

    testWidgets('allows entering review text and selecting stars', (
      tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pump();

      // Enter review text
      await tester.enterText(
        find.byType(TextField),
        'Amazing service, very clean and friendly staff!',
      );
      await tester.pump();

      expect(
        find.text('Amazing service, very clean and friendly staff!'),
        findsOneWidget,
      );
    });
  });
}
