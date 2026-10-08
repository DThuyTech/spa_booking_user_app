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

  /// Personal info menu item
  ///
  /// In en, this message translates to:
  /// **'Personal Info'**
  String get personalInfo;

  /// My bookings menu item
  ///
  /// In en, this message translates to:
  /// **'My Bookings'**
  String get myBookings;

  /// Saved addresses menu item
  ///
  /// In en, this message translates to:
  /// **'Saved Addresses'**
  String get savedAddresses;

  /// Change password menu item
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// Insights and spending analytics
  ///
  /// In en, this message translates to:
  /// **'Summary & Revenue (Insights)'**
  String get insightsTitle;

  /// Favorites menu item
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// Reviews menu item
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// Settings menu item
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Coupons menu item
  ///
  /// In en, this message translates to:
  /// **'Coupons & Vouchers'**
  String get coupons;

  /// Language settings menu item
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Title of language selector modal
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// Vietnamese language option
  ///
  /// In en, this message translates to:
  /// **'Tiếng Việt'**
  String get vietnamese;

  /// English language option
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// Account menu section header
  ///
  /// In en, this message translates to:
  /// **'ACCOUNT'**
  String get accountSection;

  /// Engagement menu section header
  ///
  /// In en, this message translates to:
  /// **'ENGAGEMENT'**
  String get engagementSection;

  /// Upcoming bookings tab
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get upcomingTab;

  /// Completed bookings tab
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completedTab;

  /// Cancelled bookings tab
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelledTab;

  /// Logout confirmation dialog title
  ///
  /// In en, this message translates to:
  /// **'Log Out?'**
  String get confirmLogout;

  /// Logout confirmation prompt
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out of your account?'**
  String get logoutMessage;

  /// Cancel action
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Delete account action label
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// Delete account confirmation dialog title
  ///
  /// In en, this message translates to:
  /// **'Delete Account?'**
  String get confirmDeleteAccount;

  /// Delete account warning description
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account? This action will permanently remove your personal data and cannot be undone.'**
  String get deleteAccountMessage;

  /// Confirm permanent deletion button label
  ///
  /// In en, this message translates to:
  /// **'Delete Permanently'**
  String get deletePermanently;

  /// Message shown when account is successfully deleted
  ///
  /// In en, this message translates to:
  /// **'Your account has been deleted successfully.'**
  String get deleteAccountSuccess;

  /// Title of booking detail view
  ///
  /// In en, this message translates to:
  /// **'Booking Detail'**
  String get bookingDetailTitle;

  /// Cancel booking button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelBooking;

  /// Cancel booking dialog headline
  ///
  /// In en, this message translates to:
  /// **'Cancel Booking?'**
  String get cancelBookingConfirm;

  /// Cancel booking reason label
  ///
  /// In en, this message translates to:
  /// **'Please provide a reason for cancellation:'**
  String get cancelReasonPrompt;

  /// Cancellation reason input placeholder
  ///
  /// In en, this message translates to:
  /// **'Reason...'**
  String get cancelReasonHint;

  /// Keep booking dialog button
  ///
  /// In en, this message translates to:
  /// **'No, Keep'**
  String get keepBooking;

  /// Confirm cancel booking button
  ///
  /// In en, this message translates to:
  /// **'Yes, Cancel'**
  String get yesCancel;

  /// Connect with salon button
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connectSalon;

  /// Phone call prompt
  ///
  /// In en, this message translates to:
  /// **'Call salon via phone number'**
  String get callSalonPrompt;

  /// Error when phone cannot be launched
  ///
  /// In en, this message translates to:
  /// **'Cannot make phone call to this number'**
  String get cannotCallPhone;

  /// Message when salon phone is missing
  ///
  /// In en, this message translates to:
  /// **'Salon phone number is not available'**
  String get noPhoneNumber;

  /// Subtotal amount label
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subtotal;

  /// Discount amount label
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// Total payment amount label
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get totalAmount;

  /// User notes section label
  ///
  /// In en, this message translates to:
  /// **'USER NOTES'**
  String get userNotes;

  /// Add note action
  ///
  /// In en, this message translates to:
  /// **'Add Note'**
  String get addNote;

  /// Note input placeholder
  ///
  /// In en, this message translates to:
  /// **'Write a note...'**
  String get writeDescription;

  /// Toast when note added
  ///
  /// In en, this message translates to:
  /// **'Note added successfully'**
  String get noteAddedSuccess;

  /// Toast when note updated
  ///
  /// In en, this message translates to:
  /// **'Note updated successfully'**
  String get noteUpdatedSuccess;

  /// Toast when booking cancelled
  ///
  /// In en, this message translates to:
  /// **'Booking cancelled successfully'**
  String get bookingCancelledSuccess;

  /// Filter bookings modal title
  ///
  /// In en, this message translates to:
  /// **'Filter Bookings'**
  String get filterBookings;

  /// Status filter header
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get statusLabel;

  /// Date filter header
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get dateLabel;

  /// Apply filter button
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get applyFilter;

  /// Reset filter button
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get resetFilter;

  /// Search bookings placeholder
  ///
  /// In en, this message translates to:
  /// **'Search salons, services...'**
  String get searchBookingsPlaceholder;

  /// All filter option
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// Pending booking status
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get statusPending;

  /// Confirmed booking status
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get statusConfirmed;

  /// Completed booking status
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get statusCompleted;

  /// Cancelled booking status
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get statusCancelled;

  /// Select date placeholder
  ///
  /// In en, this message translates to:
  /// **'Select date'**
  String get selectDate;

  /// Clear date action
  ///
  /// In en, this message translates to:
  /// **'Clear date'**
  String get clearDate;

  /// Special offers section title
  ///
  /// In en, this message translates to:
  /// **'Special Offers'**
  String get specialOffers;

  /// Explore services section title
  ///
  /// In en, this message translates to:
  /// **'Explore Services'**
  String get exploreServices;

  /// Book now action button
  ///
  /// In en, this message translates to:
  /// **'Book Now'**
  String get bookNow;

  /// Directions button
  ///
  /// In en, this message translates to:
  /// **'Directions'**
  String get directions;

  /// Call now button
  ///
  /// In en, this message translates to:
  /// **'Call Now'**
  String get callNow;

  /// Book action button
  ///
  /// In en, this message translates to:
  /// **'Book'**
  String get book;

  /// Stylist label
  ///
  /// In en, this message translates to:
  /// **'Stylist'**
  String get stylist;

  /// Customer reviews header
  ///
  /// In en, this message translates to:
  /// **'Customer reviews'**
  String get customerReviews;

  /// Review singular/title
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// Empty reviews message
  ///
  /// In en, this message translates to:
  /// **'No reviews yet'**
  String get noReviewsYet;

  /// Prompt for first review
  ///
  /// In en, this message translates to:
  /// **'Be the first to share your experience!'**
  String get beTheFirstToReview;

  /// Open now status badge
  ///
  /// In en, this message translates to:
  /// **'Open now'**
  String get openNow;

  /// Empty services text
  ///
  /// In en, this message translates to:
  /// **'No services available yet'**
  String get noServicesAvailable;

  /// Button to view all services
  ///
  /// In en, this message translates to:
  /// **'View all services'**
  String get viewAllServices;

  /// Opening hours card title
  ///
  /// In en, this message translates to:
  /// **'Opening Hours'**
  String get openingHours;

  /// Available now card title
  ///
  /// In en, this message translates to:
  /// **'Available now'**
  String get availableNow;

  /// About section title
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// Location section title
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// New booking title
  ///
  /// In en, this message translates to:
  /// **'New Booking'**
  String get newBooking;

  /// Total estimate label
  ///
  /// In en, this message translates to:
  /// **'Total Est.'**
  String get totalEst;

  /// No services in category empty state
  ///
  /// In en, this message translates to:
  /// **'No services found in this category'**
  String get noServicesInCategory;

  /// Service type label
  ///
  /// In en, this message translates to:
  /// **'Service Type'**
  String get serviceType;

  /// Services uppercase section title
  ///
  /// In en, this message translates to:
  /// **'SERVICES'**
  String get servicesCaps;

  /// Today label
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// Staff label
  ///
  /// In en, this message translates to:
  /// **'Staff'**
  String get staff;

  /// Staff off schedule indicator
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get staffOff;

  /// Staff break schedule indicator
  ///
  /// In en, this message translates to:
  /// **'BREAK'**
  String get staffBreak;

  /// Sort option highest rated
  ///
  /// In en, this message translates to:
  /// **'Sort by Highest Rated'**
  String get sortByHighestRated;

  /// Sort option alphabetically
  ///
  /// In en, this message translates to:
  /// **'Sort Alphabetically (A-Z)'**
  String get sortAlphabetically;

  /// Reset sort order option
  ///
  /// In en, this message translates to:
  /// **'Reset Sort Order'**
  String get resetSortOrder;

  /// Share favorites action
  ///
  /// In en, this message translates to:
  /// **'Share Favorites List'**
  String get shareFavorites;

  /// Change avatar photo action
  ///
  /// In en, this message translates to:
  /// **'Change Photo'**
  String get changePhoto;

  /// Profile editing title
  ///
  /// In en, this message translates to:
  /// **'Profile Editing'**
  String get profileEditing;

  /// Select gender sheet title
  ///
  /// In en, this message translates to:
  /// **'Select Gender'**
  String get selectGender;

  /// Name field label
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// Date of birth label
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirth;

  /// Gender label
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// This month filter option
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get thisMonth;

  /// Last 3 months filter option
  ///
  /// In en, this message translates to:
  /// **'Last 3 Months'**
  String get last3Months;

  /// This year filter option
  ///
  /// In en, this message translates to:
  /// **'This Year'**
  String get thisYear;

  /// Favorite services section title
  ///
  /// In en, this message translates to:
  /// **'Favorite Services'**
  String get favoriteServices;

  /// Your usual visit section title
  ///
  /// In en, this message translates to:
  /// **'YOUR USUAL VISIT'**
  String get yourUsualVisit;

  /// Day label
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get day;

  /// Time label
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// Read all notifications button
  ///
  /// In en, this message translates to:
  /// **'Read all'**
  String get readAll;

  /// No notifications message
  ///
  /// In en, this message translates to:
  /// **'No notifications yet'**
  String get noNotificationsYet;

  /// Post review button
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get postReview;

  /// Write a review screen title
  ///
  /// In en, this message translates to:
  /// **'Write a Review'**
  String get writeReview;

  /// Rate specific details label
  ///
  /// In en, this message translates to:
  /// **'Rate specific details'**
  String get rateSpecificDetails;

  /// Add photos button
  ///
  /// In en, this message translates to:
  /// **'Add Photos'**
  String get addPhotos;

  /// No salons found text
  ///
  /// In en, this message translates to:
  /// **'No Salons Found'**
  String get noSalonsFound;

  /// Search screen header
  ///
  /// In en, this message translates to:
  /// **'Find Your Sanctuary'**
  String get findYourSanctuary;

  /// Top rated filter chip
  ///
  /// In en, this message translates to:
  /// **'Top Rated'**
  String get topRated;

  /// Verify code title
  ///
  /// In en, this message translates to:
  /// **'Verify Code'**
  String get verifyCode;

  /// Terms and service link text
  ///
  /// In en, this message translates to:
  /// **'Terms & Service'**
  String get termsAndService;
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
