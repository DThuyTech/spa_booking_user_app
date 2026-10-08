import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/favorite/favorite_store_entity.dart';
import '../../../../domain/entities/store/store_entity.dart';
import '../../../../shared/shared.dart';
import '../../../bloc/home/home_bloc.dart';
import '../../../bloc/home/home_event.dart';
import '../../../bloc/home/home_state.dart';
import '../widgets/home_skeleton.dart';
import '../sections/home_explore_services_section.dart';
import '../sections/home_favorite_stores_section.dart';
import '../sections/home_header_section.dart';
import '../sections/home_intro_banners_section.dart';
import '../sections/home_recently_booked_section.dart';
import '../sections/home_recommended_for_you_section.dart';
import '../sections/home_salons_near_you_section.dart';
import '../sections/home_special_offers_section.dart';
import '../widgets/home_near_salon_card.dart';
import '../widgets/home_recommended_salon_card.dart';
import '../widgets/home_special_offer_card.dart';
import '../widgets/merchant_intro_bottom_sheet.dart';

class HomeBodyView extends StatelessWidget {
  final String greetingText;
  final String locationText;
  final String userAvatarSeed;
  final int notificationCount;
  final VoidCallback? onLocationTap;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onAvatarTap;
  final VoidCallback? onSearchTap;
  final VoidCallback? onFilterTap;

  final List<StoreEntity> recentlyBookedStores;
  final ValueChanged<StoreEntity>? onRecentlyBookedTap;
  final ValueChanged<StoreEntity>? onRecentlyBookedRebook;

  final List<FavoriteStoreEntity> favoriteStores;
  final ValueChanged<FavoriteStoreEntity>? onFavoriteStoreTap;
  final ValueChanged<FavoriteStoreEntity>? onFavoriteStoreToggle;
  final VoidCallback? onSeeAllFavoriteStores;

  final List<HomeSpecialOfferItem> specialOffers;
  final ValueChanged<HomeSpecialOfferItem>? onOfferTap;
  final ValueChanged<HomeSpecialOfferItem>? onBookOffer;

  final String selectedCategoryId;
  final ValueChanged<ServiceCategoryItem>? onCategorySelected;

  final List<HomeNearSalonItem> nearSalons;
  final String? nearSalonsTitle;
  final VoidCallback? onSeeAllNearSalons;
  final ValueChanged<HomeNearSalonItem>? onNearSalonTap;
  final ValueChanged<HomeNearSalonItem>? onNearSalonBook;

  final List<HomeRecommendedSalonItem> recommendedSalons;
  final String? recommendedTitle;
  final String? recommendedSubtitle;
  final VoidCallback? onSeeAllRecommended;
  final ValueChanged<HomeRecommendedSalonItem>? onRecommendedSalonTap;
  final ValueChanged<HomeRecommendedSalonItem>? onFavoriteToggle;

  final Future<void> Function()? onRefresh;

  const HomeBodyView({
    super.key,
    this.greetingText = 'Good morning',
    this.locationText = 'Ho Chi Minh City',
    this.userAvatarSeed = 'KH',
    this.notificationCount = 3,
    this.onLocationTap,
    this.onNotificationTap,
    this.onAvatarTap,
    this.onSearchTap,
    this.onFilterTap,
    this.recentlyBookedStores = const [],
    this.onRecentlyBookedTap,
    this.onRecentlyBookedRebook,
    this.favoriteStores = const [],
    this.onFavoriteStoreTap,
    this.onFavoriteStoreToggle,
    this.onSeeAllFavoriteStores,
    this.specialOffers = const [],
    this.onOfferTap,
    this.onBookOffer,
    this.selectedCategoryId = 'haircuts',
    this.onCategorySelected,
    this.nearSalons = const [],
    this.nearSalonsTitle,
    this.onSeeAllNearSalons,
    this.onNearSalonTap,
    this.onNearSalonBook,
    this.recommendedSalons = const [],
    this.recommendedTitle,
    this.recommendedSubtitle,
    this.onSeeAllRecommended,
    this.onRecommendedSalonTap,
    this.onFavoriteToggle,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const SafeArea(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: HomeSkeleton(),
            ),
          );
        }
        if (state.isFailure && !state.hasGreeting) {
          return SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.errorMessage ?? 'An error occurred'),
                    const SizedBox(height: 12),
                    AppButton(
                      text: 'Retry',
                      onPressed: () =>
                          context.read<HomeBloc>().add(HomeRetried()),
                      size: AppButtonSize.sm,
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        final body = SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Curved Header Section (Full Width across top)
              HomeHeaderSection(
                greetingText: greetingText,
                locationText: locationText,
                userAvatarSeed: userAvatarSeed,
                notificationCount: notificationCount,
                onLocationTap: onLocationTap,
                onNotificationTap: onNotificationTap,
                onAvatarTap: onAvatarTap,
                onSearchTap: onSearchTap,
                onFilterTap: onFilterTap,
              ),

              const SizedBox(height: 14),

              // 2. Special Offers or App Intro Banners Section
              if (specialOffers.isNotEmpty)
                HomeSpecialOffersSection(
                  offers: specialOffers,
                  onOfferTap: onOfferTap,
                  onBookNow: onBookOffer,
                )
              else
                HomeIntroBannersSection(
                  onExploreUserApp: onSearchTap,
                  onExploreMerchantApp: () =>
                      MerchantIntroBottomSheet.show(context),
                ),

              if (recentlyBookedStores.isNotEmpty) ...[
                const SizedBox(height: 24),
                // 3. Recently Booked Section
                HomeRecentlyBookedSection(
                  stores: recentlyBookedStores,
                  onStoreTap: onRecentlyBookedTap,
                  onRebookTap: onRecentlyBookedRebook,
                ),
              ],

              if (favoriteStores.isNotEmpty) ...[
                const SizedBox(height: 24),
                // Favorite Stores Section
                HomeFavoriteStoresSection(
                  stores: favoriteStores,
                  onStoreTap: onFavoriteStoreTap,
                  onFavoriteToggle: onFavoriteStoreToggle,
                  onSeeAllTap: onSeeAllFavoriteStores,
                ),
              ],

              const SizedBox(height: 24),

              // 4. Salons Near You Section
              HomeSalonsNearYouSection(
                salons: nearSalons,
                title: nearSalonsTitle,
                onSeeAllTap: onSeeAllNearSalons,
                onSalonTap: onNearSalonTap,
                onBookTap: onNearSalonBook,
              ),

              const SizedBox(height: 24),

              // 5. Recommended for You Section (Salon chung thành phố)
              HomeRecommendedForYouSection(
                salons: recommendedSalons,
                title: recommendedTitle,
                subtitle: recommendedSubtitle,
                onSeeAllTap: onSeeAllRecommended,
                onSalonTap: onRecommendedSalonTap,
                onFavoriteToggle: onFavoriteToggle,
              ),

              // Bottom space for Bottom Navigation Bar
              const SizedBox(height: 100),
            ],
          ),
        );

        if (onRefresh != null) {
          return RefreshIndicator(
            color: const Color(0xFFFC6E58),
            onRefresh: onRefresh!,
            child: body,
          );
        }
        return body;
      },
    );
  }
}
