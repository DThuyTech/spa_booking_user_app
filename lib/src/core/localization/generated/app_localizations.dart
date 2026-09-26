import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Spa Booking'**
  String get appTitle;

  /// Home screen title
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeTitle;

  /// Login screen title
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get loginTitle;

  /// Welcome back header text
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// Subtitle below welcome back
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue your beauty journey'**
  String get signInSubtitle;

  /// Phone number label
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phone;

  /// Enter phone number placeholder
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enterPhone;

  /// Continue action button
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// Login action button
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButton;

  /// Enter email or phone placeholder
  ///
  /// In en, this message translates to:
  /// **'Enter your email or phone number'**
  String get enterEmailOrPhone;

  /// Enter password placeholder
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterPassword;

  /// Forgot password link text
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// Validation error for invalid phone
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid 10-digit phone number'**
  String get invalidPhone;

  /// Send OTP button
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendOtp;

  /// OTP label
  ///
  /// In en, this message translates to:
  /// **'OTP'**
  String get otp;

  /// Enter OTP placeholder
  ///
  /// In en, this message translates to:
  /// **'Enter verification code'**
  String get enterOtp;

  /// Verify number headline
  ///
  /// In en, this message translates to:
  /// **'Verify your number'**
  String get verifyYourNumber;

  /// Subtitle indicating code sent
  ///
  /// In en, this message translates to:
  /// **'We sent a verification code to'**
  String get weSentCodeTo;

  /// Remaining countdown label
  ///
  /// In en, this message translates to:
  /// **'remaining'**
  String get remaining;

  /// Resend code button
  ///
  /// In en, this message translates to:
  /// **'Resend Code'**
  String get resendOtp;

  /// Question before resend link
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the code?'**
  String get didNotReceiveCode;

  /// Error message for invalid OTP
  ///
  /// In en, this message translates to:
  /// **'Invalid verification code. Please try again.'**
  String get invalidOtp;

  /// Error message for expired OTP
  ///
  /// In en, this message translates to:
  /// **'Verification code has expired. Please request a new one.'**
  String get expiredOtp;

  /// Verify action button
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// Change phone number button
  ///
  /// In en, this message translates to:
  /// **'Change phone number'**
  String get changePhoneNumber;

  /// Login failed error message
  ///
  /// In en, this message translates to:
  /// **'Login failed. Please try again.'**
  String get loginFailed;

  /// Network failure message
  ///
  /// In en, this message translates to:
  /// **'Network connection error. Please check your internet.'**
  String get networkError;

  /// Session expired message
  ///
  /// In en, this message translates to:
  /// **'Session has expired. Please log in again.'**
  String get sessionExpired;

  /// Terms and conditions notice at login footer
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to our Terms & Conditions and Privacy Policy'**
  String get termsNotice;

  /// Divider text
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get orDivider;

  /// Registration prompt
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// Register action link
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// Create Account header
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// Subtitle below create account header
  ///
  /// In en, this message translates to:
  /// **'Sign up to begin your beauty journey'**
  String get registerSubtitle;

  /// Full name label
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullName;

  /// Full name placeholder
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get enterFullName;

  /// Sign in prompt
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// Sign in action link
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// Refresh button label
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// Logout button label
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Generic error message
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get errorOccurred;

  /// Retry button label
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Accessible label for OTP input
  ///
  /// In en, this message translates to:
  /// **'Enter verification code'**
  String get otpInput;

  /// General verification failed error
  ///
  /// In en, this message translates to:
  /// **'Verification failed. Please try again.'**
  String get verificationFailed;

  /// General resend failed error
  ///
  /// In en, this message translates to:
  /// **'Failed to resend code. Please try again.'**
  String get resendFailed;

  /// Try again label
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// Back button accessibility label
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// Placeholder for salon search bar
  ///
  /// In en, this message translates to:
  /// **'Search salons, services, stylists...'**
  String get searchSalonsPlaceholder;

  /// Upcoming appointment section header
  ///
  /// In en, this message translates to:
  /// **'Upcoming Appointment'**
  String get upcomingAppointment;

  /// Empty state title when no appointment
  ///
  /// In en, this message translates to:
  /// **'No upcoming appointments'**
  String get noUpcomingAppointments;

  /// Action button to book an appointment
  ///
  /// In en, this message translates to:
  /// **'Book an Appointment'**
  String get bookAppointment;

  /// Subtitle below empty appointments
  ///
  /// In en, this message translates to:
  /// **'Discover top-rated beauty salons near you'**
  String get bookAppointmentSubtitle;

  /// Services section header
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// See all action link
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get seeAll;

  /// Recommended salons section header
  ///
  /// In en, this message translates to:
  /// **'Recommended Salons'**
  String get recommendedSalons;

  /// Nearby salons section header
  ///
  /// In en, this message translates to:
  /// **'Nearby Salons'**
  String get nearbySalons;

  /// Notifications button accessibility label
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// Good morning greeting prefix
  ///
  /// In en, this message translates to:
  /// **'Good morning,'**
  String get goodMorning;

  /// Good afternoon greeting prefix
  ///
  /// In en, this message translates to:
  /// **'Good afternoon,'**
  String get goodAfternoon;

  /// Good evening greeting prefix
  ///
  /// In en, this message translates to:
  /// **'Good evening,'**
  String get goodEvening;

  /// Haircut service category
  ///
  /// In en, this message translates to:
  /// **'Haircut'**
  String get categoryHaircut;

  /// Spa service category
  ///
  /// In en, this message translates to:
  /// **'Spa & Massage'**
  String get categorySpa;

  /// Nails service category
  ///
  /// In en, this message translates to:
  /// **'Nails'**
  String get categoryNails;

  /// Facial service category
  ///
  /// In en, this message translates to:
  /// **'Facial Care'**
  String get categoryFacial;

  /// Coloring service category
  ///
  /// In en, this message translates to:
  /// **'Coloring'**
  String get categoryColoring;

  /// Placeholder title for store discovery
  ///
  /// In en, this message translates to:
  /// **'Salon discovery coming soon'**
  String get salonDiscoveryComingSoon;

  /// Placeholder subtitle for store discovery
  ///
  /// In en, this message translates to:
  /// **'We are curating top luxury beauty salons for you'**
  String get salonDiscoverySubtitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
