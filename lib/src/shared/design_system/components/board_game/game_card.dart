import 'package:flutter/material.dart';
import '../../tokens/app_colors.dart';
import '../../tokens/app_motion.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_shadows.dart';
import '../../tokens/app_spacing.dart';
import '../../tokens/app_typography.dart';
import '../games/default_game_visual.dart';
import '../games/game_artwork_catalog.dart';

/// Reusable Game Card for Popular Games and Catalog discovery.
/// Uses prominent game artwork per Section 2 & 3 of UI/UX Refinement.
class GameCard extends StatefulWidget {
  final String title;
  final String playerRange; // e.g. "3–4 players"
  final String duration; // e.g. "60–90 min"
  final String difficulty; // e.g. "Intermediate"
  final double rating; // e.g. 4.8
  final int openTablesCount; // e.g. 14
  final String? imageUrl;
  final Color themeColor;
  final VoidCallback? onTap;

  const GameCard({
    super.key,
    required this.title,
    required this.playerRange,
    required this.duration,
    required this.difficulty,
    this.rating = 4.8,
    this.openTablesCount = 0,
    this.imageUrl,
    this.themeColor = AppColors.primaryBrown,
    this.onTap,
  });

  @override
  State<GameCard> createState() => _GameCardState();
}

class _GameCardState extends State<GameCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pressController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _pressController = AnimationController(
      vsync: this,
      duration: AppMotion.durationFast,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: AppMotion.scalePressed,
    ).animate(
      CurvedAnimation(
        parent: _pressController,
        curve: AppMotion.curveStandard,
      ),
    );
  }

  @override
  void dispose() {
    _pressController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails _) {
    if (widget.onTap != null) _pressController.forward();
  }

  void _onTapUp(TapUpDetails _) {
    if (widget.onTap != null) _pressController.reverse();
  }

  void _onTapCancel() {
    if (widget.onTap != null) _pressController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final catalog = GameArtworkCatalog.findByGameName(widget.title);
    final resolvedImage = widget.imageUrl ?? catalog?.coverUrl;

    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        width: 170,
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
            onTap: widget.onTap,
            onTapDown: _onTapDown,
            onTapUp: _onTapUp,
            onTapCancel: _onTapCancel,
            borderRadius: AppRadius.borderCard,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Artwork / Header Banner
                SizedBox(
                  height: 110,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      if (resolvedImage != null && resolvedImage.isNotEmpty)
                        Image.network(
                          resolvedImage,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              DefaultGameVisual(
                            title: widget.title,
                            compact: true,
                          ),
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return DefaultGameVisual(
                              title: widget.title,
                              compact: true,
                            );
                          },
                        )
                      else
                        DefaultGameVisual(title: widget.title, compact: true),

                      // Subtle top & bottom gradient
                      Positioned.fill(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: const [0.0, 0.4, 1.0],
                              colors: [
                                AppColors.darkBrown.withValues(alpha: 0.3),
                                Colors.transparent,
                                AppColors.darkBrown.withValues(alpha: 0.6),
                              ],
                            ),
                          ),
                        ),
                      ),

                      if (widget.openTablesCount > 0)
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.surface.withValues(alpha: 0.95),
                              borderRadius:
                                  BorderRadius.circular(AppRadius.full),
                              boxShadow: AppShadows.card,
                            ),
                            child: Text(
                              '${widget.openTablesCount} tables',
                              style: AppTypography.labelSmall.copyWith(
                                color: AppColors.accent,
                                fontWeight: FontWeight.bold,
                                fontSize: 9,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                // Game Info Body
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: AppTypography.editorialGameName.copyWith(
                          color: AppColors.darkText,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        '${widget.playerRange} · ${widget.duration}',
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.secondaryText,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.difficulty,
                            style: AppTypography.labelSmall.copyWith(
                              color: AppColors.primaryBrown,
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                size: 13,
                                color: Color(0xFFE5A038),
                              ),
                              const SizedBox(width: 2),
                              Text(
                                widget.rating.toStringAsFixed(1),
                                style: AppTypography.labelSmall.copyWith(
                                  color: AppColors.darkText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ],
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
