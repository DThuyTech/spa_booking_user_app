// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:board_oi/src/presentation/view/auth/login/view/login_view.dart'
    as _i2;
import 'package:board_oi/src/presentation/view/auth/otp_verification/view/otp_verification_view.dart'
    as _i4;
import 'package:board_oi/src/presentation/view/auth/register/view/register_view.dart'
    as _i5;
import 'package:board_oi/src/presentation/view/home/view/home_view.dart' as _i1;
import 'package:board_oi/src/presentation/view/onboarding/onboarding_page.dart'
    as _i3;
import 'package:board_oi/src/presentation/view/root/root_page.dart' as _i6;
import 'package:board_oi/src/presentation/view/splash/splash_page.dart' as _i7;
import 'package:board_oi/src/presentation/view/profile/view/profile_view.dart'
    as _i10;
import 'package:board_oi/src/presentation/view/profile/edit/view/profile_edit_view.dart'
    as _i11;
import 'package:board_oi/src/domain/entities/auth/user.dart' as _i12;
import 'package:flutter/material.dart' as _i9;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginPage();
    },
  );
}

/// generated route for
/// [_i3.OnboardingPage]
class OnboardingRoute extends _i8.PageRouteInfo<void> {
  const OnboardingRoute({List<_i8.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i4.OtpVerificationPage]
class OtpVerificationRoute extends _i8.PageRouteInfo<OtpVerificationRouteArgs> {
  OtpVerificationRoute({
    _i9.Key? key,
    required String phone,
    int expiresInSeconds = 300,
    List<_i8.PageRouteInfo>? children,
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

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpVerificationRouteArgs>();
      return _i4.OtpVerificationPage(
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

  final _i9.Key? key;

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
/// [_i5.RegisterPage]
class RegisterRoute extends _i8.PageRouteInfo<void> {
  const RegisterRoute({List<_i8.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.RegisterPage();
    },
  );
}

/// generated route for
/// [_i6.RootPage]
class RootRoute extends _i8.PageRouteInfo<void> {
  const RootRoute({List<_i8.PageRouteInfo>? children})
    : super(RootRoute.name, initialChildren: children);

  static const String name = 'RootRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.RootPage();
    },
  );
}

/// generated route for
/// [_i7.SplashPage]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.SplashPage();
    },
  );
}

/// generated route for
/// [_i10.ProfilePage]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute({List<_i8.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i10.ProfilePage();
    },
  );
}

/// generated route for
/// [_i11.ProfileEditPage]
class ProfileEditRoute extends _i8.PageRouteInfo<ProfileEditRouteArgs> {
  ProfileEditRoute({
    _i9.Key? key,
    _i12.User? user,
    bool isInitialSetup = false,
    List<_i8.PageRouteInfo>? children,
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

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileEditRouteArgs>(
        orElse: () => const ProfileEditRouteArgs(),
      );
      return _i11.ProfileEditPage(
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

  final _i9.Key? key;
  final _i12.User? user;
  final bool isInitialSetup;

  @override
  String toString() {
    return 'ProfileEditRouteArgs{key: $key, user: $user, isInitialSetup: $isInitialSetup}';
  }
}
