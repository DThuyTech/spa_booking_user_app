import 'package:flutter/material.dart';
import '../../../../core/localization/app_localizations.dart';

class ProfileStatsRow extends StatelessWidget {
  final int upcomingCount;
  final int completedCount;
  final int cancelledCount;
  final VoidCallback? onUpcomingTap;
  final VoidCallback? onCompletedTap;
  final VoidCallback? onCancelledTap;

  const ProfileStatsRow({
    super.key,
    this.upcomingCount = 2,
    this.completedCount = 12,
    this.cancelledCount = 1,
    this.onUpcomingTap,
    this.onCompletedTap,
    this.onCancelledTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            value: upcomingCount.toString(),
            label: l10n.upcomingTab.toUpperCase(),
            valueColor: const Color(0xFFBA4A32),
            onTap: onUpcomingTap,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            value: completedCount.toString(),
            label: l10n.completedTab.toUpperCase(),
            valueColor: const Color(0xFF1E5B6E),
            onTap: onCompletedTap,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            value: cancelledCount.toString(),
            label: l10n.cancelledTab.toUpperCase(),
            valueColor: const Color(0xFFBA4A32),
            onTap: onCancelledTap,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final Color valueColor;
  final VoidCallback? onTap;

  const _StatCard({
    required this.value,
    required this.label,
    required this.valueColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFF0EBE6), width: 1.2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: valueColor,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.6,
                  color: Color(0xFF7A6F68),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
