import 'package:flutter/material.dart';
import '../../tokens/app_colors.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_shadows.dart';
import '../../tokens/app_spacing.dart';
import '../../tokens/app_typography.dart';
import '../buttons/app_button.dart';
import 'avatar_stack.dart';

/// Interactive match status & check-in hero card.
class MatchStatusCard extends StatelessWidget {
  final String gameName;
  final String schedule;
  final String venueName;
  final String tableNumber;
  final bool isCheckedIn;
  final List<String> players;
  final int totalCapacity;
  final VoidCallback? onCheckInTap;
  final VoidCallback? onViewDetailsTap;

  const MatchStatusCard({
    super.key,
    required this.gameName,
    required this.schedule,
    required this.venueName,
    required this.tableNumber,
    this.isCheckedIn = false,
    required this.players,
    this.totalCapacity = 4,
    this.onCheckInTap,
    this.onViewDetailsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.borderCard,
        border: Border.all(
          color: isCheckedIn ? AppColors.success : AppColors.border,
          width: isCheckedIn ? 1.5 : 1.0,
        ),
        boxShadow: AppShadows.floating,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text('🎲', style: TextStyle(fontSize: 20)),
                  const SizedBox(width: 8),
                  Text(
                    isCheckedIn ? "You're checked in ✓" : "You're in!",
                    style: AppTypography.titleMedium.copyWith(
                      color: isCheckedIn
                          ? AppColors.success
                          : AppColors.darkText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: isCheckedIn
                      ? AppColors.successLight
                      : AppColors.accentLight,
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
                child: Text(
                  isCheckedIn ? 'Ready to play' : 'Check-in open',
                  style: AppTypography.labelSmall.copyWith(
                    color: isCheckedIn ? AppColors.success : AppColors.accent,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            '$gameName · $schedule',
            style: AppTypography.editorialGameName.copyWith(
              color: AppColors.darkText,
              fontSize: 19,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '$venueName · $tableNumber',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.secondaryText,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AvatarStack(avatars: players, totalCapacity: totalCapacity),
              if (!isCheckedIn)
                AppButton(
                  text: 'Check in',
                  size: AppButtonSize.sm,
                  onPressed: onCheckInTap,
                )
              else
                AppButton(
                  text: 'View table',
                  size: AppButtonSize.sm,
                  variant: AppButtonVariant.outline,
                  onPressed: onViewDetailsTap,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
