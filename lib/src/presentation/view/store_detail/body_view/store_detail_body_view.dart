import 'package:flutter/material.dart';
import '../mockup_data/store_detail_mock_data.dart';
import '../sections/store_detail_header_section.dart';
import '../sections/store_detail_tab_bar_section.dart';
import '../view/store_gallery_tab_view.dart';
import '../view/store_overview_tab_view.dart';
import '../view/store_reviews_tab_view.dart';
import '../view/store_services_tab_view.dart';

class StoreDetailBodyView extends StatelessWidget {
  final StoreDetailItem store;
  final StoreDetailTab activeTab;
  final ValueChanged<StoreDetailTab> onTabChanged;
  final VoidCallback? onBackTap;
  final ValueChanged<bool>? onFavoriteToggle;
  final VoidCallback? onShareTap;
  final VoidCallback? onBookSeat;
  final ValueChanged<StoreServiceItem>? onBookService;
  final ValueChanged<StoreGalleryPhotoItem>? onPhotoTap;
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
    this.onPhotoTap,
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
            store: store,
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
          serviceGroups: store.serviceGroups,
          onBookService: onBookService,
        );
      case StoreDetailTab.gallery:
        return StoreGalleryTabView(
          photos: store.galleryPhotos,
          onPhotoTap: onPhotoTap,
        );
      case StoreDetailTab.reviews:
        return StoreReviewsTabView(
          ratingSummary: store.ratingSummary,
          reviews: store.reviews,
          onViewAllReviews: onViewAllReviews,
          onWriteReview: onWriteReview,
        );
    }
  }
}
