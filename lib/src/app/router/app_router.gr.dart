// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:auto_route/auto_route.dart' as _i29;
import 'package:collection/collection.dart' as _i32;
import 'package:flutter/material.dart' as _i30;
import 'package:spa_booking/src/domain/entities/auth/user.dart' as _i35;
import 'package:spa_booking/src/domain/entities/review/user_review_entity.dart'
    as _i36;
import 'package:spa_booking/src/domain/entities/store/store_entity.dart'
    as _i34;
import 'package:spa_booking/src/presentation/view/auth/change_password/view/change_password_view.dart'
    as _i5;
import 'package:spa_booking/src/presentation/view/auth/forgot_password/view/forgot_password_view.dart'
    as _i8;
import 'package:spa_booking/src/presentation/view/auth/forgot_password_otp/view/forgot_password_otp_view.dart'
    as _i7;
import 'package:spa_booking/src/presentation/view/auth/login/view/login_view.dart'
    as _i10;
import 'package:spa_booking/src/presentation/view/auth/otp_verification/view/otp_verification_view.dart'
    as _i16;
import 'package:spa_booking/src/presentation/view/auth/register/view/register_view.dart'
    as _i19;
import 'package:spa_booking/src/presentation/view/auth/reset_password/view/reset_password_view.dart'
    as _i20;
import 'package:spa_booking/src/presentation/view/booking_flow/booking_detail/view/booking_detail_view.dart'
    as _i1;
import 'package:spa_booking/src/presentation/view/booking_flow/booking_result/view/booking_result_view.dart'
    as _i3;
import 'package:spa_booking/src/presentation/view/booking_flow/booking_schedule/view/booking_schedule_view.dart'
    as _i4;
import 'package:spa_booking/src/presentation/view/booking_flow/models/booking_models.dart'
    as _i31;
import 'package:spa_booking/src/presentation/view/booking_flow/select_services/view/select_services_view.dart'
    as _i22;
import 'package:spa_booking/src/presentation/view/favorite_stores/view/favorite_stores_view.dart'
    as _i6;
import 'package:spa_booking/src/presentation/view/home/view/home_view.dart'
    as _i9;
import 'package:spa_booking/src/presentation/view/home/view/nearby_stores_list_page.dart'
    as _i12;
import 'package:spa_booking/src/presentation/view/insights/view/my_insights_view.dart'
    as _i11;
import 'package:spa_booking/src/presentation/view/nearby_stores/view/nearby_stores_view.dart'
    as _i13;
import 'package:spa_booking/src/presentation/view/notification/models/notification_models.dart'
    as _i33;
import 'package:spa_booking/src/presentation/view/notification/notification_dashboard/view/notification_dashboard_view.dart'
    as _i14;
import 'package:spa_booking/src/presentation/view/notification/notification_detail_booking/view/booking_notification_view.dart'
    as _i2;
import 'package:spa_booking/src/presentation/view/notification/notification_detail_voucher/view/voucher_detail_view.dart'
    as _i27;
import 'package:spa_booking/src/presentation/view/onboarding/onboarding_page.dart'
    as _i15;
import 'package:spa_booking/src/presentation/view/profile/edit/view/profile_edit_view.dart'
    as _i17;
import 'package:spa_booking/src/presentation/view/profile/view/profile_view.dart'
    as _i18;
import 'package:spa_booking/src/presentation/view/root/root_page.dart' as _i21;
import 'package:spa_booking/src/presentation/view/splash/splash_page.dart'
    as _i23;
import 'package:spa_booking/src/presentation/view/store_detail/view/store_detail_view.dart'
    as _i24;
import 'package:spa_booking/src/presentation/view/user_reviews/view/user_review_detail_view.dart'
    as _i25;
import 'package:spa_booking/src/presentation/view/user_reviews/view/user_reviews_view.dart'
    as _i26;
import 'package:spa_booking/src/presentation/view/write_review/view/write_review_view.dart'
    as _i28;

/// generated route for
/// [_i1.BookingDetailPage]
class BookingDetailRoute extends _i29.PageRouteInfo<BookingDetailRouteArgs> {
  BookingDetailRoute({
    _i30.Key? key,
    String? storeId,
    String salonName = '',
    String selectedDate = '',
    String selectedTime = '',
    List<_i31.BookingServiceItem>? selectedServices,
    String? selectedStaffId,
    DateTime? startAt,
    List<_i29.PageRouteInfo>? children,
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
           startAt: startAt,
         ),
         initialChildren: children,
       );

  static const String name = 'BookingDetailRoute';

  static _i29.PageInfo page = _i29.PageInfo(
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
        startAt: args.startAt,
      );
    },
  );
}

class BookingDetailRouteArgs {
  const BookingDetailRouteArgs({
    this.key,
    this.storeId,
    this.salonName = '',
    this.selectedDate = '',
    this.selectedTime = '',
    this.selectedServices,
    this.selectedStaffId,
    this.startAt,
  });

  final _i30.Key? key;

  final String? storeId;

  final String salonName;

  final String selectedDate;

  final String selectedTime;

  final List<_i31.BookingServiceItem>? selectedServices;

  final String? selectedStaffId;

  final DateTime? startAt;

  @override
  String toString() {
    return 'BookingDetailRouteArgs{key: $key, storeId: $storeId, salonName: $salonName, selectedDate: $selectedDate, selectedTime: $selectedTime, selectedServices: $selectedServices, selectedStaffId: $selectedStaffId, startAt: $startAt}';
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
        const _i32.ListEquality<_i31.BookingServiceItem>().equals(
          selectedServices,
          other.selectedServices,
        ) &&
        selectedStaffId == other.selectedStaffId &&
        startAt == other.startAt;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      storeId.hashCode ^
      salonName.hashCode ^
      selectedDate.hashCode ^
      selectedTime.hashCode ^
      const _i32.ListEquality<_i31.BookingServiceItem>().hash(
        selectedServices,
      ) ^
      selectedStaffId.hashCode ^
      startAt.hashCode;
}

/// generated route for
/// [_i2.BookingNotificationPage]
class BookingNotificationRoute
    extends _i29.PageRouteInfo<BookingNotificationRouteArgs> {
  BookingNotificationRoute({
    _i30.Key? key,
    _i33.BookingNotificationData? booking,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         BookingNotificationRoute.name,
         args: BookingNotificationRouteArgs(key: key, booking: booking),
         initialChildren: children,
       );

  static const String name = 'BookingNotificationRoute';

  static _i29.PageInfo page = _i29.PageInfo(
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

  final _i30.Key? key;

  final _i33.BookingNotificationData? booking;

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
class BookingResultRoute extends _i29.PageRouteInfo<BookingResultRouteArgs> {
  BookingResultRoute({
    _i30.Key? key,
    bool isSuccess = true,
    String? bookingCode,
    String? salonName,
    String? dateDisplay,
    String? timeDisplay,
    double? totalAmount,
    List<_i29.PageRouteInfo>? children,
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

  static _i29.PageInfo page = _i29.PageInfo(
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

  final _i30.Key? key;

  final bool isSuccess;

  final String? bookingCode;

  final String? salonName;

  final String? dateDisplay;

  final String? timeDisplay;

  final double? totalAmount;

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
    extends _i29.PageRouteInfo<BookingScheduleRouteArgs> {
  BookingScheduleRoute({
    _i30.Key? key,
    String? storeId,
    required String salonName,
    List<_i31.BookingServiceItem>? selectedServices,
    String? selectedStaffId,
    List<_i29.PageRouteInfo>? children,
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

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BookingScheduleRouteArgs>();
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
    required this.salonName,
    this.selectedServices,
    this.selectedStaffId,
  });

  final _i30.Key? key;

  final String? storeId;

  final String salonName;

  final List<_i31.BookingServiceItem>? selectedServices;

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
        const _i32.ListEquality<_i31.BookingServiceItem>().equals(
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
      const _i32.ListEquality<_i31.BookingServiceItem>().hash(
        selectedServices,
      ) ^
      selectedStaffId.hashCode;
}

/// generated route for
/// [_i5.ChangePasswordPage]
class ChangePasswordRoute extends _i29.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i29.PageRouteInfo>? children})
    : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i5.ChangePasswordPage();
    },
  );
}

/// generated route for
/// [_i6.FavoriteStoresPage]
class FavoriteStoresRoute extends _i29.PageRouteInfo<void> {
  const FavoriteStoresRoute({List<_i29.PageRouteInfo>? children})
    : super(FavoriteStoresRoute.name, initialChildren: children);

  static const String name = 'FavoriteStoresRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i6.FavoriteStoresPage();
    },
  );
}

/// generated route for
/// [_i7.ForgotPasswordOtpPage]
class ForgotPasswordOtpRoute
    extends _i29.PageRouteInfo<ForgotPasswordOtpRouteArgs> {
  ForgotPasswordOtpRoute({
    _i30.Key? key,
    required String contact,
    String? initialOtp,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         ForgotPasswordOtpRoute.name,
         args: ForgotPasswordOtpRouteArgs(
           key: key,
           contact: contact,
           initialOtp: initialOtp,
         ),
         initialChildren: children,
       );

  static const String name = 'ForgotPasswordOtpRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgotPasswordOtpRouteArgs>();
      return _i7.ForgotPasswordOtpPage(
        key: args.key,
        contact: args.contact,
        initialOtp: args.initialOtp,
      );
    },
  );
}

class ForgotPasswordOtpRouteArgs {
  const ForgotPasswordOtpRouteArgs({
    this.key,
    required this.contact,
    this.initialOtp,
  });

  final _i30.Key? key;

  final String contact;

  final String? initialOtp;

  @override
  String toString() {
    return 'ForgotPasswordOtpRouteArgs{key: $key, contact: $contact, initialOtp: $initialOtp}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ForgotPasswordOtpRouteArgs) return false;
    return key == other.key &&
        contact == other.contact &&
        initialOtp == other.initialOtp;
  }

  @override
  int get hashCode => key.hashCode ^ contact.hashCode ^ initialOtp.hashCode;
}

/// generated route for
/// [_i8.ForgotPasswordPage]
class ForgotPasswordRoute extends _i29.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i29.PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i8.ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [_i9.HomePage]
class HomeRoute extends _i29.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i30.Key? key,
    _i30.VoidCallback? onSearchTap,
    _i30.VoidCallback? onAvatarTap,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         HomeRoute.name,
         args: HomeRouteArgs(
           key: key,
           onSearchTap: onSearchTap,
           onAvatarTap: onAvatarTap,
         ),
         initialChildren: children,
       );

  static const String name = 'HomeRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>(
        orElse: () => const HomeRouteArgs(),
      );
      return _i9.HomePage(
        key: args.key,
        onSearchTap: args.onSearchTap,
        onAvatarTap: args.onAvatarTap,
      );
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key, this.onSearchTap, this.onAvatarTap});

  final _i30.Key? key;

  final _i30.VoidCallback? onSearchTap;

  final _i30.VoidCallback? onAvatarTap;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, onSearchTap: $onSearchTap, onAvatarTap: $onAvatarTap}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HomeRouteArgs) return false;
    return key == other.key &&
        onSearchTap == other.onSearchTap &&
        onAvatarTap == other.onAvatarTap;
  }

  @override
  int get hashCode =>
      key.hashCode ^ onSearchTap.hashCode ^ onAvatarTap.hashCode;
}

/// generated route for
/// [_i10.LoginPage]
class LoginRoute extends _i29.PageRouteInfo<void> {
  const LoginRoute({List<_i29.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i10.LoginPage();
    },
  );
}

/// generated route for
/// [_i11.MyInsightsPage]
class MyInsightsRoute extends _i29.PageRouteInfo<void> {
  const MyInsightsRoute({List<_i29.PageRouteInfo>? children})
    : super(MyInsightsRoute.name, initialChildren: children);

  static const String name = 'MyInsightsRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i11.MyInsightsPage();
    },
  );
}

/// generated route for
/// [_i12.NearbyStoresListPage]
class NearbyStoresListRoute
    extends _i29.PageRouteInfo<NearbyStoresListRouteArgs> {
  NearbyStoresListRoute({
    _i30.Key? key,
    List<_i34.StoreEntity>? initialStores,
    String? city,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         NearbyStoresListRoute.name,
         args: NearbyStoresListRouteArgs(
           key: key,
           initialStores: initialStores,
           city: city,
         ),
         initialChildren: children,
       );

  static const String name = 'NearbyStoresListRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NearbyStoresListRouteArgs>(
        orElse: () => const NearbyStoresListRouteArgs(),
      );
      return _i12.NearbyStoresListPage(
        key: args.key,
        initialStores: args.initialStores,
        city: args.city,
      );
    },
  );
}

class NearbyStoresListRouteArgs {
  const NearbyStoresListRouteArgs({this.key, this.initialStores, this.city});

  final _i30.Key? key;

  final List<_i34.StoreEntity>? initialStores;

  final String? city;

  @override
  String toString() {
    return 'NearbyStoresListRouteArgs{key: $key, initialStores: $initialStores, city: $city}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NearbyStoresListRouteArgs) return false;
    return key == other.key &&
        const _i32.ListEquality<_i34.StoreEntity>().equals(
          initialStores,
          other.initialStores,
        ) &&
        city == other.city;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      const _i32.ListEquality<_i34.StoreEntity>().hash(initialStores) ^
      city.hashCode;
}

/// generated route for
/// [_i13.NearbyStoresView]
class NearbyStoresView extends _i29.PageRouteInfo<void> {
  const NearbyStoresView({List<_i29.PageRouteInfo>? children})
    : super(NearbyStoresView.name, initialChildren: children);

  static const String name = 'NearbyStoresView';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i13.NearbyStoresView();
    },
  );
}

/// generated route for
/// [_i14.NotificationDashboardPage]
class NotificationDashboardRoute extends _i29.PageRouteInfo<void> {
  const NotificationDashboardRoute({List<_i29.PageRouteInfo>? children})
    : super(NotificationDashboardRoute.name, initialChildren: children);

  static const String name = 'NotificationDashboardRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i14.NotificationDashboardPage();
    },
  );
}

/// generated route for
/// [_i15.OnboardingPage]
class OnboardingRoute extends _i29.PageRouteInfo<void> {
  const OnboardingRoute({List<_i29.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i15.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i16.OtpVerificationPage]
class OtpVerificationRoute
    extends _i29.PageRouteInfo<OtpVerificationRouteArgs> {
  OtpVerificationRoute({
    _i30.Key? key,
    required String phone,
    int expiresInSeconds = 300,
    List<_i29.PageRouteInfo>? children,
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

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpVerificationRouteArgs>();
      return _i16.OtpVerificationPage(
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

  final _i30.Key? key;

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
/// [_i17.ProfileEditPage]
class ProfileEditRoute extends _i29.PageRouteInfo<ProfileEditRouteArgs> {
  ProfileEditRoute({
    _i30.Key? key,
    _i35.User? user,
    bool isInitialSetup = false,
    List<_i29.PageRouteInfo>? children,
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

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileEditRouteArgs>(
        orElse: () => const ProfileEditRouteArgs(),
      );
      return _i17.ProfileEditPage(
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

  final _i30.Key? key;

  final _i35.User? user;

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
/// [_i18.ProfilePage]
class ProfileRoute extends _i29.PageRouteInfo<void> {
  const ProfileRoute({List<_i29.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i18.ProfilePage();
    },
  );
}

/// generated route for
/// [_i19.RegisterPage]
class RegisterRoute extends _i29.PageRouteInfo<void> {
  const RegisterRoute({List<_i29.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i19.RegisterPage();
    },
  );
}

/// generated route for
/// [_i20.ResetPasswordPage]
class ResetPasswordRoute extends _i29.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    _i30.Key? key,
    required String contact,
    String otp = '123456',
    List<_i29.PageRouteInfo>? children,
  }) : super(
         ResetPasswordRoute.name,
         args: ResetPasswordRouteArgs(key: key, contact: contact, otp: otp),
         initialChildren: children,
       );

  static const String name = 'ResetPasswordRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResetPasswordRouteArgs>();
      return _i20.ResetPasswordPage(
        key: args.key,
        contact: args.contact,
        otp: args.otp,
      );
    },
  );
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({
    this.key,
    required this.contact,
    this.otp = '123456',
  });

  final _i30.Key? key;

  final String contact;

  final String otp;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key, contact: $contact, otp: $otp}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ResetPasswordRouteArgs) return false;
    return key == other.key && contact == other.contact && otp == other.otp;
  }

  @override
  int get hashCode => key.hashCode ^ contact.hashCode ^ otp.hashCode;
}

/// generated route for
/// [_i21.RootPage]
class RootRoute extends _i29.PageRouteInfo<void> {
  const RootRoute({List<_i29.PageRouteInfo>? children})
    : super(RootRoute.name, initialChildren: children);

  static const String name = 'RootRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i21.RootPage();
    },
  );
}

/// generated route for
/// [_i22.SelectServicesPage]
class SelectServicesRoute extends _i29.PageRouteInfo<SelectServicesRouteArgs> {
  SelectServicesRoute({
    _i30.Key? key,
    String? storeId,
    required String salonName,
    String? initialSelectedServiceId,
    List<_i31.BookingServiceItem>? initialServices,
    List<_i31.BookingStaffItem>? initialStaffMembers,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         SelectServicesRoute.name,
         args: SelectServicesRouteArgs(
           key: key,
           storeId: storeId,
           salonName: salonName,
           initialSelectedServiceId: initialSelectedServiceId,
           initialServices: initialServices,
           initialStaffMembers: initialStaffMembers,
         ),
         initialChildren: children,
       );

  static const String name = 'SelectServicesRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SelectServicesRouteArgs>();
      return _i22.SelectServicesPage(
        key: args.key,
        storeId: args.storeId,
        salonName: args.salonName,
        initialSelectedServiceId: args.initialSelectedServiceId,
        initialServices: args.initialServices,
        initialStaffMembers: args.initialStaffMembers,
      );
    },
  );
}

class SelectServicesRouteArgs {
  const SelectServicesRouteArgs({
    this.key,
    this.storeId,
    required this.salonName,
    this.initialSelectedServiceId,
    this.initialServices,
    this.initialStaffMembers,
  });

  final _i30.Key? key;

  final String? storeId;

  final String salonName;

  final String? initialSelectedServiceId;

  final List<_i31.BookingServiceItem>? initialServices;

  final List<_i31.BookingStaffItem>? initialStaffMembers;

  @override
  String toString() {
    return 'SelectServicesRouteArgs{key: $key, storeId: $storeId, salonName: $salonName, initialSelectedServiceId: $initialSelectedServiceId, initialServices: $initialServices, initialStaffMembers: $initialStaffMembers}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SelectServicesRouteArgs) return false;
    return key == other.key &&
        storeId == other.storeId &&
        salonName == other.salonName &&
        initialSelectedServiceId == other.initialSelectedServiceId &&
        const _i32.ListEquality<_i31.BookingServiceItem>().equals(
          initialServices,
          other.initialServices,
        ) &&
        const _i32.ListEquality<_i31.BookingStaffItem>().equals(
          initialStaffMembers,
          other.initialStaffMembers,
        );
  }

  @override
  int get hashCode =>
      key.hashCode ^
      storeId.hashCode ^
      salonName.hashCode ^
      initialSelectedServiceId.hashCode ^
      const _i32.ListEquality<_i31.BookingServiceItem>().hash(initialServices) ^
      const _i32.ListEquality<_i31.BookingStaffItem>().hash(
        initialStaffMembers,
      );
}

/// generated route for
/// [_i23.SplashPage]
class SplashRoute extends _i29.PageRouteInfo<void> {
  const SplashRoute({List<_i29.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i23.SplashPage();
    },
  );
}

/// generated route for
/// [_i24.StoreDetailPage]
class StoreDetailRoute extends _i29.PageRouteInfo<StoreDetailRouteArgs> {
  StoreDetailRoute({
    _i30.Key? key,
    required String storeId,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         StoreDetailRoute.name,
         args: StoreDetailRouteArgs(key: key, storeId: storeId),
         initialChildren: children,
       );

  static const String name = 'StoreDetailRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StoreDetailRouteArgs>();
      return _i24.StoreDetailPage(key: args.key, storeId: args.storeId);
    },
  );
}

class StoreDetailRouteArgs {
  const StoreDetailRouteArgs({this.key, required this.storeId});

  final _i30.Key? key;

  final String storeId;

  @override
  String toString() {
    return 'StoreDetailRouteArgs{key: $key, storeId: $storeId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! StoreDetailRouteArgs) return false;
    return key == other.key && storeId == other.storeId;
  }

  @override
  int get hashCode => key.hashCode ^ storeId.hashCode;
}

/// generated route for
/// [_i25.UserReviewDetailPage]
class UserReviewDetailRoute
    extends _i29.PageRouteInfo<UserReviewDetailRouteArgs> {
  UserReviewDetailRoute({
    _i30.Key? key,
    required String reviewId,
    _i36.UserReviewEntity? initialReview,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         UserReviewDetailRoute.name,
         args: UserReviewDetailRouteArgs(
           key: key,
           reviewId: reviewId,
           initialReview: initialReview,
         ),
         initialChildren: children,
       );

  static const String name = 'UserReviewDetailRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UserReviewDetailRouteArgs>();
      return _i25.UserReviewDetailPage(
        key: args.key,
        reviewId: args.reviewId,
        initialReview: args.initialReview,
      );
    },
  );
}

class UserReviewDetailRouteArgs {
  const UserReviewDetailRouteArgs({
    this.key,
    required this.reviewId,
    this.initialReview,
  });

  final _i30.Key? key;

  final String reviewId;

  final _i36.UserReviewEntity? initialReview;

  @override
  String toString() {
    return 'UserReviewDetailRouteArgs{key: $key, reviewId: $reviewId, initialReview: $initialReview}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UserReviewDetailRouteArgs) return false;
    return key == other.key &&
        reviewId == other.reviewId &&
        initialReview == other.initialReview;
  }

  @override
  int get hashCode => key.hashCode ^ reviewId.hashCode ^ initialReview.hashCode;
}

/// generated route for
/// [_i26.UserReviewsPage]
class UserReviewsRoute extends _i29.PageRouteInfo<void> {
  const UserReviewsRoute({List<_i29.PageRouteInfo>? children})
    : super(UserReviewsRoute.name, initialChildren: children);

  static const String name = 'UserReviewsRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i26.UserReviewsPage();
    },
  );
}

/// generated route for
/// [_i27.VoucherDetailPage]
class VoucherDetailRoute extends _i29.PageRouteInfo<VoucherDetailRouteArgs> {
  VoucherDetailRoute({
    _i30.Key? key,
    _i33.VoucherNotificationData? voucher,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         VoucherDetailRoute.name,
         args: VoucherDetailRouteArgs(key: key, voucher: voucher),
         initialChildren: children,
       );

  static const String name = 'VoucherDetailRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VoucherDetailRouteArgs>(
        orElse: () => const VoucherDetailRouteArgs(),
      );
      return _i27.VoucherDetailPage(key: args.key, voucher: args.voucher);
    },
  );
}

class VoucherDetailRouteArgs {
  const VoucherDetailRouteArgs({this.key, this.voucher});

  final _i30.Key? key;

  final _i33.VoucherNotificationData? voucher;

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
/// [_i28.WriteReviewPage]
class WriteReviewRoute extends _i29.PageRouteInfo<WriteReviewRouteArgs> {
  WriteReviewRoute({
    _i30.Key? key,
    String? storeId,
    String? bookingId,
    String? salonName,
    String? logoUrl,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         WriteReviewRoute.name,
         args: WriteReviewRouteArgs(
           key: key,
           storeId: storeId,
           bookingId: bookingId,
           salonName: salonName,
           logoUrl: logoUrl,
         ),
         initialChildren: children,
       );

  static const String name = 'WriteReviewRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WriteReviewRouteArgs>(
        orElse: () => const WriteReviewRouteArgs(),
      );
      return _i28.WriteReviewPage(
        key: args.key,
        storeId: args.storeId,
        bookingId: args.bookingId,
        salonName: args.salonName,
        logoUrl: args.logoUrl,
      );
    },
  );
}

class WriteReviewRouteArgs {
  const WriteReviewRouteArgs({
    this.key,
    this.storeId,
    this.bookingId,
    this.salonName,
    this.logoUrl,
  });

  final _i30.Key? key;

  final String? storeId;

  final String? bookingId;

  final String? salonName;

  final String? logoUrl;

  @override
  String toString() {
    return 'WriteReviewRouteArgs{key: $key, storeId: $storeId, bookingId: $bookingId, salonName: $salonName, logoUrl: $logoUrl}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WriteReviewRouteArgs) return false;
    return key == other.key &&
        storeId == other.storeId &&
        bookingId == other.bookingId &&
        salonName == other.salonName &&
        logoUrl == other.logoUrl;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      storeId.hashCode ^
      bookingId.hashCode ^
      salonName.hashCode ^
      logoUrl.hashCode;
}
