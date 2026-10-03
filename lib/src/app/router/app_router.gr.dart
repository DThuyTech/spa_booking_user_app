// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:auto_route/auto_route.dart' as _i25;
import 'package:collection/collection.dart' as _i28;
import 'package:flutter/material.dart' as _i26;
import 'package:spa_booking/src/domain/entities/auth/user.dart' as _i30;
import 'package:spa_booking/src/presentation/view/auth/change_password/view/change_password_view.dart'
    as _i5;
import 'package:spa_booking/src/presentation/view/auth/forgot_password/view/forgot_password_view.dart'
    as _i8;
import 'package:spa_booking/src/presentation/view/auth/forgot_password_otp/view/forgot_password_otp_view.dart'
    as _i7;
import 'package:spa_booking/src/presentation/view/auth/login/view/login_view.dart'
    as _i10;
import 'package:spa_booking/src/presentation/view/auth/otp_verification/view/otp_verification_view.dart'
    as _i14;
import 'package:spa_booking/src/presentation/view/auth/register/view/register_view.dart'
    as _i17;
import 'package:spa_booking/src/presentation/view/auth/reset_password/view/reset_password_view.dart'
    as _i18;
import 'package:spa_booking/src/presentation/view/booking_flow/booking_detail/view/booking_detail_view.dart'
    as _i1;
import 'package:spa_booking/src/presentation/view/booking_flow/booking_result/view/booking_result_view.dart'
    as _i3;
import 'package:spa_booking/src/presentation/view/booking_flow/booking_schedule/view/booking_schedule_view.dart'
    as _i4;
import 'package:spa_booking/src/presentation/view/booking_flow/models/booking_models.dart'
    as _i27;
import 'package:spa_booking/src/presentation/view/booking_flow/select_services/view/select_services_view.dart'
    as _i20;
import 'package:spa_booking/src/presentation/view/favorite_stores/view/favorite_stores_view.dart'
    as _i6;
import 'package:spa_booking/src/presentation/view/home/view/home_view.dart'
    as _i9;
import 'package:spa_booking/src/presentation/view/insights/view/my_insights_view.dart'
    as _i11;
import 'package:spa_booking/src/presentation/view/notification/models/notification_models.dart'
    as _i29;
import 'package:spa_booking/src/presentation/view/notification/notification_dashboard/view/notification_dashboard_view.dart'
    as _i12;
import 'package:spa_booking/src/presentation/view/notification/notification_detail_booking/view/booking_notification_view.dart'
    as _i2;
import 'package:spa_booking/src/presentation/view/notification/notification_detail_voucher/view/voucher_detail_view.dart'
    as _i23;
import 'package:spa_booking/src/presentation/view/onboarding/onboarding_page.dart'
    as _i13;
import 'package:spa_booking/src/presentation/view/profile/edit/view/profile_edit_view.dart'
    as _i15;
import 'package:spa_booking/src/presentation/view/profile/view/profile_view.dart'
    as _i16;
import 'package:spa_booking/src/presentation/view/root/root_page.dart' as _i19;
import 'package:spa_booking/src/presentation/view/splash/splash_page.dart'
    as _i21;
import 'package:spa_booking/src/presentation/view/store_detail/mockup_data/store_detail_mock_data.dart'
    as _i31;
import 'package:spa_booking/src/presentation/view/store_detail/view/store_detail_view.dart'
    as _i22;
import 'package:spa_booking/src/presentation/view/write_review/view/write_review_view.dart'
    as _i24;

/// generated route for
/// [_i1.BookingDetailPage]
class BookingDetailRoute extends _i25.PageRouteInfo<BookingDetailRouteArgs> {
  BookingDetailRoute({
    _i26.Key? key,
    String? storeId,
    String salonName = 'Aurus Salon',
    String selectedDate = 'Aug 26, 2026',
    String selectedTime = '10:00 AM – 12:15 PM',
    List<_i27.BookingServiceItem>? selectedServices,
    String? selectedStaffId,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         BookingDetailRoute.name,
         args: BookingDetailRouteArgs(
           key: key,
           storeId: storeId,
           salonName: salonName,
           selectedDate: selectedDate,
           selectedTime: selectedTime,
           selectedServices: selectedServices,
           selectedStaffId: selectedStaffId,
         ),
         initialChildren: children,
       );

  static const String name = 'BookingDetailRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BookingDetailRouteArgs>(
        orElse: () => const BookingDetailRouteArgs(),
      );
      return _i1.BookingDetailPage(
        key: args.key,
        storeId: args.storeId,
        salonName: args.salonName,
        selectedDate: args.selectedDate,
        selectedTime: args.selectedTime,
        selectedServices: args.selectedServices,
        selectedStaffId: args.selectedStaffId,
      );
    },
  );
}

class BookingDetailRouteArgs {
  const BookingDetailRouteArgs({
    this.key,
    this.storeId,
    this.salonName = 'Aurus Salon',
    this.selectedDate = 'Aug 26, 2026',
    this.selectedTime = '10:00 AM – 12:15 PM',
    this.selectedServices,
    this.selectedStaffId,
  });

  final _i26.Key? key;

  final String? storeId;

  final String salonName;

  final String selectedDate;

  final String selectedTime;

  final List<_i27.BookingServiceItem>? selectedServices;

  final String? selectedStaffId;

  @override
  String toString() {
    return 'BookingDetailRouteArgs{key: $key, storeId: $storeId, salonName: $salonName, selectedDate: $selectedDate, selectedTime: $selectedTime, selectedServices: $selectedServices, selectedStaffId: $selectedStaffId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BookingDetailRouteArgs) return false;
    return key == other.key &&
        storeId == other.storeId &&
        salonName == other.salonName &&
        selectedDate == other.selectedDate &&
        selectedTime == other.selectedTime &&
        const _i28.ListEquality<_i27.BookingServiceItem>().equals(
          selectedServices,
          other.selectedServices,
        ) &&
        selectedStaffId == other.selectedStaffId;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      storeId.hashCode ^
      salonName.hashCode ^
      selectedDate.hashCode ^
      selectedTime.hashCode ^
      const _i28.ListEquality<_i27.BookingServiceItem>().hash(
        selectedServices,
      ) ^
      selectedStaffId.hashCode;
}

/// generated route for
/// [_i2.BookingNotificationPage]
class BookingNotificationRoute
    extends _i25.PageRouteInfo<BookingNotificationRouteArgs> {
  BookingNotificationRoute({
    _i26.Key? key,
    _i29.BookingNotificationData? booking,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         BookingNotificationRoute.name,
         args: BookingNotificationRouteArgs(key: key, booking: booking),
         initialChildren: children,
       );

  static const String name = 'BookingNotificationRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BookingNotificationRouteArgs>(
        orElse: () => const BookingNotificationRouteArgs(),
      );
      return _i2.BookingNotificationPage(key: args.key, booking: args.booking);
    },
  );
}

class BookingNotificationRouteArgs {
  const BookingNotificationRouteArgs({this.key, this.booking});

  final _i26.Key? key;

  final _i29.BookingNotificationData? booking;

  @override
  String toString() {
    return 'BookingNotificationRouteArgs{key: $key, booking: $booking}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BookingNotificationRouteArgs) return false;
    return key == other.key && booking == other.booking;
  }

  @override
  int get hashCode => key.hashCode ^ booking.hashCode;
}

/// generated route for
/// [_i3.BookingResultPage]
class BookingResultRoute extends _i25.PageRouteInfo<BookingResultRouteArgs> {
  BookingResultRoute({
    _i26.Key? key,
    bool isSuccess = true,
    String? bookingCode,
    String? salonName,
    String? dateDisplay,
    String? timeDisplay,
    int? totalAmount,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         BookingResultRoute.name,
         args: BookingResultRouteArgs(
           key: key,
           isSuccess: isSuccess,
           bookingCode: bookingCode,
           salonName: salonName,
           dateDisplay: dateDisplay,
           timeDisplay: timeDisplay,
           totalAmount: totalAmount,
         ),
         initialChildren: children,
       );

  static const String name = 'BookingResultRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BookingResultRouteArgs>(
        orElse: () => const BookingResultRouteArgs(),
      );
      return _i3.BookingResultPage(
        key: args.key,
        isSuccess: args.isSuccess,
        bookingCode: args.bookingCode,
        salonName: args.salonName,
        dateDisplay: args.dateDisplay,
        timeDisplay: args.timeDisplay,
        totalAmount: args.totalAmount,
      );
    },
  );
}

class BookingResultRouteArgs {
  const BookingResultRouteArgs({
    this.key,
    this.isSuccess = true,
    this.bookingCode,
    this.salonName,
    this.dateDisplay,
    this.timeDisplay,
    this.totalAmount,
  });

  final _i26.Key? key;

  final bool isSuccess;

  final String? bookingCode;

  final String? salonName;

  final String? dateDisplay;

  final String? timeDisplay;

  final int? totalAmount;

  @override
  String toString() {
    return 'BookingResultRouteArgs{key: $key, isSuccess: $isSuccess, bookingCode: $bookingCode, salonName: $salonName, dateDisplay: $dateDisplay, timeDisplay: $timeDisplay, totalAmount: $totalAmount}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BookingResultRouteArgs) return false;
    return key == other.key &&
        isSuccess == other.isSuccess &&
        bookingCode == other.bookingCode &&
        salonName == other.salonName &&
        dateDisplay == other.dateDisplay &&
        timeDisplay == other.timeDisplay &&
        totalAmount == other.totalAmount;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      isSuccess.hashCode ^
      bookingCode.hashCode ^
      salonName.hashCode ^
      dateDisplay.hashCode ^
      timeDisplay.hashCode ^
      totalAmount.hashCode;
}

/// generated route for
/// [_i4.BookingSchedulePage]
class BookingScheduleRoute
    extends _i25.PageRouteInfo<BookingScheduleRouteArgs> {
  BookingScheduleRoute({
    _i26.Key? key,
    String? storeId,
    String salonName = 'LUXE SALON',
    List<_i27.BookingServiceItem>? selectedServices,
    String? selectedStaffId,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         BookingScheduleRoute.name,
         args: BookingScheduleRouteArgs(
           key: key,
           storeId: storeId,
           salonName: salonName,
           selectedServices: selectedServices,
           selectedStaffId: selectedStaffId,
         ),
         initialChildren: children,
       );

  static const String name = 'BookingScheduleRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BookingScheduleRouteArgs>(
        orElse: () => const BookingScheduleRouteArgs(),
      );
      return _i4.BookingSchedulePage(
        key: args.key,
        storeId: args.storeId,
        salonName: args.salonName,
        selectedServices: args.selectedServices,
        selectedStaffId: args.selectedStaffId,
      );
    },
  );
}

class BookingScheduleRouteArgs {
  const BookingScheduleRouteArgs({
    this.key,
    this.storeId,
    this.salonName = 'LUXE SALON',
    this.selectedServices,
    this.selectedStaffId,
  });

  final _i26.Key? key;

  final String? storeId;

  final String salonName;

  final List<_i27.BookingServiceItem>? selectedServices;

  final String? selectedStaffId;

  @override
  String toString() {
    return 'BookingScheduleRouteArgs{key: $key, storeId: $storeId, salonName: $salonName, selectedServices: $selectedServices, selectedStaffId: $selectedStaffId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BookingScheduleRouteArgs) return false;
    return key == other.key &&
        storeId == other.storeId &&
        salonName == other.salonName &&
        const _i28.ListEquality<_i27.BookingServiceItem>().equals(
          selectedServices,
          other.selectedServices,
        ) &&
        selectedStaffId == other.selectedStaffId;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      storeId.hashCode ^
      salonName.hashCode ^
      const _i28.ListEquality<_i27.BookingServiceItem>().hash(
        selectedServices,
      ) ^
      selectedStaffId.hashCode;
}

/// generated route for
/// [_i5.ChangePasswordPage]
class ChangePasswordRoute extends _i25.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i25.PageRouteInfo>? children})
    : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i5.ChangePasswordPage();
    },
  );
}

/// generated route for
/// [_i6.FavoriteStoresPage]
class FavoriteStoresRoute extends _i25.PageRouteInfo<void> {
  const FavoriteStoresRoute({List<_i25.PageRouteInfo>? children})
    : super(FavoriteStoresRoute.name, initialChildren: children);

  static const String name = 'FavoriteStoresRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i6.FavoriteStoresPage();
    },
  );
}

/// generated route for
/// [_i7.ForgotPasswordOtpPage]
class ForgotPasswordOtpRoute
    extends _i25.PageRouteInfo<ForgotPasswordOtpRouteArgs> {
  ForgotPasswordOtpRoute({
    _i26.Key? key,
    required String contact,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         ForgotPasswordOtpRoute.name,
         args: ForgotPasswordOtpRouteArgs(key: key, contact: contact),
         initialChildren: children,
       );

  static const String name = 'ForgotPasswordOtpRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgotPasswordOtpRouteArgs>();
      return _i7.ForgotPasswordOtpPage(key: args.key, contact: args.contact);
    },
  );
}

class ForgotPasswordOtpRouteArgs {
  const ForgotPasswordOtpRouteArgs({this.key, required this.contact});

  final _i26.Key? key;

  final String contact;

  @override
  String toString() {
    return 'ForgotPasswordOtpRouteArgs{key: $key, contact: $contact}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ForgotPasswordOtpRouteArgs) return false;
    return key == other.key && contact == other.contact;
  }

  @override
  int get hashCode => key.hashCode ^ contact.hashCode;
}

/// generated route for
/// [_i8.ForgotPasswordPage]
class ForgotPasswordRoute extends _i25.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i25.PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i8.ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [_i9.HomePage]
class HomeRoute extends _i25.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i26.Key? key,
    _i26.VoidCallback? onSearchTap,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         HomeRoute.name,
         args: HomeRouteArgs(key: key, onSearchTap: onSearchTap),
         initialChildren: children,
       );

  static const String name = 'HomeRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>(
        orElse: () => const HomeRouteArgs(),
      );
      return _i9.HomePage(key: args.key, onSearchTap: args.onSearchTap);
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key, this.onSearchTap});

  final _i26.Key? key;

  final _i26.VoidCallback? onSearchTap;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, onSearchTap: $onSearchTap}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HomeRouteArgs) return false;
    return key == other.key && onSearchTap == other.onSearchTap;
  }

  @override
  int get hashCode => key.hashCode ^ onSearchTap.hashCode;
}

/// generated route for
/// [_i10.LoginPage]
class LoginRoute extends _i25.PageRouteInfo<void> {
  const LoginRoute({List<_i25.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i10.LoginPage();
    },
  );
}

/// generated route for
/// [_i11.MyInsightsPage]
class MyInsightsRoute extends _i25.PageRouteInfo<void> {
  const MyInsightsRoute({List<_i25.PageRouteInfo>? children})
    : super(MyInsightsRoute.name, initialChildren: children);

  static const String name = 'MyInsightsRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i11.MyInsightsPage();
    },
  );
}

/// generated route for
/// [_i12.NotificationDashboardPage]
class NotificationDashboardRoute extends _i25.PageRouteInfo<void> {
  const NotificationDashboardRoute({List<_i25.PageRouteInfo>? children})
    : super(NotificationDashboardRoute.name, initialChildren: children);

  static const String name = 'NotificationDashboardRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i12.NotificationDashboardPage();
    },
  );
}

/// generated route for
/// [_i13.OnboardingPage]
class OnboardingRoute extends _i25.PageRouteInfo<void> {
  const OnboardingRoute({List<_i25.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i13.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i14.OtpVerificationPage]
class OtpVerificationRoute
    extends _i25.PageRouteInfo<OtpVerificationRouteArgs> {
  OtpVerificationRoute({
    _i26.Key? key,
    required String phone,
    int expiresInSeconds = 300,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         OtpVerificationRoute.name,
         args: OtpVerificationRouteArgs(
           key: key,
           phone: phone,
           expiresInSeconds: expiresInSeconds,
         ),
         initialChildren: children,
       );

  static const String name = 'OtpVerificationRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpVerificationRouteArgs>();
      return _i14.OtpVerificationPage(
        key: args.key,
        phone: args.phone,
        expiresInSeconds: args.expiresInSeconds,
      );
    },
  );
}

class OtpVerificationRouteArgs {
  const OtpVerificationRouteArgs({
    this.key,
    required this.phone,
    this.expiresInSeconds = 300,
  });

  final _i26.Key? key;

  final String phone;

  final int expiresInSeconds;

  @override
  String toString() {
    return 'OtpVerificationRouteArgs{key: $key, phone: $phone, expiresInSeconds: $expiresInSeconds}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OtpVerificationRouteArgs) return false;
    return key == other.key &&
        phone == other.phone &&
        expiresInSeconds == other.expiresInSeconds;
  }

  @override
  int get hashCode => key.hashCode ^ phone.hashCode ^ expiresInSeconds.hashCode;
}

/// generated route for
/// [_i15.ProfileEditPage]
class ProfileEditRoute extends _i25.PageRouteInfo<ProfileEditRouteArgs> {
  ProfileEditRoute({
    _i26.Key? key,
    _i30.User? user,
    bool isInitialSetup = false,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         ProfileEditRoute.name,
         args: ProfileEditRouteArgs(
           key: key,
           user: user,
           isInitialSetup: isInitialSetup,
         ),
         initialChildren: children,
       );

  static const String name = 'ProfileEditRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileEditRouteArgs>(
        orElse: () => const ProfileEditRouteArgs(),
      );
      return _i15.ProfileEditPage(
        key: args.key,
        user: args.user,
        isInitialSetup: args.isInitialSetup,
      );
    },
  );
}

class ProfileEditRouteArgs {
  const ProfileEditRouteArgs({
    this.key,
    this.user,
    this.isInitialSetup = false,
  });

  final _i26.Key? key;

  final _i30.User? user;

  final bool isInitialSetup;

  @override
  String toString() {
    return 'ProfileEditRouteArgs{key: $key, user: $user, isInitialSetup: $isInitialSetup}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProfileEditRouteArgs) return false;
    return key == other.key &&
        user == other.user &&
        isInitialSetup == other.isInitialSetup;
  }

  @override
  int get hashCode => key.hashCode ^ user.hashCode ^ isInitialSetup.hashCode;
}

/// generated route for
/// [_i16.ProfilePage]
class ProfileRoute extends _i25.PageRouteInfo<void> {
  const ProfileRoute({List<_i25.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i16.ProfilePage();
    },
  );
}

/// generated route for
/// [_i17.RegisterPage]
class RegisterRoute extends _i25.PageRouteInfo<void> {
  const RegisterRoute({List<_i25.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i17.RegisterPage();
    },
  );
}

/// generated route for
/// [_i18.ResetPasswordPage]
class ResetPasswordRoute extends _i25.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    _i26.Key? key,
    required String contact,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         ResetPasswordRoute.name,
         args: ResetPasswordRouteArgs(key: key, contact: contact),
         initialChildren: children,
       );

  static const String name = 'ResetPasswordRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResetPasswordRouteArgs>();
      return _i18.ResetPasswordPage(key: args.key, contact: args.contact);
    },
  );
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({this.key, required this.contact});

  final _i26.Key? key;

  final String contact;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key, contact: $contact}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ResetPasswordRouteArgs) return false;
    return key == other.key && contact == other.contact;
  }

  @override
  int get hashCode => key.hashCode ^ contact.hashCode;
}

/// generated route for
/// [_i19.RootPage]
class RootRoute extends _i25.PageRouteInfo<void> {
  const RootRoute({List<_i25.PageRouteInfo>? children})
    : super(RootRoute.name, initialChildren: children);

  static const String name = 'RootRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i19.RootPage();
    },
  );
}

/// generated route for
/// [_i20.SelectServicesPage]
class SelectServicesRoute extends _i25.PageRouteInfo<SelectServicesRouteArgs> {
  SelectServicesRoute({
    _i26.Key? key,
    String? storeId,
    String salonName = 'LUXE SALON',
    List<_i25.PageRouteInfo>? children,
  }) : super(
         SelectServicesRoute.name,
         args: SelectServicesRouteArgs(
           key: key,
           storeId: storeId,
           salonName: salonName,
         ),
         initialChildren: children,
       );

  static const String name = 'SelectServicesRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SelectServicesRouteArgs>(
        orElse: () => const SelectServicesRouteArgs(),
      );
      return _i20.SelectServicesPage(
        key: args.key,
        storeId: args.storeId,
        salonName: args.salonName,
      );
    },
  );
}

class SelectServicesRouteArgs {
  const SelectServicesRouteArgs({
    this.key,
    this.storeId,
    this.salonName = 'LUXE SALON',
  });

  final _i26.Key? key;

  final String? storeId;

  final String salonName;

  @override
  String toString() {
    return 'SelectServicesRouteArgs{key: $key, storeId: $storeId, salonName: $salonName}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SelectServicesRouteArgs) return false;
    return key == other.key &&
        storeId == other.storeId &&
        salonName == other.salonName;
  }

  @override
  int get hashCode => key.hashCode ^ storeId.hashCode ^ salonName.hashCode;
}

/// generated route for
/// [_i21.SplashPage]
class SplashRoute extends _i25.PageRouteInfo<void> {
  const SplashRoute({List<_i25.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i21.SplashPage();
    },
  );
}

/// generated route for
/// [_i22.StoreDetailPage]
class StoreDetailRoute extends _i25.PageRouteInfo<StoreDetailRouteArgs> {
  StoreDetailRoute({
    _i26.Key? key,
    String? storeId,
    _i31.StoreDetailItem? initialStore,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         StoreDetailRoute.name,
         args: StoreDetailRouteArgs(
           key: key,
           storeId: storeId,
           initialStore: initialStore,
         ),
         initialChildren: children,
       );

  static const String name = 'StoreDetailRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StoreDetailRouteArgs>(
        orElse: () => const StoreDetailRouteArgs(),
      );
      return _i22.StoreDetailPage(
        key: args.key,
        storeId: args.storeId,
        initialStore: args.initialStore,
      );
    },
  );
}

class StoreDetailRouteArgs {
  const StoreDetailRouteArgs({this.key, this.storeId, this.initialStore});

  final _i26.Key? key;

  final String? storeId;

  final _i31.StoreDetailItem? initialStore;

  @override
  String toString() {
    return 'StoreDetailRouteArgs{key: $key, storeId: $storeId, initialStore: $initialStore}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! StoreDetailRouteArgs) return false;
    return key == other.key &&
        storeId == other.storeId &&
        initialStore == other.initialStore;
  }

  @override
  int get hashCode => key.hashCode ^ storeId.hashCode ^ initialStore.hashCode;
}

/// generated route for
/// [_i23.VoucherDetailPage]
class VoucherDetailRoute extends _i25.PageRouteInfo<VoucherDetailRouteArgs> {
  VoucherDetailRoute({
    _i26.Key? key,
    _i29.VoucherNotificationData? voucher,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         VoucherDetailRoute.name,
         args: VoucherDetailRouteArgs(key: key, voucher: voucher),
         initialChildren: children,
       );

  static const String name = 'VoucherDetailRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VoucherDetailRouteArgs>(
        orElse: () => const VoucherDetailRouteArgs(),
      );
      return _i23.VoucherDetailPage(key: args.key, voucher: args.voucher);
    },
  );
}

class VoucherDetailRouteArgs {
  const VoucherDetailRouteArgs({this.key, this.voucher});

  final _i26.Key? key;

  final _i29.VoucherNotificationData? voucher;

  @override
  String toString() {
    return 'VoucherDetailRouteArgs{key: $key, voucher: $voucher}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VoucherDetailRouteArgs) return false;
    return key == other.key && voucher == other.voucher;
  }

  @override
  int get hashCode => key.hashCode ^ voucher.hashCode;
}

/// generated route for
/// [_i24.WriteReviewPage]
class WriteReviewRoute extends _i25.PageRouteInfo<WriteReviewRouteArgs> {
  WriteReviewRoute({
    _i26.Key? key,
    String? salonName,
    String? logoUrl,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         WriteReviewRoute.name,
         args: WriteReviewRouteArgs(
           key: key,
           salonName: salonName,
           logoUrl: logoUrl,
         ),
         initialChildren: children,
       );

  static const String name = 'WriteReviewRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WriteReviewRouteArgs>(
        orElse: () => const WriteReviewRouteArgs(),
      );
      return _i24.WriteReviewPage(
        key: args.key,
        salonName: args.salonName,
        logoUrl: args.logoUrl,
      );
    },
  );
}

class WriteReviewRouteArgs {
  const WriteReviewRouteArgs({this.key, this.salonName, this.logoUrl});

  final _i26.Key? key;

  final String? salonName;

  final String? logoUrl;

  @override
  String toString() {
    return 'WriteReviewRouteArgs{key: $key, salonName: $salonName, logoUrl: $logoUrl}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WriteReviewRouteArgs) return false;
    return key == other.key &&
        salonName == other.salonName &&
        logoUrl == other.logoUrl;
  }

  @override
  int get hashCode => key.hashCode ^ salonName.hashCode ^ logoUrl.hashCode;
}
