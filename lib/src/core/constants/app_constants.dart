abstract final class AppConstants {
  static const String appName = 'Board Oi';
  static const String defaultLocale = 'en';
  static const String supportedLocaleEn = 'en';
  static const String supportedLocaleVi = 'vi';

  // Storage keys
  static const String keyAccessToken = 'auth_access_token';
  static const String keyRefreshToken = 'auth_refresh_token';
  static const String keyThemeMode = 'settings_theme_mode';
  static const String keyLanguage = 'settings_language';
  static const String keyOnboardingComplete = 'onboarding_complete';
  static const String keySessionUser = 'session_user_data';
  static const String keyTokenExpiry = 'auth_token_expiry';

  // HTTP Header names
  static const String headerAuthorization = 'Authorization';
  static const String headerIdempotencyKey = 'X-Idempotency-Key';
  static const String headerContentType = 'Content-Type';
  static const String contentTypeJson = 'application/json';
}
