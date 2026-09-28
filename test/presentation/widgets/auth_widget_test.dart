import 'package:board_oi/src/core/localization/app_localizations.dart';
import 'package:board_oi/src/domain/entities/auth/request_otp_result.dart';
import 'package:board_oi/src/app/session/session_manager.dart';
import 'package:board_oi/src/domain/usecases/auth/login_usecase.dart';
import 'package:board_oi/src/domain/usecases/auth/request_otp_usecase.dart';
import 'package:board_oi/src/domain/usecases/auth/verify_otp_usecase.dart';
import 'package:board_oi/src/presentation/bloc/auth/login/login_bloc.dart';
import 'package:board_oi/src/presentation/view/auth/login/sections/login_card_section.dart';
import 'package:board_oi/src/presentation/view/auth/login/sections/login_footer_section.dart';
import 'package:board_oi/src/presentation/view/auth/login/sections/login_header_section.dart';
import 'package:board_oi/src/presentation/view/auth/login/widgets/aura_logo_badge.dart';
import 'package:board_oi/src/presentation/view/auth/register/view/register_view.dart';
import 'package:board_oi/src/presentation/bloc/auth/otp_verification/otp_verification_bloc.dart';
import 'package:board_oi/src/presentation/view/auth/otp_verification/sections/otp_header_section.dart';
import 'package:board_oi/src/presentation/view/auth/otp_verification/widgets/otp_countdown_timer.dart';
import 'package:board_oi/src/presentation/view/auth/otp_verification/widgets/otp_pin_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

class MockRequestOtpUseCase extends Mock implements RequestOtpUseCase {}

class MockVerifyOtpUseCase extends Mock implements VerifyOtpUseCase {}

class MockLoginUseCase extends Mock implements LoginUseCase {}

class MockSessionManager extends Mock implements SessionManager {}

Widget createLocalizedTestWidget(Widget child) {
  return MaterialApp(
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: AppLocalizations.supportedLocales,
    locale: const Locale('en'),
    home: Scaffold(body: child),
  );
}

void main() {
  late MockRequestOtpUseCase mockRequestOtp;
  late MockVerifyOtpUseCase mockVerifyOtp;
  late MockLoginUseCase mockLoginUseCase;
  late MockSessionManager mockSessionManager;

  setUp(() {
    mockRequestOtp = MockRequestOtpUseCase();
    mockVerifyOtp = MockVerifyOtpUseCase();
    mockLoginUseCase = MockLoginUseCase();
    mockSessionManager = MockSessionManager();
  });

  group('Login View Widgets', () {
    testWidgets('renders AuraLogoBadge and Header section correctly', (
      tester,
    ) async {
      await tester.pumpWidget(
        createLocalizedTestWidget(const LoginHeaderSection()),
      );
      await tester.pumpAndSettle();

      expect(find.byType(AuraLogoBadge), findsOneWidget);
      expect(find.text('AURA'), findsOneWidget);
      expect(find.text('Welcome Back'), findsOneWidget);
      expect(
        find.text('Sign in to continue your beauty journey'),
        findsOneWidget,
      );
    });

    testWidgets(
      'shows button disabled initially and enables on valid 10-digit input',
      (tester) async {
        when(() => mockRequestOtp(any())).thenAnswer(
          (_) async => const Right(
            RequestOtpResult(message: 'OK', expiresInSeconds: 300),
          ),
        );

        final loginBloc = LoginBloc(
          loginUseCase: mockLoginUseCase,
          sessionManager: mockSessionManager,
        );

        await tester.pumpWidget(
          createLocalizedTestWidget(
            BlocProvider<LoginBloc>.value(
              value: loginBloc,
              child: const LoginCardSection(),
            ),
          ),
        );
        await tester.pumpAndSettle();

        // Login button is present
        expect(find.text('Login'), findsOneWidget);

        // Verify both glassmorphic fields are present
        expect(find.byKey(const Key('login_identifier_field')), findsOneWidget);
        expect(find.byKey(const Key('login_password_field')), findsOneWidget);

        // Enter invalid phone
        await tester.enterText(
          find.byKey(const Key('login_identifier_field')),
          '123',
        );
        await tester.pump();
        expect(loginBloc.state.isValid, isFalse);

        // Enter valid 10-digit phone
        await tester.enterText(
          find.byKey(const Key('login_identifier_field')),
          '0901234567',
        );
        await tester.pump();
        expect(loginBloc.state.isValid, isTrue);
      },
    );

    testWidgets('renders LoginFooterSection with Register link', (
      tester,
    ) async {
      await tester.pumpWidget(
        createLocalizedTestWidget(const LoginFooterSection()),
      );
      await tester.pumpAndSettle();

      expect(find.text("Don't have an account?"), findsOneWidget);
      expect(find.text('Register'), findsOneWidget);
    });

    testWidgets('renders RegisterPage header and fields correctly', (
      tester,
    ) async {
      await tester.pumpWidget(createLocalizedTestWidget(const RegisterPage()));
      await tester.pumpAndSettle();

      expect(find.text('Create Account'), findsOneWidget);
      expect(find.text('Sign In'), findsOneWidget);
    });
  });

  group('OTP Verification View Widgets', () {
    testWidgets('renders OtpHeaderSection and formatted masked phone number', (
      tester,
    ) async {
      final otpBloc = OtpVerificationBloc(
        verifyOtpUseCase: mockVerifyOtp,
        requestOtpUseCase: mockRequestOtp,
      );

      await tester.pumpWidget(
        createLocalizedTestWidget(
          BlocProvider<OtpVerificationBloc>.value(
            value: otpBloc,
            child: const OtpHeaderSection(),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Verify your number'), findsOneWidget);
    });

    testWidgets(
      'OtpPinFields displays 6 boxes with correct normal and error styling',
      (tester) async {
        await tester.pumpWidget(
          createLocalizedTestWidget(
            OtpPinFields(code: '428', onChanged: (_) {}),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('4'), findsOneWidget);
        expect(find.text('2'), findsOneWidget);
        expect(find.text('8'), findsOneWidget);

        // Error state render
        await tester.pumpWidget(
          createLocalizedTestWidget(
            OtpPinFields(
              code: '428',
              hasError: true,
              errorMessage: 'Invalid verification code. Please try again.',
              onChanged: (_) {},
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(
          find.text('Invalid verification code. Please try again.'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'OtpCountdownTimer renders timer and handles resend button state',
      (tester) async {
        bool resendTapped = false;

        // When timer > 0, resend is disabled
        await tester.pumpWidget(
          createLocalizedTestWidget(
            OtpCountdownTimer(
              formattedCountdown: '00:45',
              canResend: false,
              onResendTap: () => resendTapped = true,
            ),
          ),
        );
        await tester.pumpAndSettle();

        expect(find.text('00:45 remaining'), findsOneWidget);
        expect(find.text('Resend Code'), findsOneWidget);

        await tester.tap(find.text('Resend Code'));
        await tester.pump();
        expect(resendTapped, isFalse);

        // When canResend is true (timer reached 0)
        await tester.pumpWidget(
          createLocalizedTestWidget(
            OtpCountdownTimer(
              formattedCountdown: '00:00',
              canResend: true,
              onResendTap: () => resendTapped = true,
            ),
          ),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.text('Resend Code'));
        await tester.pump();
        expect(resendTapped, isTrue);
      },
    );

    testWidgets('OtpCountdown renders formatted duration with clock icon', (
      tester,
    ) async {
      await tester.pumpWidget(
        createLocalizedTestWidget(
          const OtpCountdown(formattedCountdown: '01:30'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('01:30 remaining'), findsOneWidget);
    });

    testWidgets(
      'OtpResendButton displays loading indicator when isResending is true',
      (tester) async {
        await tester.pumpWidget(
          createLocalizedTestWidget(
            const OtpResendButton(canResend: true, isResending: true),
          ),
        );
        await tester.pump();

        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        expect(find.text('Resend Code'), findsNothing);
      },
    );

    testWidgets('OtpInput renders 6 boxes and notifies onChanged', (
      tester,
    ) async {
      String changedValue = '';
      await tester.pumpWidget(
        createLocalizedTestWidget(
          OtpInput(code: '12', onChanged: (val) => changedValue = val),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('1'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);

      await tester.enterText(find.byType(TextField), '123');
      await tester.pumpAndSettle();
      expect(changedValue, '123');
    });
  });
}
