enum AppSessionStatus {
  unauthenticated,
  authenticating,
  authenticated,
  sessionExpired,
  loggingOut;

  bool get isAuthenticated => this == AppSessionStatus.authenticated;
  bool get isUnauthenticated =>
      this == AppSessionStatus.unauthenticated ||
      this == AppSessionStatus.sessionExpired;
}
