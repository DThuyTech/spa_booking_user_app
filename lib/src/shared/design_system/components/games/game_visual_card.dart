import 'package:flutter/material.dart';
import '../../tokens/app_colors.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_shadows.dart';
import '../../tokens/app_typography.dart';
import 'default_game_visual.dart';
import 'game_artwork_catalog.dart';

/// Reusable Game Visual Card implementing Section 3 of UI/UX Refinement:
/// - 4:5 / 3:4 aspect ratio
/// - Prominent game artwork
/// - Subtle bottom readability gradient (artwork stays clearly visible)
/// - Title, player count, duration
class GameVisualCard extends StatelessWidget {
  final String gameName;
  final String? imageUrl;
  final String? playerCount;
  final String? playTime;
  final String? tag;
  final VoidCallback? onTap;
  final double width;
  final double aspectRatio;

  const GameVisualCard({
    super.key,
    required this.gameName,
    this.imageUrl,
    this.playerCount,
    this.playTime,
    this.tag,
    this.onTap,
    this.width = 170,
    this.aspectRatio = 3 / 4,
  });

  @override
  Widget build(BuildContext context) {
    final meta = GameArtworkCatalog.findByGameName(gameName);
    final resolvedImage = imageUrl ?? meta?.coverUrl;
    final resolvedPlayers = playerCount ?? meta?.playerCount ?? '2–4 players';
    final resolvedTime = playTime ?? meta?.playTime ?? '45 min';
    final resolvedTag = tag ?? meta?.complexity;

    return Container(
      width: width,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.borderCard,
        border: Border.all(color: AppColors.border, width: 1),
        boxShadow: AppShadows.card,
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppRadius.borderCard,
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // 1. Artwork layer with intelligent fallback
                if (resolvedImage != null && resolvedImage.isNotEmpty)
                  Image.network(
                    resolvedImage,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        DefaultGameVisual(title: gameName),
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return DefaultGameVisual(title: gameName, compact: true);
                    },
                  )
                else
                  DefaultGameVisual(title: gameName),

                // 2. Subtle gradient overlay ONLY at bottom (Section 3 & 29)
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.50, 0.78, 1.0],
                        colors: [
                          Colors.transparent,
                          AppColors.darkBrown.withValues(alpha: 0.45),
                          AppColors.darkBrown.withValues(alpha: 0.85),
                        ],
                      ),
                    ),
                  ),
                ),

                // 3. Top tag chip (optional)
                if (resolvedTag != null)
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surface.withValues(alpha: 0.92),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.darkBrown.withValues(alpha: 0.08),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Text(
                        resolvedTag,
                        style: AppTypography.labelSmall.copyWith(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryBrown,
                        ),
                      ),
                    ),
                  ),

                // 4. Bottom Info: Title & Meta Info
                Positioned(
                  left: 12,
                  right: 12,
                  bottom: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        gameName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.titleMedium.copyWith(
                          fontFamily: 'Playfair Display',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                          shadows: const [
                            Shadow(
                              color: Color(0x66000000),
                              offset: Offset(0, 1),
                              blurRadius: 3,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '$resolvedPlayers · $resolvedTime',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTypography.bodySmall.copyWith(
                                color: AppColors.warmBeige,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
