import 'package:flutter/material.dart';
import '../../tokens/app_colors.dart';
import '../../tokens/app_motion.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_shadows.dart';
import '../../tokens/app_spacing.dart';
import '../../tokens/app_typography.dart';

/// Board Ơi VenueCard — Redesigned
///
/// Warm card with accent image placeholder, rating pill, active tables badge,
/// and tag chips. Clean information hierarchy.
class VenueCard extends StatefulWidget {
  final String name;
  final String address;
  final String activeTablesText;
  final double rating;
  final List<String> tags;
  final String? imageUrl;
  final VoidCallback? onTap;

  const VenueCard({
    super.key,
    required this.name,
    required this.address,
    required this.activeTablesText,
    this.rating = 4.9,
    this.tags = const ['Café', 'AC', 'Events'],
    this.imageUrl,
    this.onTap,
  });

  @override
  State<VenueCard> createState() => _VenueCardState();
}

class _VenueCardState extends State<VenueCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppMotion.fast,
      reverseDuration: const Duration(milliseconds: 180),
    );
    _scaleAnim = Tween<double>(
      begin: 1.0,
      end: AppMotion.scalePressed,
    ).animate(CurvedAnimation(parent: _controller, curve: AppMotion.spring));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnim,
      child: GestureDetector(
        onTapDown: (_) => _controller.forward(),
        onTapUp: (_) {
          _controller.reverse();
          widget.onTap?.call();
        },
        onTapCancel: () => _controller.reverse(),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.card),
            border: Border.all(color: AppColors.border),
            boxShadow: AppShadows.card,
          ),
          child: Row(
            children: [
              // ── Venue image / icon ──────────────────────────────────────
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppRadius.card),
                  bottomLeft: Radius.circular(AppRadius.card),
                ),
                child: widget.imageUrl != null
                    ? Image.network(
                        widget.imageUrl!,
                        width: 80,
                        height: 90,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            _buildImagePlaceholder(),
                      )
                    : _buildImagePlaceholder(),
              ),

              // ── Info ────────────────────────────────────────────────────
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.smMd,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name + Rating
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.name,
                              style: AppTypography.titleSmall.copyWith(
                                color: AppColors.darkBrown,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Row(
                            mainAxisSize: MainAxisSize.min,
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
                                  color: AppColors.darkBrown,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 3),

                      // Address
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 12,
                            color: AppColors.softBrown,
                          ),
                          const SizedBox(width: 3),
                          Expanded(
                            child: Text(
                              widget.address,
                              style: AppTypography.bodySmall.copyWith(
                                color: AppColors.secondaryText,
                                fontSize: 11,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // Chips row
                      Wrap(
                        spacing: 5,
                        runSpacing: 4,
                        children: [
                          _Pill(
                            label: widget.activeTablesText,
                            bg: AppColors.successLight,
                            fg: AppColors.success,
                          ),
                          for (final tag in widget.tags.take(2))
                            _Pill(
                              label: tag,
                              bg: AppColors.canvasWarm,
                              fg: AppColors.secondaryText,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // ── Chevron ─────────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.only(right: AppSpacing.sm),
                child: Icon(
                  Icons.chevron_right_rounded,
                  size: 18,
                  color: AppColors.softBrown,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      width: 80,
      height: 90,
      color: AppColors.canvasWarm,
      child: const Center(
        child: Icon(
          Icons.storefront_rounded,
          color: AppColors.primaryBrown,
          size: 28,
        ),
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  final String label;
  final Color bg;
  final Color fg;
  const _Pill({required this.label, required this.bg, required this.fg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Text(
        label,
        style: AppTypography.labelSmall.copyWith(
          color: fg,
          fontWeight: FontWeight.w600,
          fontSize: 10,
        ),
      ),
    );
  }
}
