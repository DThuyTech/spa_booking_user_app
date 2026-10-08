import 'package:latlong2/latlong.dart';

/// Utility to calculate distance between user location and salon/store.
class DistanceHelper {
  const DistanceHelper._();

  static const Distance _distance = Distance();

  /// Calculates the distance in kilometers between two geo coordinates.
  static double calculateDistanceInKm({
    required double userLat,
    required double userLng,
    required double storeLat,
    required double storeLng,
  }) {
    return _distance.as(
      LengthUnit.Kilometer,
      LatLng(userLat, userLng),
      LatLng(storeLat, storeLng),
    );
  }

  /// Calculates the distance in meters between two geo coordinates.
  static double calculateDistanceInMeters({
    required double userLat,
    required double userLng,
    required double storeLat,
    required double storeLng,
  }) {
    return _distance.as(
      LengthUnit.Meter,
      LatLng(userLat, userLng),
      LatLng(storeLat, storeLng),
    );
  }

  /// Formats a distance in kilometers into a user-friendly string (e.g. "850 m", "2.3 km").
  static String formatDistance(double km) {
    if (km < 1.0) {
      final meters = (km * 1000).round();
      return '$meters m';
    }
    return '${km.toStringAsFixed(1)} km';
  }

  /// Calculates and formats the distance if all coordinate parameters are provided.
  /// Returns null if any coordinate is missing or null.
  static String? calculateAndFormat({
    double? userLat,
    double? userLng,
    double? storeLat,
    double? storeLng,
  }) {
    if (userLat == null ||
        userLng == null ||
        storeLat == null ||
        storeLng == null) {
      return null;
    }
    final km = calculateDistanceInKm(
      userLat: userLat,
      userLng: userLng,
      storeLat: storeLat,
      storeLng: storeLng,
    );
    return formatDistance(km);
  }
}
