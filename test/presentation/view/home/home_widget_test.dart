import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/core/localization/app_localizations.dart';
import 'package:spa_booking/src/domain/entities/auth/user.dart';
import 'package:spa_booking/src/domain/entities/auth/user_role_enum.dart';
import 'package:spa_booking/src/domain/entities/home/greeting.dart';
import 'package:spa_booking/src/domain/usecases/home/get_greeting_usecase.dart';
import 'package:spa_booking/src/presentation/bloc/auth_session/auth_session_bloc.dart';
import 'package:spa_booking/src/presentation/bloc/home/home_bloc.dart';
import 'package:spa_booking/src/presentation/bloc/home/home_state.dart';
import 'package:spa_booking/src/presentation/view/home/body_view/home_body_view.dart';
import 'package:spa_booking/src/presentation/view/home/widgets/home_booking_card.dart';
import 'package:spa_booking/src/presentation/view/home/widgets/home_category_item.dart';
import 'package:spa_booking/src/presentation/view/home/widgets/home_greeting.dart';
import 'package:spa_booking/src/presentation/view/home/widgets/home_near_salon_card.dart';
import 'package:spa_booking/src/presentation/view/home/widgets/home_search_bar.dart';
import 'package:spa_booking/src/presentation/view/home/widgets/home_skeleton.dart';
import 'package:spa_booking/src/presentation/view/home/widgets/home_store_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockGetGreetingUseCase extends Mock implements GetGreetingUseCase {}

class MockAuthSessionBloc extends Mock implements AuthSessionBloc {}

Widget createHomeTestWidget({
  required Widget child,
  AuthSessionBloc? authSessionBloc,
}) {
  return MaterialApp(
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: AppLocalizations.supportedLocales,
    locale: const Locale('en'),
    home: authSessionBloc != null
        ? BlocProvider<AuthSessionBloc>.value(
            value: authSessionBloc,
            child: Scaffold(body: child),
          )
        : Scaffold(body: child),
  );
}

void main() {
  group('Home Dashboard Widgets (END-USER-04)', () {
    late MockGetGreetingUseCase mockGetGreeting;
    late MockAuthSessionBloc mockAuthSessionBloc;

    const testUser = User(
      id: 'cust-1',
      fullName: 'Emma Watson',
      phone: '0901234567',
      role: UserRoleEnum.customer,
    );

    final testGreeting = Greeting(
      id: 'g-1',
      title: 'Good day',
      message: 'Luxury spa & salon care awaits',
      timestamp: DateTime(2026, 9, 26),
    );

    setUp(() {
      mockGetGreeting = MockGetGreetingUseCase();
      mockAuthSessionBloc = MockAuthSessionBloc();

      when(
        () => mockAuthSessionBloc.state,
      ).thenReturn(const AuthSessionState.authenticated(testUser));
      when(() => mockAuthSessionBloc.stream).thenAnswer(
        (_) => Stream.value(const AuthSessionState.authenticated(testUser)),
      );
    });

    testWidgets('HomeGreeting displays customer name and tagline', (
      tester,
    ) async {
      await tester.pumpWidget(
        createHomeTestWidget(
          child: const HomeGreeting(
            user: testUser,
            subtitle: 'Book your relaxing moment today',
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('Watson'), findsOneWidget);
      expect(find.text('Book your relaxing moment today'), findsOneWidget);
    });

    testWidgets('HomeSearchBar renders with placeholder and responds to tap', (
      tester,
    ) async {
      bool tapped = false;
      await tester.pumpWidget(
        createHomeTestWidget(child: HomeSearchBar(onTap: () => tapped = true)),
      );
      await tester.pumpAndSettle();

      expect(find.text('Search salons, services, stylists...'), findsOneWidget);
      expect(find.byIcon(LucideIcons.search), findsOneWidget);

      await tester.tap(find.byType(HomeSearchBar));
      await tester.pump();
      expect(tapped, isTrue);
    });

    testWidgets('HomeBookingCard renders empty state with booking prompt', (
      tester,
    ) async {
      bool bookTapped = false;
      await tester.pumpWidget(
        createHomeTestWidget(
          child: HomeBookingCard(onBookNowTap: () => bookTapped = true),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('No upcoming appointments'), findsOneWidget);
      expect(
        find.text('Discover top-rated beauty salons near you'),
        findsOneWidget,
      );

      await tester.tap(find.byIcon(LucideIcons.chevron_right));
      await tester.pump();
      expect(bookTapped, isTrue);
    });

    testWidgets('HomeBookingCard renders active booking when provided', (
      tester,
    ) async {
      await tester.pumpWidget(
        createHomeTestWidget(
          child: const HomeBookingCard(
            storeName: 'Aura Luxe Beauty',
            serviceName: 'Hair Styling & Keratin',
            formattedDateTime: 'Today, 2:30 PM',
            statusLabel: 'Confirmed',
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Aura Luxe Beauty'), findsOneWidget);
      expect(find.text('Hair Styling & Keratin'), findsOneWidget);
      expect(find.text('Today, 2:30 PM'), findsOneWidget);
      expect(find.text('Confirmed'), findsOneWidget);
    });

    testWidgets('HomeCategoryItem renders icon and label', (tester) async {
      bool selected = false;
      await tester.pumpWidget(
        createHomeTestWidget(
          child: HomeCategoryItem(
            label: 'Haircut',
            icon: LucideIcons.scissors,
            onTap: () => selected = true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Haircut'), findsOneWidget);
      expect(find.byIcon(LucideIcons.scissors), findsOneWidget);

      await tester.tap(find.byType(HomeCategoryItem));
      await tester.pump();
      expect(selected, isTrue);
    });

    testWidgets('HomeStoreCard renders contract-first discovery placeholder', (
      tester,
    ) async {
      await tester.pumpWidget(
        createHomeTestWidget(child: const HomeStoreCard()),
      );
      await tester.pumpAndSettle();

      expect(find.text('Salon discovery coming soon'), findsOneWidget);
      expect(
        find.text('We are curating top luxury beauty salons for you'),
        findsOneWidget,
      );
    });

    testWidgets('HomeBodyView renders HomeSkeleton when loading', (
      tester,
    ) async {
      when(
        () => mockGetGreeting(),
      ).thenAnswer((_) async => Right(testGreeting));

      final homeBloc = HomeBloc(getGreetingUseCase: mockGetGreeting);

      await tester.pumpWidget(
        createHomeTestWidget(
          authSessionBloc: mockAuthSessionBloc,
          child: BlocProvider<HomeBloc>.value(
            value: homeBloc,
            child: const HomeBodyView(),
          ),
        ),
      );

      // Initially loading
      homeBloc.emit(const HomeState(status: HomeStatus.loading));
      await tester.pump();

      expect(find.byType(HomeSkeleton), findsOneWidget);
    });

    testWidgets(
      'HomeBodyView renders error message and triggers retry on error',
      (tester) async {
        when(() => mockGetGreeting()).thenAnswer(
          (_) async => const Left(ServerFailure('Connection error')),
        );

        final homeBloc = HomeBloc(getGreetingUseCase: mockGetGreeting);

        await tester.pumpWidget(
          createHomeTestWidget(
            authSessionBloc: mockAuthSessionBloc,
            child: BlocProvider<HomeBloc>.value(
              value: homeBloc,
              child: const HomeBodyView(),
            ),
          ),
        );

        homeBloc.emit(
          const HomeState(
            status: HomeStatus.failure,
            errorMessage: 'Connection error',
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('Connection error'), findsOneWidget);
        expect(find.text('Retry'), findsOneWidget);

        await tester.tap(find.text('Retry'));
        await tester.pump();
      },
    );

    testWidgets(
      'HomeBodyView renders loaded sections with customer header and categories',
      (tester) async {
        when(
          () => mockGetGreeting(),
        ).thenAnswer((_) async => Right(testGreeting));

        final homeBloc = HomeBloc(getGreetingUseCase: mockGetGreeting);

        await tester.pumpWidget(
          createHomeTestWidget(
            authSessionBloc: mockAuthSessionBloc,
            child: BlocProvider<HomeBloc>.value(
              value: homeBloc,
              child: const HomeBodyView(),
            ),
          ),
        );

        homeBloc.emit(
          HomeState(status: HomeStatus.loaded, greeting: testGreeting),
        );
        await tester.pumpAndSettle();

        // Check header
        expect(find.text('Good morning'), findsOneWidget);

        // Check sections
        expect(find.text('Special Offers'), findsOneWidget);
        expect(find.text('Explore Services'), findsOneWidget);
      },
    );

    testWidgets(
      'HomeNearSalonCard renders with long location text without overflow',
      (tester) async {
        const nearItem = HomeNearSalonItem(
          id: 'salon-1',
          name: 'Aura Luxury Spa & Clinic',
          categories: 'Massage · Facial · Hair Care · Nail Design',
          rating: 4.9,
          distance:
              '123 Nguyen Hue Boulevard, Ben Nghe Ward, District 1, Ho Chi Minh City, Vietnam',
          imageUrl:
              'https://images.unsplash.com/photo-1527799820374-dcf8d9d4a388?auto=format&fit=crop&w=600&q=80',
        );

        bool bookTapped = false;
        await tester.pumpWidget(
          createHomeTestWidget(
            child: Center(
              child: HomeNearSalonCard(
                salon: nearItem,
                onBook: () => bookTapped = true,
              ),
            ),
          ),
        );
        await tester.pump();

        expect(find.text('Aura Luxury Spa & Clinic'), findsOneWidget);
        expect(find.text('Book'), findsOneWidget);

        await tester.tap(find.text('Book'));
        await tester.pump();
        expect(bookTapped, isTrue);
      },
    );
  });
}
