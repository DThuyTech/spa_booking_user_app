import 'package:board_oi/src/core/localization/app_localizations.dart';
import 'package:board_oi/src/domain/entities/auth/user.dart';
import 'package:board_oi/src/shared/design_system/tokens/app_colors.dart';
import 'package:board_oi/src/shared/design_system/tokens/app_typography.dart';
import 'package:flutter/material.dart';

/// Clean, editorial greeting displaying customer greeting and calm beauty tagline.
class HomeGreeting extends StatelessWidget {
  final User? user;
  final String? subtitle;

  const HomeGreeting({super.key, this.user, this.subtitle});

  String _getTimeGreeting(BuildContext context) {
    final l10n = context.l10n;
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return l10n.goodMorning;
    } else if (hour < 18) {
      return l10n.goodAfternoon;
    } else {
      return l10n.goodEvening;
    }
  }

  @override
  Widget build(BuildContext context) {
    final timeGreeting = _getTimeGreeting(context);
    final displayName = user?.fullName.trim().isNotEmpty == true
        ? user!.fullName.trim().split(' ').last
        : null;

    final titleText = displayName != null
        ? '$timeGreeting $displayName'
        : timeGreeting.replaceAll(',', '');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          titleText,
          style: AppTypography.displayMedium.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.darkBrown,
            letterSpacing: -0.3,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          subtitle ?? 'Book your relaxing moment today',
          style: AppTypography.bodyMedium.copyWith(
            fontSize: 13.5,
            fontWeight: FontWeight.w400,
            color: AppColors.secondaryText,
            height: 1.4,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
