import 'package:board_oi/src/core/localization/app_localizations.dart';
import 'package:board_oi/src/presentation/bloc/auth/register/register_bloc.dart';
import 'package:board_oi/src/presentation/view/auth/register/view/register_view.dart';
import 'package:board_oi/src/presentation/view/terms/view/terms_of_use_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRegisterBloc extends Mock implements RegisterBloc {}

Widget createTestApp(Widget child, RegisterBloc bloc) {
  return MaterialApp(
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: AppLocalizations.supportedLocales,
    locale: const Locale('en'),
    home: Scaffold(
      body: BlocProvider<RegisterBloc>.value(value: bloc, child: child),
    ),
  );
}

void main() {
  late MockRegisterBloc mockRegisterBloc;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    mockRegisterBloc = MockRegisterBloc();
    when(() => mockRegisterBloc.state).thenReturn(const RegisterState());
    when(
      () => mockRegisterBloc.stream,
    ).thenAnswer((_) => const Stream<RegisterState>.empty());
  });

  group('RegisterView Terms Checkbox & Navigation Tests', () {
    testWidgets('renders terms checkbox and navigates to TermsOfUseView', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(800, 1600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        createTestApp(const RegisterView(), mockRegisterBloc),
      );
      await tester.pumpAndSettle();

      // Checkbox should exist
      expect(find.byType(Checkbox), findsOneWidget);
      expect(find.textContaining('I agree to the'), findsOneWidget);
      expect(find.text('Terms & Service'), findsOneWidget);

      // Tap on Terms & Service link
      await tester.tap(find.text('Terms & Service'));
      await tester.pumpAndSettle();

      // Navigated to TermsOfUseView
      expect(find.byType(TermsOfUseView), findsOneWidget);
      expect(find.text('Terms of Use'), findsOneWidget);

      // Tap Accept & Continue
      await tester.tap(find.text('Accept & Continue'));
      await tester.pumpAndSettle();

      // Returned back to RegisterView with checkbox checked
      final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
      expect(checkbox.value, isTrue);
    });

    testWidgets(
      'shows error toast when registering without agreeing to terms',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1600);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          createTestApp(const RegisterView(), mockRegisterBloc),
        );
        await tester.pumpAndSettle();

        // Ensure checkbox is unchecked
        final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
        expect(checkbox.value, isFalse);

        // Tap Register button
        await tester.tap(find.text('Register'));
        await tester.pump();

        // Should not have submitted to bloc
        verifyNever(() => mockRegisterBloc.add(const RegisterSubmitted()));
        await tester.pump(const Duration(seconds: 4));
      },
    );
  });
}
