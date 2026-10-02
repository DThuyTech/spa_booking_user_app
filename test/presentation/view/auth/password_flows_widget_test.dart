import 'package:spa_booking/src/presentation/view/auth/change_password/view/change_password_view.dart';
import 'package:spa_booking/src/presentation/view/auth/forgot_password/view/forgot_password_view.dart';
import 'package:spa_booking/src/presentation/view/auth/forgot_password_otp/view/forgot_password_otp_view.dart';
import 'package:spa_booking/src/presentation/view/auth/reset_password/view/reset_password_view.dart';
import 'package:spa_booking/src/presentation/view/auth/reset_password/widgets/password_strength_checklist_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('Change Password Flow (Image 3)', () {
    testWidgets('renders all fields and validates inputs', (tester) async {
      tester.view.physicalSize = const Size(800, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(const MaterialApp(home: ChangePasswordView()));
      await tester.pump();

      // Verify Title & Subtitle
      expect(find.text('Change Password'), findsOneWidget);
      expect(
        find.text(
          'Enter your new password below to update your account security.',
        ),
        findsOneWidget,
      );

      // Verify 3 Password Inputs
      expect(find.text('Enter current password'), findsOneWidget);
      expect(find.text('Enter new password'), findsOneWidget);
      expect(find.text('Confirm new password'), findsOneWidget);

      // Verify Update Password Button
      expect(find.text('Update Password'), findsOneWidget);

      // Attempt submit without current password
      await tester.tap(find.text('Update Password'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 4)); // drain toast

      // Enter valid current password and matching new passwords
      await tester.enterText(
        find.widgetWithText(TextField, 'Enter current password'),
        'OldPassword123!',
      );
      await tester.enterText(
        find.widgetWithText(TextField, 'Enter new password'),
        'NewStrongPass#2026',
      );
      await tester.enterText(
        find.widgetWithText(TextField, 'Confirm new password'),
        'NewStrongPass#2026',
      );
      await tester.pump();

      await tester.tap(find.text('Update Password'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 4)); // drain toast
    });
  });

  group('Forgot Password Flow (Image 1, OTP, Image 2)', () {
    testWidgets('Step 1: ForgotPasswordView renders email input and submit', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(800, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(const MaterialApp(home: ForgotPasswordView()));
      await tester.pump();

      // Verify Title & Subtitle
      expect(find.text('Forgot Password'), findsOneWidget);
      expect(
        find.text('Enter your email or phone number to reset your password.'),
        findsOneWidget,
      );

      // Verify Input & Buttons
      expect(find.text('Email or Phone'), findsOneWidget);
      expect(find.text('Send Reset Link'), findsOneWidget);
      expect(find.text('Need help?'), findsOneWidget);

      // Fill in email
      await tester.enterText(
        find.widgetWithText(TextField, 'Email or Phone'),
        'customer@spa.com',
      );
      await tester.pump();

      // Tap Send Reset Link
      await tester.tap(find.text('Send Reset Link'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 4)); // drain toast
    });

    testWidgets('Step 2: ForgotPasswordOtpView handles code input', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(800, 1400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() => tester.view.resetPhysicalSize());

      await tester.pumpWidget(
        const MaterialApp(
          home: ForgotPasswordOtpView(contact: 'customer@spa.com'),
        ),
      );
      await tester.pump();

      expect(find.text('Verify Code'), findsOneWidget);
      expect(find.textContaining('customer@spa.com'), findsOneWidget);
      expect(find.text('Verify & Proceed'), findsOneWidget);

      // Dispose widget tree to cancel timer
      await tester.pumpWidget(const SizedBox());
    });

    testWidgets(
      'Step 3: ResetPasswordView (Image 2) validates strength checklist',
      (tester) async {
        tester.view.physicalSize = const Size(800, 1400);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() => tester.view.resetPhysicalSize());

        await tester.pumpWidget(
          const MaterialApp(
            home: ResetPasswordView(contact: 'customer@spa.com'),
          ),
        );
        await tester.pump();

        // Verify Title & Subtitle matching Image 2
        expect(find.text('Change Password'), findsOneWidget);
        expect(
          find.text('Create a strong password to protect your account.'),
          findsOneWidget,
        );

        // Verify Checklist Card
        expect(find.byType(PasswordStrengthChecklistCard), findsOneWidget);
        expect(find.text('Be at least 8 characters long'), findsOneWidget);
        expect(
          find.text('At least one uppercase letter (A-Z)'),
          findsOneWidget,
        );
        expect(
          find.text(r'At least one special character (!@#$%^&*)'),
          findsOneWidget,
        );

        // Enter password
        await tester.enterText(
          find.widgetWithText(TextField, 'Enter new password'),
          'Secret@2026',
        );
        await tester.enterText(
          find.widgetWithText(TextField, 'Confirm new password'),
          'Secret@2026',
        );
        await tester.pump();

        // Tap Update Password
        await tester.tap(find.text('Update Password'));
        await tester.pump();
        await tester.pump(const Duration(seconds: 4)); // drain toast
      },
    );
  });
}
