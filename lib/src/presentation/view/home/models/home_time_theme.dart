import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

enum TimeOfDayPeriod { morning, afternoon, evening, night }

class HomeTimeTheme {
  final TimeOfDayPeriod period;
  final String greetingText;
  final Color gradientTop;
  final Color baseColor;
  final Color waveColor;
  final Color accentColor;
  final IconData timeIcon;

  const HomeTimeTheme({
    required this.period,
    required this.greetingText,
    required this.gradientTop,
    required this.baseColor,
    required this.waveColor,
    required this.accentColor,
    required this.timeIcon,
  });

  factory HomeTimeTheme.now(BuildContext context) {
    final hour = DateTime.now().hour;
    final isVi = Localizations.localeOf(context).languageCode == 'vi';

    if (hour >= 5 && hour < 12) {
      // 5:00 - 11:59: Morning - Warm peach & sunrise coral
      return HomeTimeTheme(
        period: TimeOfDayPeriod.morning,
        greetingText: isVi ? 'Chào buổi sáng' : 'Good morning',
        gradientTop: const Color(0xFFFFF3F0),
        baseColor: const Color(0xFFFFECE7),
        waveColor: const Color(0xFFFFF6F3),
        accentColor: const Color(0xFFFC6E58),
        timeIcon: LucideIcons.sun_medium,
      );
    } else if (hour >= 12 && hour < 18) {
      // 12:00 - 17:59: Afternoon - Warm amber & golden apricot
      return HomeTimeTheme(
        period: TimeOfDayPeriod.afternoon,
        greetingText: isVi ? 'Chào buổi chiều' : 'Good afternoon',
        gradientTop: const Color(0xFFFFFBEB),
        baseColor: const Color(0xFFFFE7D1),
        waveColor: const Color(0xFFFFF7ED),
        accentColor: const Color(0xFFF97316),
        timeIcon: LucideIcons.sun,
      );
    } else if (hour >= 18 && hour < 22) {
      // 18:00 - 21:59: Evening - Twilight lavender & soft dusk
      return HomeTimeTheme(
        period: TimeOfDayPeriod.evening,
        greetingText: isVi ? 'Chào buổi tối' : 'Good evening',
        gradientTop: const Color(0xFFF5F3FF),
        baseColor: const Color(0xFFEDE9FE),
        waveColor: const Color(0xFFFAF5FF),
        accentColor: const Color(0xFF8B5CF6),
        timeIcon: LucideIcons.sunset,
      );
    } else {
      // 22:00 - 4:59: Night - Moonlit calm silver & dark slate
      return HomeTimeTheme(
        period: TimeOfDayPeriod.night,
        greetingText: isVi ? 'Chào buổi tối' : 'Good night',
        gradientTop: const Color(0xFFF8FAFC),
        baseColor: const Color(0xFFE2E8F0),
        waveColor: const Color(0xFFF1F5F9),
        accentColor: const Color(0xFF64748B),
        timeIcon: LucideIcons.moon,
      );
    }
  }
}
