class FavoriteServiceItem {
  final String name;
  final String lastBooked;
  final int bookingsCount;
  final String iconType; // 'scissors', 'palette', 'smile'

  const FavoriteServiceItem({
    required this.name,
    required this.lastBooked,
    required this.bookingsCount,
    required this.iconType,
  });
}

class InsightsTipItem {
  final String title;
  final String message;
  final bool isSpendingTrend;

  const InsightsTipItem({
    required this.title,
    required this.message,
    this.isSpendingTrend = false,
  });
}

class MyInsightsMockData {
  const MyInsightsMockData._();

  static const int currentMonthBookings = 4;
  static const String bookingsDiff = '+2 vs last month';
  static const String spentDisplay = '₫1,250,000';

  static const List<String> chartMonths = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
  ];

  static const List<double> bookingActivityPoints = [
    2.0,
    1.2,
    3.0,
    2.0,
    4.0,
    3.4,
    4.8,
  ];

  static const List<double> spendingPoints = [
    300000,
    200000,
    450000,
    380000,
    700000,
    580000,
    950000,
  ];

  static const int totalVisitsYear = 18;
  static const String visitCadence =
      'You usually visit every 24 days. Time for a touch-up?';

  static const String favoriteSalonName = 'Beauty House';
  static const String favoriteSalonStats = '8 visits (62% of bookings)';

  static const String usualVisitDay = 'Saturday';
  static const String usualVisitTime = '5 PM – 7 PM';

  static const List<FavoriteServiceItem> favoriteServices = [
    FavoriteServiceItem(
      name: 'Haircut',
      lastBooked: 'Last booked: 2 weeks ago',
      bookingsCount: 12,
      iconType: 'scissors',
    ),
    FavoriteServiceItem(
      name: 'Hair Color',
      lastBooked: 'Last booked: 2 months ago',
      bookingsCount: 4,
      iconType: 'palette',
    ),
    FavoriteServiceItem(
      name: 'Facial',
      lastBooked: 'Last booked: 4 months ago',
      bookingsCount: 2,
      iconType: 'smile',
    ),
  ];

  static const List<InsightsTipItem> tips = [
    InsightsTipItem(
      title: 'Top Service',
      message:
          'Haircut is your most booked service. Want to try a new stylist?',
      isSpendingTrend: false,
    ),
    InsightsTipItem(
      title: 'Spending Trend',
      message: 'You spent 18% more this month compared to your average.',
      isSpendingTrend: true,
    ),
  ];
}
