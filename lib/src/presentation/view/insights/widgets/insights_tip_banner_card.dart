import '../models/insights_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class InsightsTipBannerCard extends StatelessWidget {
  final InsightsTipItem item;

  const InsightsTipBannerCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final bool isTrend = item.isSpendingTrend;
    final Color bgColor = isTrend
        ? const Color(0xFFFDF0ED)
        : const Color(0xFFE6F5FC);
    final Color iconColor = isTrend
        ? const Color(0xFFE05243)
        : const Color(0xFF0284C7);
    final IconData icon = isTrend
        ? LucideIcons.trending_up
        : LucideIcons.lightbulb;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(icon, size: 20, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  item.message,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF475569),
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
