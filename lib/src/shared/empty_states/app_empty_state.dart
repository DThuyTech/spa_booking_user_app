import 'package:flutter/material.dart';
import '../design_system/components/buttons/app_button.dart';
import '../design_system/tokens/app_colors.dart';
import '../design_system/tokens/app_motion.dart';
import '../design_system/tokens/app_spacing.dart';
import '../design_system/tokens/app_typography.dart';

enum AppEmptyStateVariant {
  noMatches, // No nearby matches
  noEvents, // No events found
  noVenues, // No venues
  noResults, // Empty search
  generic, // Default
}

/// Board Ơi Branded Empty State
///
/// Replaces generic icon with a warm illustrated board-game motif.
/// Soft entrance animation (fade + scale).
class AppEmptyState extends StatefulWidget {
  final AppEmptyStateVariant variant;
  final String? title;
  final String? description;
  final String? actionText;
  final VoidCallback? onAction;

  // Legacy compat
  final IconData? icon;

  const AppEmptyState({
    super.key,
    this.variant = AppEmptyStateVariant.generic,
    this.title,
    this.description,
    this.actionText,
    this.onAction,
    this.icon,
  });

  @override
  State<AppEmptyState> createState() => _AppEmptyStateState();
}

class _AppEmptyStateState extends State<AppEmptyState>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnim;
  late final Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: AppMotion.slow);
    _fadeAnim = CurvedAnimation(parent: _controller, curve: AppMotion.enter);
    _scaleAnim = Tween<double>(
      begin: 0.88,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: AppMotion.enter));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _EmptyConfig get _config => switch (widget.variant) {
    AppEmptyStateVariant.noMatches => const _EmptyConfig(
      emoji: '🎲',
      title: 'Chưa có bàn nào gần đây',
      description: 'Hãy là người đầu tiên mở bàn và mời bạn bè cùng chơi.',
      actionText: 'Mở bàn mới',
    ),
    AppEmptyStateVariant.noEvents => const _EmptyConfig(
      emoji: '🎪',
      title: 'Chưa có sự kiện nào',
      description: 'Các sự kiện mới đang được lên kế hoạch. Quay lại sau nhé!',
      actionText: null,
    ),
    AppEmptyStateVariant.noVenues => const _EmptyConfig(
      emoji: '☕',
      title: 'Chưa có địa điểm nào',
      description: 'Khám phá khu vực khác hoặc mở rộng phạm vi tìm kiếm.',
      actionText: null,
    ),
    AppEmptyStateVariant.noResults => const _EmptyConfig(
      emoji: '🔍',
      title: 'Không tìm thấy kết quả',
      description: 'Thử từ khoá khác hoặc bỏ bớt bộ lọc.',
      actionText: 'Xoá bộ lọc',
    ),
    AppEmptyStateVariant.generic => const _EmptyConfig(
      emoji: '♟️',
      title: 'Chưa có gì ở đây',
      description: 'Nội dung sẽ xuất hiện khi có dữ liệu mới.',
      actionText: null,
    ),
  };

  @override
  Widget build(BuildContext context) {
    final cfg = _config;
    final title = widget.title ?? cfg.title;
    final description = widget.description ?? cfg.description;
    final actionText = widget.actionText ?? cfg.actionText;

    return FadeTransition(
      opacity: _fadeAnim,
      child: ScaleTransition(
        scale: _scaleAnim,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xxl,
              vertical: AppSpacing.xl,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ── Illustrated motif ─────────────────────────────────────
                _BoardGameMotif(emoji: cfg.emoji, legacyIcon: widget.icon),

                const SizedBox(height: AppSpacing.lg),

                // ── Title ─────────────────────────────────────────────────
                Text(
                  title,
                  style: AppTypography.editorialHeadline.copyWith(
                    color: AppColors.darkBrown,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: AppSpacing.sm),

                // ── Description ───────────────────────────────────────────
                if (description != null)
                  Text(
                    description,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.secondaryText,
                      height: 1.55,
                    ),
                    textAlign: TextAlign.center,
                  ),

                // ── Action ────────────────────────────────────────────────
                if (actionText != null && widget.onAction != null) ...[
                  const SizedBox(height: AppSpacing.xl),
                  AppButton(
                    text: actionText,
                    onPressed: widget.onAction,
                    variant: AppButtonVariant.primary,
                    size: AppButtonSize.md,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Board game motif illustration (drawn with Flutter, no external assets)
// ---------------------------------------------------------------------------

class _BoardGameMotif extends StatelessWidget {
  final String emoji;
  final IconData? legacyIcon;

  const _BoardGameMotif({required this.emoji, this.legacyIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 112,
      height: 112,
      decoration: BoxDecoration(
        color: AppColors.canvasWarm,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.border, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkBrown.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Center(
        child: legacyIcon != null
            ? Icon(legacyIcon, size: 40, color: AppColors.softBrown)
            : Text(emoji, style: const TextStyle(fontSize: 44)),
      ),
    );
  }
}

class _EmptyConfig {
  final String emoji;
  final String title;
  final String? description;
  final String? actionText;

  const _EmptyConfig({
    required this.emoji,
    required this.title,
    this.description,
    this.actionText,
  });
}
