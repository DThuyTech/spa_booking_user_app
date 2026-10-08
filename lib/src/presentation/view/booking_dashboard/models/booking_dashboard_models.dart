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
