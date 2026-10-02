import 'package:spa_booking/src/domain/entities/event/event_entity.dart';

/// Seed data of realistic Board Ơi community events.
abstract final class MockEventData {
  static final List<EventEntity> sampleEvents = [
    const EventEntity(
      id: 'event-catan-night',
      title: 'Catan Community Night',
      description:
          'Join our signature weekend Catan gathering! Whether you are an experienced sheep trader or a rookie explorer, tables will be organized by skill level with friendly hosts on hand.',
      gameName: 'Catan',
      imageUrl:
          'https://images.unsplash.com/photo-1610890716171-6b1bb98ffd09?w=1200&auto=format&fit=crop&q=80',
      scheduleDate: 'Saturday · 28 September',
      scheduleTime: '19:00 – 22:00',
      venueName: 'The Guild Café',
      district: 'District 1',
      address: '148 Pasteur, Bến Nghé, District 1',
      latitude: 10.7769,
      longitude: 106.7009,
      participantCount: 24,
      maxCapacity: 32,
      eventType: 'Social Night',
      organizerName: 'The Guild Host Team',
      organizerAvatar:
          'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=120',
      isUserJoined: false,
      price: 'Free entry',
    ),
    const EventEntity(
      id: 'event-wingspan-sunday',
      title: 'Wingspan Sunday Birdwatchers',
      description:
          'Relaxed Sunday afternoon session dedicated to Wingspan and engine-building lovers. Oceanian and European expansions available at all tables.',
      gameName: 'Wingspan',
      imageUrl:
          'https://images.unsplash.com/photo-1516541196182-6bdb0516ed27?w=1200&auto=format&fit=crop&q=80',
      scheduleDate: 'Sunday · 29 September',
      scheduleTime: '14:00 – 17:30',
      venueName: 'Meeple Coffee Hub',
      district: 'District 3',
      address: '228 Nam Kỳ Khởi Nghĩa, District 3',
      latitude: 10.7850,
      longitude: 106.6890,
      participantCount: 14,
      maxCapacity: 20,
      eventType: 'Beginner Meetup',
      organizerName: 'Hương Mai',
      organizerAvatar:
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=120',
      isUserJoined: true,
      price: 'Drink ticket (45,000đ)',
    ),
    const EventEntity(
      id: 'event-coup-avalon-party',
      title: 'Social Deduction & Bluffing Gala',
      description:
          'A night of deception, accusations, and loud laughter. Featuring Coup, Avalon, Secret Hitler, and Blood on the Clocktower.',
      gameName: 'Coup & Avalon',
      imageUrl:
          'https://images.unsplash.com/photo-1563089145-599997674d42?w=1200&auto=format&fit=crop&q=80',
      scheduleDate: 'Friday · 04 October',
      scheduleTime: '18:30 – 22:00',
      venueName: 'Board Game Station',
      district: 'Phú Nhuận',
      address: '12 Hoa Đào, Ward 2, Phú Nhuận',
      latitude: 10.7980,
      longitude: 106.6920,
      participantCount: 30,
      maxCapacity: 40,
      eventType: 'Social Night',
      organizerName: 'An Nguyen',
      organizerAvatar:
          'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?w=120',
      isUserJoined: false,
      price: 'Free',
    ),
    const EventEntity(
      id: 'event-azul-tournament',
      title: 'Azul Autumn Grand Tournament',
      description:
          'Official monthly Swiss-bracket tournament with official Board Ơi trophy and custom resin player boards for the top 3 finalists!',
      gameName: 'Azul: Summer Pavilion',
      imageUrl:
          'https://images.unsplash.com/photo-1606167668584-78701c57f13d?w=1200&auto=format&fit=crop&q=80',
      scheduleDate: 'Saturday · 05 October',
      scheduleTime: '13:00 – 18:00',
      venueName: 'Dice & Drink Corner',
      district: 'District 7',
      address: '88 Nguyễn Thị Thập, Tân Phú, District 7',
      latitude: 10.7380,
      longitude: 106.7210,
      participantCount: 16,
      maxCapacity: 16,
      eventType: 'Tournament',
      organizerName: 'Championship Committee',
      organizerAvatar:
          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=120',
      isUserJoined: false,
      price: 'Entry 80,000đ',
    ),
  ];
}
