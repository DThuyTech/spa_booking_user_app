abstract final class UrlConstants {
  static const String apiV1 = '/api/v1';
  static const String apiVersion = apiV1;

  static const String authCustomerLogin = '$apiV1/auth/customer/login';
  static const String authCustomerRegister = '$apiV1/auth/customer/register';
  static const String authLogin = authCustomerLogin;
  static const String authRegister = authCustomerRegister;
  static const String authRefresh = '$apiV1/auth/refresh';
  static const String authLogout = '$apiV1/auth/logout';
  static const String authMe = '$apiV1/auth/me';
  static const String usersMe = '$apiV1/users/me';
  static const String customerMeProfile = '$apiV1/customers/me/profile';

  static const String greeting = '$apiV1/greeting';
  static const String matches = '$apiV1/matches';
  static const String events = '$apiV1/events';
  static const String venues = '$apiV1/venues';
}
