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
}
