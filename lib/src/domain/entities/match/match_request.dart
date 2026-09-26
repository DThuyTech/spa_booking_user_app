/// Domain entity representing an open board-game match request.
class MatchRequest {
  final String id;
  final String gameName;
  final String headline; // e.g. "Need 2 more players"
  final String schedule; // e.g. "Sat · 19:00"
  final String venueName; // e.g. "The Guild Café"
  final String district; // e.g. "District 1"
  final String level; // e.g. "Intermediate"
  final String playStyle; // e.g. "Competitive" or "Casual"
  final List<String> currentPlayers;
  final int totalCapacity;
  final String hostName;
  final String description;
  final bool isUserJoined;

  const MatchRequest({
    required this.id,
    required this.gameName,
    required this.headline,
    required this.schedule,
    required this.venueName,
    required this.district,
    required this.level,
    required this.playStyle,
    required this.currentPlayers,
    this.totalCapacity = 4,
    required this.hostName,
    required this.description,
    this.isUserJoined = false,
  });

  int get spotsRemaining => totalCapacity - currentPlayers.length;

  MatchRequest copyWith({
    String? id,
    String? gameName,
    String? headline,
    String? schedule,
    String? venueName,
    String? district,
    String? level,
    String? playStyle,
    List<String>? currentPlayers,
    int? totalCapacity,
    String? hostName,
    String? description,
    bool? isUserJoined,
  }) {
    return MatchRequest(
      id: id ?? this.id,
      gameName: gameName ?? this.gameName,
      headline: headline ?? this.headline,
      schedule: schedule ?? this.schedule,
      venueName: venueName ?? this.venueName,
      district: district ?? this.district,
      level: level ?? this.level,
      playStyle: playStyle ?? this.playStyle,
      currentPlayers: currentPlayers ?? this.currentPlayers,
      totalCapacity: totalCapacity ?? this.totalCapacity,
      hostName: hostName ?? this.hostName,
      description: description ?? this.description,
      isUserJoined: isUserJoined ?? this.isUserJoined,
    );
  }
}
