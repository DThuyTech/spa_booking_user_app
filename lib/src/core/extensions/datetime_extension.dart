import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String toVietnameseDate() {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String toVietnameseTime() {
    return DateFormat('HH:mm').format(this);
  }

  String toFullVietnameseString() {
    return DateFormat('HH:mm - dd/MM/yyyy').format(this);
  }

  /// Formats date as 'MMM d, yyyy' (e.g. "Dec 10, 2024")
  String toMonthDayYear() {
    return DateFormat('MMM d, yyyy').format(this);
  }

  /// Formats date as 'MMM d, yyyy' (alias for review date format)
  String toReviewDateFormat() {
    return DateFormat('MMM d, yyyy').format(this);
  }

  String formatTimeAgo() {
    final diff = DateTime.now().difference(this);
    if (diff.inDays > 365) {
      return '${(diff.inDays / 365).floor()}y ago';
    } else if (diff.inDays > 30) {
      return '${(diff.inDays / 30).floor()}mo ago';
    } else if (diff.inDays > 0) {
      return '${diff.inDays}d ago';
    } else if (diff.inHours > 0) {
      return '${diff.inHours}h ago';
    } else if (diff.inMinutes > 0) {
      return '${diff.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
