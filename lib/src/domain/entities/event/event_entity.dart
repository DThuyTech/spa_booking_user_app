/// Domain entity representing a structured Board Ơi community event.
class EventEntity {
  final String id;
  final String title;
  final String description;
  final String gameName;
  final String? imageUrl;
  final String scheduleDate; // e.g. "Saturday · 28 September"
  final String scheduleTime; // e.g. "19:00 – 22:00"
  final String venueName; // e.g. "The Guild Café"
  final String district; // e.g. "District 1"
  final String address; // e.g. "148 Pasteur, Bến Nghé, District 1"
  final double latitude;
  final double longitude;
  final int participantCount;
  final int maxCapacity;
  final String
  eventType; // "Tournament", "Social Night", "Beginner Night", "Weekly Meetup"
  final String organizerName;
  final String? organizerAvatar;
  final bool isUserJoined;
  final String price; // "Free" or e.g. "50,000đ"

  const EventEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.gameName,
    this.imageUrl,
    required this.scheduleDate,
    required this.scheduleTime,
    required this.venueName,
    required this.district,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.participantCount,
    required this.maxCapacity,
    required this.eventType,
    required this.organizerName,
    this.organizerAvatar,
    this.isUserJoined = false,
    this.price = 'Free',
  });

  EventEntity copyWith({
    String? id,
    String? title,
    String? description,
    String? gameName,
    String? imageUrl,
    String? scheduleDate,
    String? scheduleTime,
    String? venueName,
    String? district,
    String? address,
    double? latitude,
    double? longitude,
    int? participantCount,
    int? maxCapacity,
    String? eventType,
    String? organizerName,
    String? organizerAvatar,
    bool? isUserJoined,
    String? price,
  }) {
    return EventEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      gameName: gameName ?? this.gameName,
      imageUrl: imageUrl ?? this.imageUrl,
      scheduleDate: scheduleDate ?? this.scheduleDate,
      scheduleTime: scheduleTime ?? this.scheduleTime,
      venueName: venueName ?? this.venueName,
      district: district ?? this.district,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      participantCount: participantCount ?? this.participantCount,
      maxCapacity: maxCapacity ?? this.maxCapacity,
      eventType: eventType ?? this.eventType,
      organizerName: organizerName ?? this.organizerName,
      organizerAvatar: organizerAvatar ?? this.organizerAvatar,
      isUserJoined: isUserJoined ?? this.isUserJoined,
      price: price ?? this.price,
    );
  }
}
