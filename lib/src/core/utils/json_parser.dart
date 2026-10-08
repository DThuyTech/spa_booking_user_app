class JsonParser {
  const JsonParser._();

  // =========================
  // String
  // =========================

  static String string(dynamic value, {String defaultValue = ''}) {
    if (value == null) return defaultValue;
    return value.toString();
  }

  static String? stringOrNull(dynamic value) {
    if (value == null) return null;

    final result = value.toString().trim();
    return result.isEmpty ? null : result;
  }

  // =========================
  // Int
  // =========================

  static int intValue(dynamic value, {int defaultValue = 0}) {
    if (value == null) return defaultValue;

    if (value is int) return value;
    if (value is num) return value.toInt();

    return int.tryParse(value.toString()) ?? defaultValue;
  }

  static int? intOrNull(dynamic value) {
    if (value == null) return null;

    if (value is int) return value;
    if (value is num) return value.toInt();

    return int.tryParse(value.toString());
  }

  // =========================
  // Double
  // =========================

  static double doubleValue(dynamic value, {double defaultValue = 0.0}) {
    if (value == null) return defaultValue;

    if (value is double) return value;
    if (value is num) return value.toDouble();

    return double.tryParse(value.toString()) ?? defaultValue;
  }

  static double? doubleOrNull(dynamic value) {
    if (value == null) return null;

    if (value is double) return value;
    if (value is num) return value.toDouble();

    return double.tryParse(value.toString());
  }

  // =========================
  // Bool
  // =========================

  static bool boolValue(dynamic value, {bool defaultValue = false}) {
    if (value == null) return defaultValue;

    if (value is bool) return value;

    if (value is num) {
      return value != 0;
    }

    switch (value.toString().toLowerCase().trim()) {
      case 'true':
      case '1':
      case 'yes':
      case 'y':
        return true;

      case 'false':
      case '0':
      case 'no':
      case 'n':
        return false;

      default:
        return defaultValue;
    }
  }

  static bool? boolOrNull(dynamic value) {
    if (value == null) return null;

    if (value is bool) return value;

    if (value is num) {
      return value != 0;
    }

    switch (value.toString().toLowerCase().trim()) {
      case 'true':
      case '1':
      case 'yes':
      case 'y':
        return true;

      case 'false':
      case '0':
      case 'no':
      case 'n':
        return false;

      default:
        return null;
    }
  }

  // =========================
  // DateTime
  // =========================

  static DateTime? dateTimeOrNull(dynamic value) {
    if (value == null) return null;

    if (value is DateTime) return value;

    return DateTime.tryParse(value.toString());
  }

  static DateTime dateTime(dynamic value, {required DateTime defaultValue}) {
    return dateTimeOrNull(value) ?? defaultValue;
  }

  // =========================
  // Map
  // =========================

  static Map<String, dynamic> map(dynamic value) {
    if (value is Map<String, dynamic>) {
      return value;
    }

    if (value is Map) {
      return Map<String, dynamic>.from(value);
    }

    return {};
  }

  static Map<String, dynamic>? mapOrNull(dynamic value) {
    if (value == null) return null;

    if (value is Map<String, dynamic>) {
      return value;
    }

    if (value is Map) {
      return Map<String, dynamic>.from(value);
    }

    return null;
  }

  // =========================
  // List
  // =========================

  static List<dynamic> list(dynamic value) {
    if (value is List) return value;
    return [];
  }

  static List<String> stringList(dynamic value) {
    if (value is! List) return [];

    return value.where((e) => e != null).map((e) => e.toString()).toList();
  }
}
