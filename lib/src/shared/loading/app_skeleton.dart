import 'package:flutter/widgets.dart';
import '../design_system/tokens/app_radius.dart';
import '../design_system/tokens/app_spacing.dart';
import 'app_shimmer.dart';

/// Board Ơi Component-Shaped Skeletons
///
/// Every skeleton exactly mirrors the shape of the actual component it replaces.
/// This ensures zero layout shift when real content loads.
abstract final class AppSkeleton {
  // ---------------------------------------------------------------------------
  // Primitives
  // ---------------------------------------------------------------------------

  static Widget box({
    double? width,
    required double height,
    BorderRadius? borderRadius,
  }) =>
      AppShimmer.box(width: width, height: height, borderRadius: borderRadius);

  static Widget circle({required double size}) => AppShimmer.circle(size: size);

  static Widget listTile() => AppShimmer.listTile();

  // ---------------------------------------------------------------------------
  // GameCard skeleton  (mirrors: GameCard — vertical ~190px card)
  // ---------------------------------------------------------------------------

  static Widget gameCard({double width = 130}) {
    return AppShimmer(
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image area
            Container(
              width: width,
              height: 150,
              decoration: BoxDecoration(
                color: const Color(0xFFD3CBC1),
                borderRadius: BorderRadius.circular(AppRadius.card),
              ),
            ),
            const SizedBox(height: 8),
            // Game title
            Container(
              width: width * 0.7,
              height: 12,
              decoration: BoxDecoration(
                color: const Color(0xFFD3CBC1),
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
            ),
            const SizedBox(height: 5),
            // Subtitle / tag
            Container(
              width: width * 0.45,
              height: 10,
              decoration: BoxDecoration(
                color: const Color(0xFFE4DDD4),
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // MatchRequestCard skeleton  (mirrors: MatchRequestCard — full-width ~160px)
  // ---------------------------------------------------------------------------

  static Widget matchCard() {
    return AppShimmer(
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.md),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: const Color(0xFFEDE7DE),
          borderRadius: BorderRadius.circular(AppRadius.card),
        ),
        child: Row(
          children: [
            // Game image
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: const Color(0xFFD3CBC1),
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _shimmerLine(width: 120, height: 13),
                  const SizedBox(height: 7),
                  _shimmerLine(width: 90, height: 10),
                  const SizedBox(height: 5),
                  _shimmerLine(width: 70, height: 10),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      circle(size: 24),
                      const SizedBox(width: -6),
                      circle(size: 24),
                      const SizedBox(width: -6),
                      circle(size: 24),
                      const Spacer(),
                      _shimmerLine(
                        width: 72,
                        height: 28,
                        radius: AppRadius.button,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Profile skeleton  (mirrors: ProfileBody hero + games section)
  // ---------------------------------------------------------------------------

  static Widget profile() {
    return AppShimmer(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          children: [
            // Avatar
            Container(
              width: 96,
              height: 96,
              decoration: const BoxDecoration(
                color: Color(0xFFD3CBC1),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            _shimmerLine(width: 140, height: 18),
            const SizedBox(height: 8),
            _shimmerLine(width: 90, height: 12),
            const SizedBox(height: AppSpacing.xl),
            // Stats row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [_statBlock(), _statBlock(), _statBlock()],
            ),
            const SizedBox(height: AppSpacing.xl),
            // Games row
            Row(
              children: List.generate(
                3,
                (i) => Padding(
                  padding: EdgeInsets.only(right: i < 2 ? AppSpacing.sm : 0),
                  child: gameCard(width: 110),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // EventCard skeleton  (mirrors: EventCard — full-width hero card ~220px)
  // ---------------------------------------------------------------------------

  static Widget eventCard() {
    return AppShimmer(
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.md),
        decoration: BoxDecoration(
          color: const Color(0xFFEDE7DE),
          borderRadius: BorderRadius.circular(AppRadius.card),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image hero
            Container(
              height: 160,
              decoration: BoxDecoration(
                color: const Color(0xFFD3CBC1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppRadius.card),
                  topRight: Radius.circular(AppRadius.card),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _shimmerLine(width: 200, height: 14),
                  const SizedBox(height: 7),
                  _shimmerLine(width: 140, height: 10),
                  const SizedBox(height: 5),
                  _shimmerLine(width: 100, height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // VenueCard skeleton
  // ---------------------------------------------------------------------------

  static Widget venueCard() {
    return AppShimmer(
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.md),
        height: 90,
        decoration: BoxDecoration(
          color: const Color(0xFFEDE7DE),
          borderRadius: BorderRadius.circular(AppRadius.card),
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              decoration: BoxDecoration(
                color: const Color(0xFFD3CBC1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppRadius.card),
                  bottomLeft: Radius.circular(AppRadius.card),
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _shimmerLine(width: 130, height: 13),
                  const SizedBox(height: 7),
                  _shimmerLine(width: 90, height: 10),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _shimmerLine(
                        width: 60,
                        height: 18,
                        radius: AppRadius.full,
                      ),
                      const SizedBox(width: 6),
                      _shimmerLine(
                        width: 44,
                        height: 18,
                        radius: AppRadius.full,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  static Widget _shimmerLine({
    required double width,
    required double height,
    double radius = AppRadius.sm,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFD3CBC1),
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  static Widget _statBlock() {
    return Column(
      children: [
        _shimmerLine(width: 40, height: 20),
        const SizedBox(height: 5),
        _shimmerLine(width: 50, height: 10),
      ],
    );
  }
}
