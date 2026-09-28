import 'package:flutter/material.dart';
import '../../tokens/app_colors.dart';
import '../../tokens/app_motion.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_shadows.dart';
import '../../tokens/app_spacing.dart';
import '../../tokens/app_typography.dart';
import '../buttons/app_button.dart';
import '../games/default_game_visual.dart';
import '../games/game_artwork_catalog.dart';
import 'avatar_stack.dart';

/// Refined Match Request Card implementing Section 5 of UI/UX Refinement:
/// - Prominent Game Artwork Header
/// - Immediate communication: GAME, WHO, WHEN, WHERE, SPOTS
/// - AvatarStack & spots remaining
/// - Direct "Request to join" CTA
class MatchRequestCard extends StatefulWidget {
  final String gameName;
  final String headline; // e.g. "Need 2 more players"
  final String schedule; // e.g. "Sat · 19:00"
  final String location; // e.g. "District 1 · Meeple Café"
  final String level; // e.g. "Intermediate"
  final String playStyle; // e.g. "Competitive" or "Casual"
  final List<String> currentPlayers;
  final int totalCapacity;
  final String? bannerImageUrl;
  final Color? gameAccentColor;
  final VoidCallback? onJoinTap;
  final VoidCallback? onCardTap;

  const MatchRequestCard({
    super.key,
    required this.gameName,
    required this.headline,
    required this.schedule,
    required this.location,
    required this.level,
    required this.playStyle,
    required this.currentPlayers,
    this.totalCapacity = 4,
    this.bannerImageUrl,
    this.gameAccentColor,
    this.onJoinTap,
    this.onCardTap,
  });

  int get spotsRemaining => totalCapacity - currentPlayers.length;

  @override
  State<MatchRequestCard> createState() => _MatchRequestCardState();
}

class _MatchRequestCardState extends State<MatchRequestCard>
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
    _scaleAnimation = Tween<double>(begin: 1.0, end: AppMotion.scalePressed)
        .animate(
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
    if (widget.onCardTap != null) _pressController.forward();
  }

  void _onTapUp(TapUpDetails _) {
    if (widget.onCardTap != null) _pressController.reverse();
  }

  void _onTapCancel() {
    if (widget.onCardTap != null) _pressController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    // Resolve artwork from catalog if not provided
    final catalogData = GameArtworkCatalog.findByGameName(widget.gameName);
    final resolvedImage = widget.bannerImageUrl ?? catalogData?.coverUrl;

    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
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
            onTap: widget.onCardTap,
            onTapDown: _onTapDown,
            onTapUp: _onTapUp,
            onTapCancel: _onTapCancel,
            borderRadius: AppRadius.borderCard,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Prominent Game Artwork Banner (Section 5)
                SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      if (resolvedImage != null && resolvedImage.isNotEmpty)
                        Image.network(
                          resolvedImage,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              DefaultGameVisual(title: widget.gameName),
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return DefaultGameVisual(
                              title: widget.gameName,
                              compact: true,
                            );
                          },
                        )
                      else
                        DefaultGameVisual(title: widget.gameName),

                      // Subtle top & bottom shadow gradient for contrast
                      Positioned.fill(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: const [0.0, 0.4, 1.0],
                              colors: [
                                AppColors.darkBrown.withValues(alpha: 0.35),
                                Colors.transparent,
                                AppColors.darkBrown.withValues(alpha: 0.55),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Top Left: Game Name in Playfair Display
                      Positioned(
                        top: 12,
                        left: 14,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.surface.withValues(alpha: 0.94),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.darkBrown.withValues(
                                  alpha: 0.1,
                                ),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            widget.gameName,
                            style: AppTypography.titleMedium.copyWith(
                              fontFamily: 'Playfair Display',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkBrown,
                            ),
                          ),
                        ),
                      ),

                      // Top Right: Play style tag
                      Positioned(
                        top: 12,
                        right: 14,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.accentLight,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AppColors.accent.withValues(alpha: 0.3),
                              width: 0.8,
                            ),
                          ),
                          child: Text(
                            widget.playStyle,
                            style: AppTypography.labelSmall.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: AppColors.accent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // 2. Card Body Info (WHO, WHEN, WHERE, SPOTS)
                Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Headline statement
                      Text(
                        widget.headline,
                        style: AppTypography.editorialHeadline.copyWith(
                          fontSize: 16,
                          color: AppColors.accent,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),

                      // Schedule & Location Row
                      Row(
                        children: [
                          const Icon(
                            Icons.schedule_rounded,
                            size: 14,
                            color: AppColors.softBrown,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            widget.schedule,
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.secondaryText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Icon(
                            Icons.location_on_outlined,
                            size: 14,
                            color: AppColors.softBrown,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              widget.location,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTypography.bodySmall.copyWith(
                                color: AppColors.secondaryText,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: AppSpacing.md),
                      const Divider(height: 1, color: AppColors.border),
                      const SizedBox(height: AppSpacing.sm),

                      // 3. Bottom Row: Players, Spots left & Direct Join CTA
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                AvatarStack(
                                  avatars: widget.currentPlayers,
                                  totalCapacity: widget.totalCapacity,
                                  size: 26,
                                  showLabel: false,
                                ),
                                const SizedBox(width: 8),
                                Flexible(
                                  child: Text(
                                    widget.spotsRemaining > 0
                                        ? '${widget.spotsRemaining} spots left'
                                        : 'Table full',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTypography.labelSmall.copyWith(
                                      color: widget.spotsRemaining > 0
                                          ? AppColors.accent
                                          : AppColors.secondaryText,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Request to join button
                          AppButton(
                            text: 'Request',
                            size: AppButtonSize.sm,
                            onPressed: widget.spotsRemaining > 0
                                ? widget.onJoinTap
                                : null,
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
