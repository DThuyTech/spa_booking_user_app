import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../mockup_data/store_detail_mock_data.dart';

class StoreOpeningHoursCard extends StatefulWidget {
  final StoreOpeningHoursItem openingHours;

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF71717A);

  const StoreOpeningHoursCard({super.key, required this.openingHours});

  @override
  State<StoreOpeningHoursCard> createState() => _StoreOpeningHoursCardState();
}

class _StoreOpeningHoursCardState extends State<StoreOpeningHoursCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with expand toggle
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Opening Hours',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: StoreOpeningHoursCard._textDark,
                    letterSpacing: -0.2,
                  ),
                ),
                AnimatedRotation(
                  turns: _isExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(
                    LucideIcons.chevron_down,
                    size: 20,
                    color: StoreOpeningHoursCard._textMuted,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Today status row
          Row(
            children: [
              const Icon(
                LucideIcons.clock,
                size: 16,
                color: StoreOpeningHoursCard._coralColor,
              ),
              const SizedBox(width: 8),
              Text(
                widget.openingHours.todayHours,
                style: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w500,
                  color: StoreOpeningHoursCard._textDark,
                ),
              ),
            ],
          ),

          // Expanded weekly schedule
          if (_isExpanded) ...[
            const SizedBox(height: 14),
            const Divider(color: Color(0xFFF1F5F9), height: 1),
            const SizedBox(height: 12),
            ...widget.openingHours.weeklySchedule.entries.map((entry) {
              final isToday =
                  entry.key == 'Today' || entry.key == _getCurrentDayOfWeek();
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      entry.key,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: isToday ? FontWeight.w700 : FontWeight.w500,
                        color: isToday
                            ? StoreOpeningHoursCard._coralColor
                            : StoreOpeningHoursCard._textDark,
                      ),
                    ),
                    Text(
                      entry.value,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: isToday ? FontWeight.w600 : FontWeight.w400,
                        color: isToday
                            ? StoreOpeningHoursCard._coralColor
                            : StoreOpeningHoursCard._textMuted,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ],
      ),
    );
  }

  String _getCurrentDayOfWeek() {
    final now = DateTime.now();
    switch (now.weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }
}
