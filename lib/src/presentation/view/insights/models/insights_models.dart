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
