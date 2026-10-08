class BookingDashboardItem {
  final String id;
  final String title;
  final String time;
  final String amPm;
  final String? storeName;
  final String? timeRange;
  final String? duration;
  final String? staffName;
  final String status;
  final bool isHighlighted;

  const BookingDashboardItem({
    required this.id,
    required this.title,
    required this.time,
    required this.amPm,
    this.storeName,
    this.timeRange,
    this.duration,
    this.staffName,
    this.status = 'CONFIRMED',
    this.isHighlighted = false,
  });
}

class BookingDashboardGroup {
  final String dateHeader;
  final List<BookingDashboardItem> items;

  const BookingDashboardGroup({required this.dateHeader, required this.items});
}

class BookingDashboardMockData {
  const BookingDashboardMockData._();

  static const int upcomingCount = 2;
  static const int allCount = 16;
  static const int pastCount = 12;
  static const int cancelledCount = 2;
  static const int todayCount = 1;
  static const int completedCount = 12;

  static const List<BookingDashboardGroup> groups = [
    BookingDashboardGroup(
      dateHeader: 'TODAY',
      items: [
        BookingDashboardItem(
          id: 'BK-TODAY-01',
          title: 'Haircut, Dried',
          time: '10:00',
          amPm: 'AM',
          storeName: 'Aurora Store',
          timeRange: '10:00 - 14:00',
          status: 'CONFIRMED',
          isHighlighted: true,
        ),
        BookingDashboardItem(
          id: 'BK-TODAY-02',
          title: 'Haircut',
          time: '10:00',
          amPm: 'AM',
          duration: '30 min',
          staffName: 'Staff: Sarah',
          status: 'CONFIRMED',
          isHighlighted: false,
        ),
      ],
    ),
    BookingDashboardGroup(
      dateHeader: 'AUG 28',
      items: [
        BookingDashboardItem(
          id: 'BK-AUG28-01',
          title: 'Hair Coloring',
          time: '02:30',
          amPm: 'PM',
          duration: '90 min',
          staffName: 'Staff: Elena',
          status: 'CONFIRMED',
          isHighlighted: false,
        ),
      ],
    ),
  ];
}
