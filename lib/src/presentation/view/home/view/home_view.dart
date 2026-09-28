import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/di/dependency_injection.dart';
import '../../../../shared/design_system/components/sheets/app_filter_bottom_sheet.dart';
import '../../../../shared/widgets/toast/app_toast.dart';
import '../../../bloc/auth_session/auth_session_bloc.dart';
import '../../../bloc/home/home_bloc.dart';
import '../../../bloc/home/home_event.dart';
import '../../notification/notification_dashboard/view/notification_dashboard_view.dart';
import '../../store_detail/view/store_detail_view.dart';
import '../body_view/home_body_view.dart';
import '../mockup_data/home_mock_data.dart';
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

  late List<HomeRecommendedSalonItem> _recommendedSalons;

  @override
  void initState() {
    super.initState();
    _recommendedSalons = List.from(HomeMockData.recommendedSalons);
  }

  void _onFavoriteToggle(HomeRecommendedSalonItem item) {
    setState(() {
      final index = _recommendedSalons.indexWhere((s) => s.id == item.id);
      if (index != -1) {
        final current = _recommendedSalons[index];
        _recommendedSalons[index] = HomeRecommendedSalonItem(
          id: current.id,
          name: current.name,
          categoryLocation: current.categoryLocation,
          rating: current.rating,
          reviewCount: current.reviewCount,
          imageUrl: current.imageUrl,
          isFavorite: !current.isFavorite,
        );
      }
    });
    AppToast.info(
      context,
      message: item.isFavorite
          ? 'Removed from favorites'
          : 'Added to favorites',
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

  @override
  Widget build(BuildContext context) {
    final authUser = context.watch<AuthSessionBloc>().state.user;
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
            upcomingAppointment: HomeMockData.upcomingAppointment,
            onAppointmentTap: () {
              AppToast.info(
                context,
                message:
                    'Appointment: ${HomeMockData.upcomingAppointment.salonName}',
              );
            },
            nearSalons: HomeMockData.nearSalons,
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
            recommendedSalons: _recommendedSalons,
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
