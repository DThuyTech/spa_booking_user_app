import 'package:flutter/material.dart';
import '../../tokens/app_colors.dart';
import '../../tokens/app_typography.dart';
import '../avatars/app_avatar.dart';

/// Overlapping avatar stack showing active players and remaining open spots.
class AvatarStack extends StatelessWidget {
  final List<String> avatars;
  final int totalCapacity;
  final double size;
  final double overlapOffset;
  final bool showLabel;

  const AvatarStack({
    super.key,
    required this.avatars,
    this.totalCapacity = 4,
    this.size = 28,
    this.overlapOffset = 18,
    this.showLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    final filledCount = avatars.length;
    final remainingSpots = totalCapacity - filledCount;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: size,
          width: filledCount > 0
              ? size + (filledCount - 1) * overlapOffset
              : size,
          child: Stack(
            children: [
              for (int i = 0; i < filledCount; i++)
                Positioned(
                  left: i * overlapOffset,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.white, width: 2),
                    ),
                    child: AppAvatar(
                      name: avatars[i],
                      size: AppAvatarSize.sm,
                      imageUrl: avatars[i].startsWith('http')
                          ? avatars[i]
                          : null,
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (showLabel) ...[
          const SizedBox(width: 8),
          if (remainingSpots > 0)
            Text(
              '$remainingSpots spots left',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.accent,
                fontWeight: FontWeight.w600,
              ),
            )
          else
            Text(
              'Table full',
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.secondaryText,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ],
    );
  }
}
