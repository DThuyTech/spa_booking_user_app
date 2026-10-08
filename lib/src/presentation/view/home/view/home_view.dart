import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_booking/src/app/router/app_router.gr.dart';
import '../../../../app/di/dependency_injection.dart';
import '../../../../domain/entities/store/store_entity.dart';
import '../../../../shared/shared.dart';
import '../../../../shared/design_system/components/sheets/app_filter_bottom_sheet.dart';
import '../../../bloc/auth_session/auth_session_bloc.dart';
import '../../../bloc/home/home_bloc.dart';
import '../../../bloc/home/home_event.dart';
import '../../../bloc/home/home_state.dart';
import '../../../bloc/notification/notification_bloc.dart';
import '../body_view/home_body_view.dart';
import '../widgets/home_near_salon_card.dart';
import '../widgets/home_recommended_salon_card.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  final VoidCallback? onSearchTap;
  final VoidCallback? onAvatarTap;

  const HomePage({super.key, this.onSearchTap, this.onAvatarTap});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<HomeBloc>()..add(const HomeStarted())),
        BlocProvider(
          create: (_) =>
              sl<NotificationBloc>()..add(const FetchUnreadCountEvent()),
        ),
      ],
      child: HomeView(onSearchTap: onSearchTap, onAvatarTap: onAvatarTap),
    );
  }
}

class HomeView extends StatefulWidget {
  final VoidCallback? onSearchTap;
  final VoidCallback? onAvatarTap;

  const HomeView({super.key, this.onSearchTap, this.onAvatarTap});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _selectedCategoryId = 'haircuts';
  SpaFilterCriteria _filterCriteria = const SpaFilterCriteria();

  void _onToggleFavoriteStore(String storeId, String storeName) {
    final homeBloc = context.read<HomeBloc>();
    final isFavorite = homeBloc.state.favoriteStoreIds.contains(storeId);

    if (isFavorite) {
      homeBloc.add(RemoveFavoriteStore(storeId: storeId));
      AppToast.info(
        context,
        message: 'Đã xóa $storeName khỏi danh sách yêu thích',
        actionLabel: 'Hoàn tác',
        onAction: () {
          homeBloc.add(AddFavoriteStore(storeId: storeId));
        },
      );
    } else {
      homeBloc.add(AddFavoriteStore(storeId: storeId));
      AppToast.success(context, message: 'Đã thêm $storeName vào yêu thích');
    }
  }

  void _onFavoriteToggle(HomeRecommendedSalonItem item) {
    _onToggleFavoriteStore(item.id, item.name);
  }

  void _openFilterBottomSheet() {
    final homeState = context.read<HomeBloc>().state;
    AppFilterBottomSheet.show(
      context,
      initialCriteria: _filterCriteria.copyWith(
        location: homeState.selectedCity.isNotEmpty
            ? homeState.selectedCity
            : _filterCriteria.location,
      ),
      availableCities: homeState.cities,
      onApply: (criteria) {
        setState(() {
          _filterCriteria = criteria;
        });
        if (criteria.location.isNotEmpty &&
            criteria.location != homeState.selectedCity) {
          context.read<HomeBloc>().add(HomeCityChanged(criteria.location));
        }
        AppToast.success(
          context,
          message: 'Đã áp dụng bộ lọc: ${criteria.location}',
        );
      },
    );
  }

  void _openCitySelectionBottomSheet(
    BuildContext context,
    HomeState homeState,
  ) {
    CitySelectionBottomSheet.show(
      context,
      cities: homeState.cities,
      selectedCity: homeState.selectedCity,
      onCitySelected: (city) {
        context.read<HomeBloc>().add(HomeCityChanged(city));
        AppToast.info(context, message: 'Đã chuyển sang: $city');
      },
    );
  }

  List<HomeNearSalonItem> _mapToNearSalons(List<StoreEntity> stores) {
    if (stores.isEmpty) return const [];
    return stores.map((s) {
      return HomeNearSalonItem(
        id: s.id,
        name: s.name,
        categories: s.address.isNotEmpty ? s.address : 'Spa & Salon',
        rating: s.rating,
        distance: s.distanceKm != null
            ? '${s.distanceKm!.toStringAsFixed(1)} km'
            : (s.district?.isNotEmpty == true
                  ? s.district!
                  : (s.address.contains(',')
                        ? s.address.split(',').last.trim()
                        : (s.city?.isNotEmpty == true ? s.city! : s.address))),
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
    Set<String> favoriteStoreIds,
  ) {
    if (stores.isEmpty) return const [];
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
        isFavorite: favoriteStoreIds.contains(s.id),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final authUser = context.watch<AuthSessionBloc>().state.user;
    final homeState = context.watch<HomeBloc>().state;
    final nearSalons = _mapToNearSalons(homeState.nearbyStores);
    final nearSalonsTitle = context.l10n.nearbySalons;
    final recommendedSalons = _mapToRecommendedSalons(
      homeState.stores,
      homeState.favoriteStoreIds,
    );
    final userCity = homeState.selectedCity;
    final recommendedTitle = userCity.isNotEmpty
        ? 'Salon gợi ý tại $userCity'
        : 'Salon gợi ý cho bạn';
    final recommendedSubtitle = userCity.isNotEmpty
        ? 'Các salon nổi bật cùng thành phố với bạn'
        : 'Dành riêng cho bạn';
    final String avatarSeed = authUser?.fullName.isNotEmpty == true
        ? authUser!.fullName
        : 'KH';

    final unreadNotificationCount = context
        .watch<NotificationBloc>()
        .state
        .unreadCount;

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
          top: false,
          bottom: false,
          child: HomeBodyView(
            greetingText: 'Good morning',
            locationText: homeState.selectedCity,
            userAvatarSeed: avatarSeed,
            notificationCount: unreadNotificationCount,
            onLocationTap: () =>
                _openCitySelectionBottomSheet(context, homeState),
            onNotificationTap: () async {
              await context.router.push(const NotificationDashboardRoute());
              if (context.mounted) {
                context.read<NotificationBloc>().add(
                  const FetchUnreadCountEvent(),
                );
              }
            },
            onAvatarTap:
                widget.onAvatarTap ??
                () {
                  context.router.push(const ProfileRoute());
                },
            onSearchTap: widget.onSearchTap,
            onFilterTap: _openFilterBottomSheet,
            recentlyBookedStores: homeState.recentlyBookedStores,
            onRecentlyBookedTap: (store) {
              context.router.push(StoreDetailRoute(storeId: store.id));
            },
            onRecentlyBookedRebook: (store) {
              context.router.push(StoreDetailRoute(storeId: store.id));
            },
            favoriteStores: homeState.favoriteStores,
            onFavoriteStoreTap: (store) {
              context.router.push(StoreDetailRoute(storeId: store.id));
            },
            onFavoriteStoreToggle: (store) {
              _onToggleFavoriteStore(store.id, store.name);
            },
            onSeeAllFavoriteStores: () {
              context.router.push(const FavoriteStoresRoute());
            },
            specialOffers: const [],
            onOfferTap: (offer) {
              AppToast.info(context, message: 'Offer: ${offer.discount}');
            },
            onBookOffer: (offer) {
              AppToast.success(
                context,
                message: 'Booking offer: ${offer.discount}',
              );
            },
            selectedCategoryId: _selectedCategoryId,
            onCategorySelected: (cat) {
              setState(() {
                _selectedCategoryId = cat.id;
              });
            },
            nearSalons: nearSalons,
            nearSalonsTitle: nearSalonsTitle,
            onSeeAllNearSalons: () {
              context.router.push(
                NearbyStoresListRoute(
                  initialStores: homeState.nearbyStores,
                  city: homeState.selectedCity,
                ),
              );
            },
            onNearSalonTap: (salon) {
              context.router.push(StoreDetailRoute(storeId: salon.id));
            },
            onNearSalonBook: (salon) {
              context.router.push(StoreDetailRoute(storeId: salon.id));
            },
            recommendedSalons: recommendedSalons,
            recommendedTitle: recommendedTitle,
            recommendedSubtitle: recommendedSubtitle,
            onSeeAllRecommended: () {
              context.router.push(
                NearbyStoresListRoute(
                  initialStores: homeState.stores,
                  city: homeState.selectedCity,
                ),
              );
            },
            onRecommendedSalonTap: (salon) {
              context.router.push(StoreDetailRoute(storeId: salon.id));
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
