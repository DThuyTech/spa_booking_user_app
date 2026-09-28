import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/home/home_bloc.dart';
import '../../../bloc/home/home_event.dart';
import '../../../bloc/home/home_state.dart';
import '../widgets/home_skeleton.dart';
import '../mockup_data/home_mock_data.dart';
import '../sections/home_explore_services_section.dart';
import '../sections/home_header_section.dart';
import '../sections/home_recommended_for_you_section.dart';
import '../sections/home_salons_near_you_section.dart';
import '../sections/home_special_offers_section.dart';
import '../sections/home_upcoming_appointment_section.dart';
import '../widgets/home_near_salon_card.dart';
import '../widgets/home_recommended_salon_card.dart';
import '../widgets/home_special_offer_card.dart';
import '../widgets/home_upcoming_appointment_card.dart';

class HomeBodyView extends StatelessWidget {
  final String greetingText;
  final String locationText;
  final String userAvatarSeed;
  final int notificationCount;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onAvatarTap;
  final VoidCallback? onSearchTap;
  final VoidCallback? onFilterTap;

  final List<HomeSpecialOfferItem> specialOffers;
  final ValueChanged<HomeSpecialOfferItem>? onOfferTap;
  final ValueChanged<HomeSpecialOfferItem>? onBookOffer;

  final List<ServiceCategoryItem> categories;
  final String selectedCategoryId;
  final ValueChanged<ServiceCategoryItem>? onCategorySelected;

  final HomeAppointmentItem? upcomingAppointment;
  final VoidCallback? onAppointmentTap;

  final List<HomeNearSalonItem> nearSalons;
  final VoidCallback? onSeeAllNearSalons;
  final ValueChanged<HomeNearSalonItem>? onNearSalonTap;
  final ValueChanged<HomeNearSalonItem>? onNearSalonBook;

  final List<HomeRecommendedSalonItem> recommendedSalons;
  final VoidCallback? onSeeAllRecommended;
  final ValueChanged<HomeRecommendedSalonItem>? onRecommendedSalonTap;
  final ValueChanged<HomeRecommendedSalonItem>? onFavoriteToggle;

  final Future<void> Function()? onRefresh;

  const HomeBodyView({
    super.key,
    this.greetingText = 'Good morning',
    this.locationText = 'Ho Chi Minh City',
    this.userAvatarSeed = 'JA',
    this.notificationCount = 3,
    this.onNotificationTap,
    this.onAvatarTap,
    this.onSearchTap,
    this.onFilterTap,
    this.specialOffers = HomeMockData.specialOffers,
    this.onOfferTap,
    this.onBookOffer,
    this.categories = HomeMockData.categories,
    this.selectedCategoryId = 'haircuts',
    this.onCategorySelected,
    this.upcomingAppointment = HomeMockData.upcomingAppointment,
    this.onAppointmentTap,
    this.nearSalons = HomeMockData.nearSalons,
    this.onSeeAllNearSalons,
    this.onNearSalonTap,
    this.onNearSalonBook,
    this.recommendedSalons = HomeMockData.recommendedSalons,
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
                    ElevatedButton(
                      onPressed: () =>
                          context.read<HomeBloc>().add(HomeRetried()),
                      child: const Text('Retry'),
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
              const SizedBox(height: 12),

              // 1. Header Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: HomeHeaderSection(
                  greetingText: greetingText,
                  locationText: locationText,
                  userAvatarSeed: userAvatarSeed,
                  notificationCount: notificationCount,
                  onNotificationTap: onNotificationTap,
                  onAvatarTap: onAvatarTap,
                  onSearchTap: onSearchTap,
                  onFilterTap: onFilterTap,
                ),
              ),

              const SizedBox(height: 24),

              // 2. Special Offers Section
              HomeSpecialOffersSection(
                offers: specialOffers,
                onOfferTap: onOfferTap,
                onBookNow: onBookOffer,
              ),

              const SizedBox(height: 24),

              // 3. Explore Services Section
              HomeExploreServicesSection(
                categories: categories,
                selectedCategoryId: selectedCategoryId,
                onCategorySelected: onCategorySelected ?? (_) {},
              ),

              const SizedBox(height: 24),

              // 4. Upcoming Appointment Section
              if (upcomingAppointment != null) ...[
                HomeUpcomingAppointmentSection(
                  appointment: upcomingAppointment,
                  onAppointmentTap: onAppointmentTap,
                ),
                const SizedBox(height: 24),
              ],

              // 5. Salons Near You Section
              HomeSalonsNearYouSection(
                salons: nearSalons,
                onSeeAllTap: onSeeAllNearSalons,
                onSalonTap: onNearSalonTap,
                onBookTap: onNearSalonBook,
              ),

              const SizedBox(height: 24),

              // 6. Recommended for You Section
              HomeRecommendedForYouSection(
                salons: recommendedSalons,
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
