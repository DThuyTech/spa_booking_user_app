import 'package:board_oi/src/presentation/view/onboarding/widgets/onboarding_glass_card.dart';
import 'package:board_oi/src/presentation/view/onboarding/widgets/onboarding_page_indicator.dart';
import 'package:board_oi/src/shared/design_system/components/buttons/app_glass_button.dart';
import 'package:board_oi/src/shared/design_system/components/cards/app_glass_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppGlassButton', () {
    testWidgets('renders label and fires callback on tap', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AppGlassButton(
              label: 'Get Started',
              onPressed: () => tapped = true,
            ),
          ),
        ),
      );

      expect(find.text('Get Started'), findsOneWidget);
      await tester.tap(find.text('Get Started'));
      await tester.pumpAndSettle();

      expect(tapped, isTrue);
    });

    testWidgets('renders loading state when isLoading is true', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AppGlassButton(label: 'Get Started', isLoading: true),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Get Started'), findsNothing);
    });
  });

  group('AppGlassCard', () {
    testWidgets('renders child inside glassmorphic container', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: AppGlassCard(child: Text('Glass Card Content'))),
        ),
      );

      expect(find.text('Glass Card Content'), findsOneWidget);
      expect(find.byType(BackdropFilter), findsOneWidget);
    });
  });

  group('OnboardingPageIndicator', () {
    testWidgets('renders correct number of indicators with active pill', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: OnboardingPageIndicator(count: 3, activeIndex: 1),
          ),
        ),
      );

      expect(find.byType(AnimatedContainer), findsNWidgets(3));

      // The active indicator (index 1) has width 28
      final containers = tester
          .widgetList<AnimatedContainer>(find.byType(AnimatedContainer))
          .toList();

      expect(containers[0].constraints?.maxWidth ?? 6.0, 6.0);
      expect(containers[1].constraints?.maxWidth ?? 28.0, 28.0);
      expect(containers[2].constraints?.maxWidth ?? 6.0, 6.0);
    });
  });

  group('OnboardingGlassCard', () {
    testWidgets('renders title, description, and handles button click', (
      tester,
    ) async {
      bool buttonClicked = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OnboardingGlassCard(
              title: 'Choose your service',
              description: 'Select exactly what you need in a few taps.',
              stepIndex: 0,
              totalSteps: 3,
              buttonText: 'Next',
              onButtonPressed: () => buttonClicked = true,
            ),
          ),
        ),
      );

      expect(find.text('Choose your service'), findsOneWidget);
      expect(
        find.text('Select exactly what you need in a few taps.'),
        findsOneWidget,
      );
      expect(find.text('Next'), findsOneWidget);

      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();

      expect(buttonClicked, isTrue);
    });
  });
}
