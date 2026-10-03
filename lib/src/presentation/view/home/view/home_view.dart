import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/di/dependency_injection.dart';
import '../../../../domain/entities/store/store_entity.dart';
import '../../../../shared/design_system/components/sheets/app_filter_bottom_sheet.dart';
import '../../../../shared/widgets/toast/app_toast.dart';
import '../../../bloc/auth_session/auth_session_bloc.dart';
import '../../../bloc/home/home_bloc.dart';
import '../../../bloc/home/home_event.dart';
import '../../notification/notification_dashboard/view/notification_dashboard_view.dart';
import '../../store_detail/view/store_detail_view.dart';
import '../body_view/home_body_view.dart';
import '../mockup_data/home_mock_data.dart';
import '../widgets/home_near_salon_card.dart';
import '../widgets/home_recommended_salon_card.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  final VoidCallback? onSearchTap;

  const HomePage({super.key, this.onSearchTap});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HomeBloc>()..add(const HomeStarted()),
      child: HomeView(onSearchTap: onSearchTap),
    );
  }
}

class HomeView extends StatefulWidget {
  final VoidCallback? onSearchTap;

  const HomeView({super.key, this.onSearchTap});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _selectedCategoryId = 'haircuts';
  SpaFilterCriteria _filterCriteria = const SpaFilterCriteria();
  final Set<String> _favoriteStoreIds = {};

  void _onFavoriteToggle(HomeRecommendedSalonItem item) {
    final willBeFavorite = !_favoriteStoreIds.contains(item.id);
    setState(() {
      if (willBeFavorite) {
        _favoriteStoreIds.add(item.id);
      } else {
        _favoriteStoreIds.remove(item.id);
      }
    });
    AppToast.info(
      context,
      message: willBeFavorite ? 'Added to favorites' : 'Removed from favorites',
    );
  }

  void _openFilterBottomSheet() {
    AppFilterBottomSheet.show(
      context,
      initialCriteria: _filterCriteria,
      onApply: (criteria) {
        setState(() {
          _filterCriteria = criteria;
        });
        AppToast.success(
          context,
          message: 'Filters applied: ${criteria.services.join(", ")}',
        );
      },
    );
  }

  List<HomeNearSalonItem> _mapToNearSalons(List<StoreEntity> stores) {
    if (stores.isEmpty) return HomeMockData.nearSalons;
    return stores.map((s) {
      return HomeNearSalonItem(
        id: s.id,
        name: s.name,
        categories: s.address.isNotEmpty ? s.address : 'Spa & Salon',
        rating: s.rating,
        distance: s.address.contains(',')
            ? s.address.split(',').last.trim()
            : s.address,
        imageUrl: (s.coverUrl != null && s.coverUrl!.isNotEmpty)
            ? s.coverUrl!
            : (s.logoUrl != null && s.logoUrl!.isNotEmpty)
            ? s.logoUrl!
            : 'https://images.unsplash.com/photo-1527799820374-dcf8d9d4a388?auto=format&fit=crop&w=600&q=80',
      );
    }).toList();
  }

  List<HomeRecommendedSalonItem> _mapToRecommendedSalons(
    List<StoreEntity> stores,
  ) {
    if (stores.isEmpty) {
      return HomeMockData.recommendedSalons.map((s) {
        return HomeRecommendedSalonItem(
          id: s.id,
          name: s.name,
          categoryLocation: s.categoryLocation,
          rating: s.rating,
          reviewCount: s.reviewCount,
          imageUrl: s.imageUrl,
          isFavorite: _favoriteStoreIds.contains(s.id) || s.isFavorite,
        );
      }).toList();
    }
    return stores.map((s) {
      return HomeRecommendedSalonItem(
        id: s.id,
        name: s.name,
        categoryLocation: s.address,
        rating: s.rating,
        reviewCount: s.reviewCount,
        imageUrl: (s.coverUrl != null && s.coverUrl!.isNotEmpty)
            ? s.coverUrl!
            : (s.logoUrl != null && s.logoUrl!.isNotEmpty)
            ? s.logoUrl!
            : 'https://images.unsplash.com/photo-1519415510236-718bdfcd89c8?auto=format&fit=crop&w=400&q=80',
        isFavorite: _favoriteStoreIds.contains(s.id),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final authUser = context.watch<AuthSessionBloc>().state.user;
    final homeState = context.watch<HomeBloc>().state;
    final nearSalons = _mapToNearSalons(homeState.stores);
    final recommendedSalons = _mapToRecommendedSalons(homeState.stores);
    final String avatarSeed = authUser?.fullName.isNotEmpty == true
        ? authUser!.fullName
        : 'JA';

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: HomeBodyView(
            greetingText: 'Good morning',
            locationText: 'Ho Chi Minh City',
            userAvatarSeed: avatarSeed,
            notificationCount: 3,
            onNotificationTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const NotificationDashboardView(),
                ),
              );
            },
            onAvatarTap: () {
              AppToast.info(context, message: 'Profile avatar clicked');
            },
            onSearchTap: widget.onSearchTap,
            onFilterTap: _openFilterBottomSheet,
            specialOffers: HomeMockData.specialOffers,
            onOfferTap: (offer) {
              AppToast.info(context, message: 'Offer: ${offer.discount}');
            },
            onBookOffer: (offer) {
              AppToast.success(
                context,
                message: 'Booking offer: ${offer.discount}',
              );
            },
            categories: HomeMockData.categories,
            selectedCategoryId: _selectedCategoryId,
            onCategorySelected: (cat) {
              setState(() {
                _selectedCategoryId = cat.id;
              });
            },
            nearSalons: nearSalons,
            onSeeAllNearSalons: () {
              AppToast.info(context, message: 'See all near salons');
            },
            onNearSalonTap: (salon) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => StoreDetailView(storeId: salon.id),
                ),
              );
            },
            onNearSalonBook: (salon) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => StoreDetailView(storeId: salon.id),
                ),
              );
            },
            recommendedSalons: recommendedSalons,
            onSeeAllRecommended: () {
              AppToast.info(context, message: 'See all recommendations');
            },
            onRecommendedSalonTap: (salon) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => StoreDetailView(storeId: salon.id),
                ),
              );
            },
            onFavoriteToggle: _onFavoriteToggle,
            onRefresh: () async {
              context.read<HomeBloc>().add(const HomeRefreshed());
              await Future.delayed(const Duration(milliseconds: 600));
            },
          ),
        ),
      ),
    );
  }
}
