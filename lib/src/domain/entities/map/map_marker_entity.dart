enum MapMarkerType { event, venue, match }

/// Domain entity representing an interactive pin on the Board Ơi map.
class MapMarkerEntity {
  final String id;
  final String title;
  final MapMarkerType type;
  final String gameName;
  final String? imageUrl;
  final double latitude;
  final double longitude;
  final double xRatio; // Relative canvas position 0.0 - 1.0 for interactive map
  final double yRatio; // Relative canvas position 0.0 - 1.0
  final String schedule;
  final String venueName;
  final String district;
  final double distanceKm;
  final int peopleCount;
  final String? eventId;

  const MapMarkerEntity({
    required this.id,
    required this.title,
    required this.type,
    required this.gameName,
    this.imageUrl,
    required this.latitude,
    required this.longitude,
    required this.xRatio,
    required this.yRatio,
    required this.schedule,
    required this.venueName,
    required this.district,
    required this.distanceKm,
    required this.peopleCount,
    this.eventId,
  });
}
