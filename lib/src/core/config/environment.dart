enum Environment {
  development,
  staging,
  production;

  static Environment fromString(String value) {
    return switch (value.toLowerCase()) {
      'staging' => Environment.staging,
      'production' || 'prod' => Environment.production,
      _ => Environment.development,
    };
  }

  bool get isDevelopment => this == Environment.development;
  bool get isStaging => this == Environment.staging;
  bool get isProduction => this == Environment.production;
}
