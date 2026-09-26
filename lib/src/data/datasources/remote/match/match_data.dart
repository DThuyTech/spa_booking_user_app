import 'package:board_oi/src/domain/entities/match/match_request.dart';

/// Seed data of realistic board-game match requests for Board Ơi.
abstract final class MockMatchData {
  static final List<MatchRequest> sampleRequests = [
    const MatchRequest(
      id: 'match-1',
      gameName: 'Catan',
      headline: 'Need 2 more players',
      schedule: 'Tonight · 19:30',
      venueName: 'The Guild Café',
      district: 'District 1',
      level: 'Intermediate',
      playStyle: 'Competitive',
      currentPlayers: ['Huy', 'Minh'],
      totalCapacity: 4,
      hostName: 'Huy Tran',
      description:
          'Looking for 2 experienced islanders for standard 4-player base game Catan. Friendly rivalry and fair trades encouraged!',
    ),
    const MatchRequest(
      id: 'match-2',
      gameName: 'Coup & Avalon',
      headline: 'Social bluffing party',
      schedule: 'Sat · 18:00',
      venueName: 'Board Game Station',
      district: 'Phú Nhuận',
      level: 'Beginner friendly',
      playStyle: 'Casual Social',
      currentPlayers: ['An', 'Chi', 'Long', 'Linh'],
      totalCapacity: 8,
      hostName: 'An Nguyen',
      description:
          'Relaxed evening of deduction, bluffing, and laughter. Beginners will be taught the rules in 5 minutes!',
    ),
    const MatchRequest(
      id: 'match-3',
      gameName: 'Azul: Summer Pavilion',
      headline: 'Need 1 tile artisan',
      schedule: 'Sun · 14:00',
      venueName: 'Meeple Coffee Hub',
      district: 'District 3',
      level: 'All levels',
      playStyle: 'Casual',
      currentPlayers: ['Khoa', 'Mai', 'Thao'],
      totalCapacity: 4,
      hostName: 'Khoa Vo',
      description:
          'Beautiful tile drafting session. Perfect Sunday afternoon chill vibe with great specialty espresso.',
    ),
    const MatchRequest(
      id: 'match-4',
      gameName: 'Wingspan',
      headline: 'Need 2 birdwatchers',
      schedule: 'Tomorrow · 15:00',
      venueName: 'The Guild Café',
      district: 'District 1',
      level: 'Intermediate',
      playStyle: 'Strategy',
      currentPlayers: ['Hoang', 'Vy'],
      totalCapacity: 4,
      hostName: 'Hoang Le',
      description:
          'Engine building and bird conservation. European expansion included if everyone agrees.',
    ),
    const MatchRequest(
      id: 'match-5',
      gameName: 'Splendor Duel & Duel 7 Wonders',
      headline: 'Need 1 rival strategist',
      schedule: 'Tonight · 20:00',
      venueName: 'Dice & Drink Corner',
      district: 'District 7',
      level: 'Advanced',
      playStyle: 'Ranked Match',
      currentPlayers: ['Duc'],
      totalCapacity: 2,
      hostName: 'Duc Pham',
      description:
          'Intense 2-player tactical showdown. Warmup with Splendor Duel then best of 3 7 Wonders Duel.',
    ),
  ];
}
