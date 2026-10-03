import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spa_booking/src/data/model/booking/booking_list_response_model.dart';
import 'package:spa_booking/src/domain/entities/booking/booking_list_entity.dart';
import 'package:spa_booking/src/domain/usecases/booking/get_customer_bookings_usecase.dart';
import 'package:spa_booking/src/presentation/bloc/booking/booking_dashboard/booking_dashboard_bloc.dart';
import 'package:spa_booking/src/presentation/view/booking_dashboard/body_view/booking_dashboard_body_view.dart';
import 'package:spa_booking/src/presentation/view/booking_dashboard/view/booking_dashboard_view.dart';
import 'package:spa_booking/src/presentation/view/booking_dashboard/widgets/booking_dashboard_card.dart';
import 'package:spa_booking/src/presentation/view/booking_dashboard/widgets/booking_dashboard_summary_grid.dart';
import 'package:spa_booking/src/presentation/view/booking_dashboard/widgets/booking_dashboard_summary_short_bar.dart';
import 'package:spa_booking/src/presentation/view/booking_dashboard/widgets/booking_search_filter_bar.dart';
import 'package:spa_booking/src/presentation/view/booking_dashboard_detail/view/booking_dashboard_detail_view.dart';
import 'package:spa_booking/src/presentation/view/booking_dashboard_detail/widgets/booking_detail_datetime_card.dart';
import 'package:spa_booking/src/presentation/view/booking_dashboard_detail/widgets/booking_detail_notes_card.dart';
import 'package:spa_booking/src/presentation/view/booking_dashboard_detail/widgets/booking_detail_payment_card.dart';
import 'package:spa_booking/src/presentation/view/booking_dashboard_detail/widgets/booking_detail_services_card.dart';
import 'package:spa_booking/src/presentation/view/booking_dashboard_detail/widgets/booking_detail_store_card.dart';
import 'package:spa_booking/src/presentation/view/terms/view/terms_of_use_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGetCustomerBookingsUseCase extends Mock
    implements GetCustomerBookingsUseCase {}

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('Terms of Use View Tests (Image 1)', () {
    testWidgets('renders all sections and Accept & Continue button', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(800, 1600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(const MaterialApp(home: TermsOfUseView()));
      await tester.pumpAndSettle();

      expect(find.text('Terms of Use'), findsOneWidget);
      expect(find.text('LAST UPDATED: OCTOBER 24, 2023'), findsOneWidget);
      expect(find.text('1. Acceptance of Terms'), findsOneWidget);
      expect(find.text('2. User Obligations'), findsOneWidget);
      expect(find.text('Accept & Continue'), findsOneWidget);
    });

    testWidgets('shows floating scroll to top button when scrolled down', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(800, 600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(const MaterialApp(home: TermsOfUseView()));
      await tester.pumpAndSettle();

      // Initially at top, no floating button
      expect(find.byType(FloatingActionButton), findsNothing);

      // Scroll down
      await tester.drag(
        find.text('1. Acceptance of Terms'),
        const Offset(0, -300),
      );
      await tester.pumpAndSettle();

      // Floating button appears
      expect(find.byType(FloatingActionButton), findsOneWidget);

      // Tap to scroll back to top
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
    });
  });

  group('Booking Dashboard View Tests (Image 2)', () {
    testWidgets(
      'renders summary grid, search bar with filter, and booking cards',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1600);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          const MaterialApp(home: BookingDashboardView()),
        );
        await tester.pumpAndSettle();

        // Summary Grid
        expect(find.byType(BookingDashboardSummaryGrid), findsOneWidget);
        expect(find.text('UPCOMING'), findsOneWidget);
        expect(find.text('TODAY'), findsWidgets);
        expect(find.text('COMPLETED'), findsOneWidget);
        expect(find.text('CANCELLED'), findsOneWidget);

        // Search & Filter
        expect(find.byType(BookingSearchFilterBar), findsOneWidget);
        expect(find.text('Search salons, services...'), findsOneWidget);

        // Cards
        expect(find.byType(BookingDashboardCard), findsNWidgets(3));
        expect(find.text('Haircut, Dried'), findsOneWidget);
        expect(find.text('Aurora Store'), findsOneWidget);
        expect(find.text('Haircut'), findsOneWidget);
        expect(find.text('Hair Coloring'), findsOneWidget);

        // Navigates to detail on View tap
        await tester.tap(find.text('View').first);
        await tester.pumpAndSettle();

        expect(find.byType(BookingDashboardDetailView), findsOneWidget);
      },
    );

    testWidgets('opens filter bottomsheet when filter button tapped', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(800, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(const MaterialApp(home: BookingDashboardView()));
      await tester.pumpAndSettle();

      // Tap filter icon
      await tester.tap(find.byType(BookingSearchFilterBar));
      await tester.pumpAndSettle();
    });

    test('BookingListResponseModel handles flat pagination correctly', () {
      final json = {
        'items': <dynamic>[],
        'total': 0,
        'page': 1,
        'limit': 20,
        'totalPages': 1,
        'summary': {'total': 0, 'upcoming': 0, 'past': 0, 'cancelled': 0},
      };

      final model = BookingListResponseModel.fromJson(json);
      expect(model.items, isEmpty);
      expect(model.summary?.upcoming, 0);
      expect(model.pagination?.total, 0);
      expect(model.pagination?.page, 1);
      expect(model.pagination?.limit, 20);
      expect(model.pagination?.totalPages, 1);

      final entity = model.toEntity();
      expect(entity.items, isEmpty);
      expect(entity.summary.upcoming, 0);
      expect(entity.pagination.total, 0);
      expect(entity.pagination.totalPages, 1);
    });

    testWidgets(
      'renders empty state and 0 counters when API returns 0 bookings',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1600);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        final mockUseCase = MockGetCustomerBookingsUseCase();
        when(
          () => mockUseCase(
            tab: any(named: 'tab'),
            page: any(named: 'page'),
            limit: any(named: 'limit'),
          ),
        ).thenAnswer(
          (_) async => const Right(
            BookingListResponseEntity(
              items: [],
              summary: BookingSummaryEntity(
                total: 0,
                upcoming: 0,
                past: 0,
                cancelled: 0,
              ),
              pagination: BookingPaginationEntity(
                total: 0,
                page: 1,
                limit: 20,
                totalPages: 1,
              ),
            ),
          ),
        );

        final bloc = BookingDashboardBloc(
          getCustomerBookingsUseCase: mockUseCase,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider<BookingDashboardBloc>.value(
              value: bloc
                ..add(const FetchCustomerBookingsEvent(tab: 'UPCOMING')),
              child: const Scaffold(body: BookingDashboardBodyView()),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Counts in summary grid should all be 0 (NOT mock counts: 2, 1, 12, 2)
        expect(
          find.descendant(
            of: find.byType(BookingDashboardSummaryGrid),
            matching: find.text('0'),
          ),
          findsNWidgets(4),
        );
        // No mock cards
        expect(find.text('Haircut, Dried'), findsNothing);
        expect(find.byType(BookingDashboardCard), findsNothing);
        // Empty state visible
        expect(find.text('No upcoming bookings'), findsOneWidget);
        expect(
          find.text('You have no upcoming appointments scheduled.'),
          findsOneWidget,
        );
      },
    );

    testWidgets('displays smaller pinned overview on top when scrolling down', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(800, 600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(const MaterialApp(home: BookingDashboardView()));
      await tester.pumpAndSettle();

      // Initially at top: AnimatedOpacity has opacity 0.0
      final opacityFinderBefore = find.ancestor(
        of: find.byType(BookingDashboardSummaryShortBar),
        matching: find.byType(AnimatedOpacity),
      );
      final AnimatedOpacity opacityWidgetBefore = tester.widget(
        opacityFinderBefore,
      );
      expect(opacityWidgetBefore.opacity, 0.0);

      // Scroll down past overview
      await tester.drag(
        find.byType(BookingSearchFilterBar),
        const Offset(0, -300),
      );
      await tester.pumpAndSettle();

      // When scrolled: AnimatedOpacity has opacity 1.0 (pinned compact overview is visible)
      final opacityFinderAfter = find.ancestor(
        of: find.byType(BookingDashboardSummaryShortBar),
        matching: find.byType(AnimatedOpacity),
      );
      final AnimatedOpacity opacityWidgetAfter = tester.widget(
        opacityFinderAfter,
      );
      expect(opacityWidgetAfter.opacity, 1.0);
    });
  });

  group('Booking Dashboard Detail View Tests (Image 3)', () {
    testWidgets(
      'renders all detail sections and Cancel / Connect action buttons',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1600);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          const MaterialApp(home: BookingDashboardDetailView()),
        );
        await tester.pumpAndSettle();

        // Title & Status
        expect(find.text('Booking detail'), findsOneWidget);
        expect(find.text('CONFIRMED'), findsOneWidget);
        expect(find.text('#BK-20260826-0012'), findsOneWidget);

        // Cards
        expect(find.byType(BookingDetailStoreCard), findsOneWidget);
        expect(find.text('Aurus Salon'), findsOneWidget);

        expect(find.byType(BookingDetailDateTimeCard), findsOneWidget);
        expect(find.text('Aug 26, 2026'), findsOneWidget);
        expect(find.text('10:00 AM – 12:15 PM'), findsOneWidget);
        expect(find.text('2h 15m'), findsOneWidget);

        expect(find.byType(BookingDetailServicesCard), findsOneWidget);
        expect(find.text('SERVICES'), findsOneWidget);
        expect(find.text('150,000 VND'), findsOneWidget);
        expect(find.text('400,000 VND'), findsOneWidget);
        expect(find.text('50,000 VND'), findsOneWidget);

        expect(find.byType(BookingDetailNotesCard), findsOneWidget);
        expect(find.text('USER NOTES'), findsOneWidget);
        expect(
          find.text('First time client. Prefers quiet appointment.'),
          findsOneWidget,
        );

        expect(find.byType(BookingDetailPaymentCard), findsOneWidget);
        expect(find.text('Subtotal'), findsOneWidget);
        expect(find.text('600,000 VND'), findsOneWidget);
        expect(find.text('-60,000 VND'), findsOneWidget);
        expect(find.text('540,000 VND'), findsOneWidget);
        expect(find.text('UNPAID'), findsOneWidget);

        // Bottom buttons: Cancel and Connect
        expect(find.text('Cancel'), findsOneWidget);
        expect(find.text('Connect'), findsOneWidget);

        // Cancel dialog test
        await tester.tap(find.text('Cancel'));
        await tester.pumpAndSettle();
        expect(find.text('Cancel Booking?'), findsOneWidget);
        expect(find.text('No, Keep'), findsOneWidget);

        await tester.tap(find.text('No, Keep'));
        await tester.pumpAndSettle();

        // Connect action test
        await tester.tap(find.text('Connect'));
        await tester.pump(const Duration(seconds: 4));
      },
    );
  });
}
