import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'insights_sparkline_chart.dart';

class InsightsActivityChartCard extends StatelessWidget {
  final List<double> values;
  final List<String> labels;
  final String subtitle;

  const InsightsActivityChartCard({
    super.key,
    required this.values,
    required this.labels,
    this.subtitle = 'You booked 4 times this month',
  });

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Coral top border line (matching Image 3)
          Container(height: 4, width: double.infinity, color: _coralColor),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with Calendar Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Booking Activity',
                          style: TextStyle(
                            fontSize: 16.5,
                            fontWeight: FontWeight.w800,
                            color: _textDark,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w400,
                            color: _textMuted,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFECE8),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        LucideIcons.calendar,
                        size: 18,
                        color: _coralColor,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                // Chart
                InsightsSparklineChart(
                  values: values,
                  labels: labels,
                  lineColor: _coralColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
