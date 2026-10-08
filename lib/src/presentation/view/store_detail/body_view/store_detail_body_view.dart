import 'package:flutter/material.dart';
import 'package:spa_booking/src/domain/entities/store/store_detail_entity.dart';
import 'package:spa_booking/src/domain/entities/store/store_full_detail_entity.dart';
import 'package:spa_booking/src/presentation/view/store_detail/view/store_gallery_tab_view.dart';
import 'package:spa_booking/src/presentation/view/store_detail/view/store_overview_tab_view.dart';
import 'package:spa_booking/src/presentation/view/store_detail/view/store_reviews_tab_view.dart';
import 'package:spa_booking/src/presentation/view/store_detail/view/store_services_tab_view.dart';
import '../sections/store_detail_header_section.dart';
import '../sections/store_detail_tab_bar_section.dart';

class StoreDetailBodyView extends StatelessWidget {
  final StoreFullDetailEntity store;
  final StoreDetailTab activeTab;
  final ValueChanged<StoreDetailTab> onTabChanged;
  final VoidCallback? onBackTap;
  final ValueChanged<bool>? onFavoriteToggle;
  final VoidCallback? onShareTap;
  final VoidCallback? onBookSeat;
  final ValueChanged<StoreDetailEntity>? onBookService;
  // final ValueChanged<StoreGalleryPhotoItem>? onPhotoTap;
  final VoidCallback? onGetDirections;
  final VoidCallback? onViewAllReviews;
  final VoidCallback? onWriteReview;

  const StoreDetailBodyView({
    super.key,
    required this.store,
    required this.activeTab,
    required this.onTabChanged,
    this.onBackTap,
    this.onFavoriteToggle,
    this.onShareTap,
    this.onBookSeat,
    this.onBookService,
    // this.onPhotoTap,
    this.onGetDirections,
    this.onViewAllReviews,
    this.onWriteReview,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header Section with Cover and Overlapping Store Info Card
          StoreDetailHeaderSection(
            fullStore: store,
            onBackTap: onBackTap,
            onFavoriteToggle: onFavoriteToggle,
            onShareTap: onShareTap,
          ),
          const SizedBox(height: 16),

          // 2. Tab Bar Section (Overview, Services, Gallery, Reviews)
          StoreDetailTabBarSection(
            activeTab: activeTab,
            onTabChanged: onTabChanged,
          ),

          // 3. Tab Content Section
          _buildActiveTabContent(),
        ],
      ),
    );
  }

  Widget _buildActiveTabContent() {
    switch (activeTab) {
      case StoreDetailTab.overview:
        return StoreOverviewTabView(
          store: store,
          onBookSeat: onBookSeat,
          onViewAllServices: () => onTabChanged(StoreDetailTab.services),
          onGetDirections: onGetDirections,
        );
      case StoreDetailTab.services:
        return StoreServicesTabView(
          categories: store.categories,
          services: store.services,
          onBookService: onBookService,
        );

      case StoreDetailTab.gallery:
        return StoreGalleryTabView(
          coverImageUrl: store.coverImageUrl,
          images: store.images,
        );
      case StoreDetailTab.reviews:
        return StoreReviewsTabView(
          ratingSummary: store.reviewSummary,
          onViewAllReviews: onViewAllReviews,
          onWriteReview: onWriteReview,
        );
    }
  }
}
