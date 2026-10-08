import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:spa_booking/src/domain/entities/store/store_full_detail_entity.dart';
import '../../../../shared/design_system/components/buttons/app_favorite_button.dart';
import '../../../../shared/design_system/components/buttons/app_icon_button.dart';
import '../widgets/store_header_card.dart';

class StoreDetailHeaderSection extends StatelessWidget {
  final StoreFullDetailEntity fullStore;
  final VoidCallback? onBackTap;
  final ValueChanged<bool>? onFavoriteToggle;
  final VoidCallback? onShareTap;

  const StoreDetailHeaderSection({
    super.key,
    required this.fullStore,
    this.onBackTap,
    this.onFavoriteToggle,
    this.onShareTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Cover Image with Gradient
        SizedBox(
          height: 310,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                fullStore.coverImageUrl ?? '-',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: const Color(0xFFE2E8F0),
                  child: const Center(
                    child: Icon(
                      LucideIcons.image,
                      size: 40,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                ),
              ),
              // Top shadow gradient for buttons visibility
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 120,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.45),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Top Navigation Buttons Bar
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  AppIconButton(
                    icon: LucideIcons.arrow_left,
                    dimension: 42,
                    iconSize: 20,
                    backgroundColor: Colors.white.withValues(alpha: 0.9),
                    iconColor: const Color(0xFF1E2022),
                    borderRadius: BorderRadius.circular(21),
                    onPressed:
                        onBackTap ?? () => Navigator.of(context).maybePop(),
                  ),

                  // Actions: Favorite + Share
                  Row(
                    children: [
                      AppFavoriteButton(
                        isFavorite: fullStore.isFavorite,
                        onToggle: () =>
                            onFavoriteToggle?.call(!fullStore.isFavorite),
                        size: 42,
                        iconSize: 20,
                        isFloating: true,
                        floatingBg: Colors.white.withValues(alpha: 0.9),
                      ),
                      const SizedBox(width: 10),
                      AppIconButton(
                        icon: LucideIcons.share_2,
                        dimension: 42,
                        iconSize: 18,
                        backgroundColor: Colors.white.withValues(alpha: 0.9),
                        iconColor: const Color(0xFF1E2022),
                        borderRadius: BorderRadius.circular(21),
                        onPressed: onShareTap,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        // Floating Store Header Card (overlapping the cover bottom)
        Padding(
          padding: const EdgeInsets.only(top: 245, left: 16, right: 16),
          child: StoreHeaderCard(store: fullStore),
        ),
      ],
    );
  }
}
