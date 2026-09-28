import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'insights_sparkline_chart.dart';

class InsightsSpendingChartCard extends StatelessWidget {
  final List<double> values;
  final List<String> labels;
  final String totalDisplay;

  const InsightsSpendingChartCard({
    super.key,
    required this.values,
    required this.labels,
    this.totalDisplay = 'Total: ₫1,250,000',
  });

  static const Color _tealColor = Color(0xFF2C6975);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with Wallet Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'My Spending',
                    style: TextStyle(
                      fontSize: 16.5,
                      fontWeight: FontWeight.w800,
                      color: _textDark,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    totalDisplay,
                    style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: _textMuted,
                    ),
                  ),
                ],
              ),
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: Color(0xFFE2F1F3),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  LucideIcons.wallet,
                  size: 18,
                  color: _tealColor,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // Spending Chart with Teal Line
          InsightsSparklineChart(
            values: values,
            labels: labels,
            lineColor: _tealColor,
          ),
        ],
      ),
    );
  }
}
