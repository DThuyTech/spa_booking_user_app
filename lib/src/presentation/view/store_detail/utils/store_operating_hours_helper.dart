import 'package:flutter/material.dart';
import '../../../../domain/entities/store/store_business_hour_enity.dart';

class StoreOperatingStatus {
  final bool isOpen;
  final String statusText;
  final String? nextTimeText;
  final Color badgeBg;
  final Color badgeTextColor;

  const StoreOperatingStatus({
    required this.isOpen,
    required this.statusText,
    this.nextTimeText,
    required this.badgeBg,
    required this.badgeTextColor,
  });
}

class StoreOperatingHoursHelper {
  const StoreOperatingHoursHelper._();

  static int? parseMinutes(String? timeStr) {
    if (timeStr == null || timeStr.trim().isEmpty) return null;
    final parts = timeStr.trim().split(':');
    if (parts.length < 2) return null;
    final h = int.tryParse(parts[0]);
    final m = int.tryParse(parts[1]);
    if (h == null || m == null) return null;
    return h * 60 + m;
  }

  static StoreBusinessHourEntity? findDay(
    List<StoreBusinessHourEntity> hours,
    int weekday, // 1 = Monday .. 7 = Sunday
  ) {
    for (final h in hours) {
      if (h.dayOfWeek == weekday || (weekday == 7 && h.dayOfWeek == 0)) {
        return h;
      }
    }
    return null;
  }

  static StoreOperatingStatus calculateStatus({
    required List<StoreBusinessHourEntity>? businessHours,
    required BuildContext context,
    DateTime? currentTime,
  }) {
    final isVi = Localizations.localeOf(context).languageCode == 'vi';
    final now = currentTime ?? DateTime.now();

    // Default if store hasn't configured business hours
    if (businessHours == null || businessHours.isEmpty) {
      return StoreOperatingStatus(
        isOpen: true,
        statusText: isVi ? 'Đang mở cửa' : 'Open now',
        badgeBg: const Color(0xFFE8F8F0),
        badgeTextColor: const Color(0xFF16A34A),
      );
    }

    final todayEntry = findDay(businessHours, now.weekday);

    if (todayEntry == null || !todayEntry.isOpen) {
      String? nextTime;
      for (var i = 1; i <= 7; i++) {
        final nextWeekday = ((now.weekday - 1 + i) % 7) + 1;
        final nextDayEntry = findDay(businessHours, nextWeekday);
        if (nextDayEntry != null &&
            nextDayEntry.isOpen &&
            nextDayEntry.timeRanges.isNotEmpty) {
          final openTime = nextDayEntry.timeRanges.first.startTime;
          nextTime = isVi
              ? 'Mở lại ${i == 1 ? "ngày mai" : nextDayEntry.dayName} lúc $openTime'
              : 'Opens ${i == 1 ? "tomorrow" : nextDayEntry.dayName} at $openTime';
          break;
        }
      }

      return StoreOperatingStatus(
        isOpen: false,
        statusText: isVi ? 'Đã đóng cửa' : 'Closed',
        nextTimeText: nextTime ?? (isVi ? 'Hôm nay nghỉ' : 'Closed today'),
        badgeBg: const Color(0xFFFEE2E2),
        badgeTextColor: const Color(0xFFDC2626),
      );
    }

    // Today is marked open
    if (todayEntry.timeRanges.isEmpty) {
      return StoreOperatingStatus(
        isOpen: true,
        statusText: isVi ? 'Đang mở cửa' : 'Open now',
        badgeBg: const Color(0xFFE8F8F0),
        badgeTextColor: const Color(0xFF16A34A),
      );
    }

    final currentMinutes = now.hour * 60 + now.minute;
    TimeRangesEntity? activeRange;
    TimeRangesEntity? upcomingRangeToday;

    for (final range in todayEntry.timeRanges) {
      final sMin = parseMinutes(range.startTime);
      final eMin = parseMinutes(range.endTime);
      if (sMin == null || eMin == null) continue;

      if (eMin > sMin) {
        if (currentMinutes >= sMin && currentMinutes < eMin) {
          activeRange = range;
          break;
        } else if (currentMinutes < sMin) {
          if (upcomingRangeToday == null ||
              sMin < (parseMinutes(upcomingRangeToday.startTime) ?? 9999)) {
            upcomingRangeToday = range;
          }
        }
      } else {
        // Overnight span e.g. 21:00 - 02:00
        if (currentMinutes >= sMin || currentMinutes < eMin) {
          activeRange = range;
          break;
        }
      }
    }

    if (activeRange != null) {
      return StoreOperatingStatus(
        isOpen: true,
        statusText: isVi ? 'Đang mở cửa' : 'Open now',
        nextTimeText: isVi
            ? 'Đóng cửa lúc ${activeRange.endTime}'
            : 'Closes at ${activeRange.endTime}',
        badgeBg: const Color(0xFFE8F8F0),
        badgeTextColor: const Color(0xFF16A34A),
      );
    }

    // Not in active range right now
    if (upcomingRangeToday != null) {
      return StoreOperatingStatus(
        isOpen: false,
        statusText: isVi ? 'Chưa mở cửa' : 'Opening soon',
        nextTimeText: isVi
            ? 'Mở cửa lúc ${upcomingRangeToday.startTime}'
            : 'Opens at ${upcomingRangeToday.startTime}',
        badgeBg: const Color(0xFFFEF3C7),
        badgeTextColor: const Color(0xFFD97706),
      );
    }

    // Closed for today after operating hours
    return StoreOperatingStatus(
      isOpen: false,
      statusText: isVi ? 'Đã đóng cửa' : 'Closed',
      nextTimeText: isVi ? 'Mở lại vào ngày mai' : 'Opens tomorrow',
      badgeBg: const Color(0xFFFEE2E2),
      badgeTextColor: const Color(0xFFDC2626),
    );
  }
}
