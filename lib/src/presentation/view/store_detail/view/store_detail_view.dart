import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/di/dependency_injection.dart';
import '../../../../shared/utils/app_toast_helper.dart';
import '../../../bloc/review/store_reviews/store_reviews_bloc.dart';
import '../../../bloc/store/store_detail/store_detail_bloc.dart';
import '../../../bloc/store/store_services/store_services_bloc.dart';
import '../../../bloc/store/store_staff/store_staff_bloc.dart';
import '../../booking_flow/booking_schedule/view/booking_schedule_view.dart';
import '../../booking_flow/models/booking_models.dart';
import '../../booking_flow/select_services/view/select_services_view.dart';
import '../../write_review/view/write_review_view.dart';
import '../body_view/store_detail_body_view.dart';
import '../mockup_data/store_detail_mock_data.dart';
import '../sections/store_detail_bottom_bar_section.dart';
import '../sections/store_detail_tab_bar_section.dart';

@RoutePage()
class StoreDetailPage extends StatelessWidget {
  final String? storeId;
  final StoreDetailItem? initialStore;

  const StoreDetailPage({super.key, this.storeId, this.initialStore});

  @override
  Widget build(BuildContext context) {
    final effectiveId = storeId ?? initialStore?.id ?? 'store_1';
    return MultiBlocProvider(
      providers: [
        BlocProvider<StoreDetailBloc>(
          create: (_) => sl<StoreDetailBloc>()
            ..add(FetchStoreDetailEvent(effectiveId)),
        ),
        BlocProvider<StoreServicesBloc>(
          create: (_) => sl<StoreServicesBloc>()
            ..add(LoadCategoriesAndServicesEvent(storeId: effectiveId)),
        ),
        BlocProvider<StoreStaffBloc>(
          create: (_) => sl<StoreStaffBloc>()
            ..add(FetchStaffEvent(storeId: effectiveId)),
        ),
        if (sl.isRegistered<StoreReviewsBloc>())
          BlocProvider<StoreReviewsBloc>(
            create: (_) => sl<StoreReviewsBloc>()
              ..add(FetchStoreReviewsEvent(storeId: effectiveId)),
          ),
      ],
      child: StoreDetailView(storeId: effectiveId, initialStore: initialStore),
    );
  }
}

class StoreDetailView extends StatelessWidget {
  final String? storeId;
  final StoreDetailItem? initialStore;

  const StoreDetailView({super.key, this.storeId, this.initialStore});

  @override
  Widget build(BuildContext context) {
    final effectiveId = storeId ?? initialStore?.id;
    final hasBloc =
        context.findAncestorWidgetOfExactType<BlocProvider<StoreDetailBloc>>() !=
            null;
    final canResolveBloc = sl.isRegistered<StoreDetailBloc>();

    if (!hasBloc && effectiveId != null && effectiveId.isNotEmpty && canResolveBloc) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<StoreDetailBloc>(
            create: (_) => sl<StoreDetailBloc>()
              ..add(FetchStoreDetailEvent(effectiveId)),
          ),
          BlocProvider<StoreServicesBloc>(
            create: (_) => sl<StoreServicesBloc>()
              ..add(LoadCategoriesAndServicesEvent(storeId: effectiveId)),
          ),
          BlocProvider<StoreStaffBloc>(
            create: (_) => sl<StoreStaffBloc>()
              ..add(FetchStaffEvent(storeId: effectiveId)),
          ),
          if (sl.isRegistered<StoreReviewsBloc>())
            BlocProvider<StoreReviewsBloc>(
              create: (_) => sl<StoreReviewsBloc>()
                ..add(FetchStoreReviewsEvent(storeId: effectiveId)),
            ),
        ],
        child: _StoreDetailContentView(
          storeId: effectiveId,
          initialStore: initialStore,
        ),
      );
    }

    return _StoreDetailContentView(
      storeId: effectiveId,
      initialStore: initialStore,
    );
  }
}

class _StoreDetailContentView extends StatefulWidget {
  final String? storeId;
  final StoreDetailItem? initialStore;

  const _StoreDetailContentView({this.storeId, this.initialStore});

  @override
  State<_StoreDetailContentView> createState() =>
      _StoreDetailContentViewState();
}

class _StoreDetailContentViewState extends State<_StoreDetailContentView> {
  late StoreDetailItem _store;
  StoreDetailTab _activeTab = StoreDetailTab.overview;

  @override
  void initState() {
    super.initState();
    _store = widget.initialStore ?? StoreDetailMockData.luxeSalon;
  }

  void _onFavoriteToggle(bool isFavorite) {
    setState(() {
      _store = _store.copyWith(isFavorite: isFavorite);
    });
    AppToastHelper.showInfo(
      context,
      message: isFavorite
          ? 'Added ${_store.name} to favorites'
          : 'Removed from favorites',
    );
  }

  void _onShare() {
    AppToastHelper.showInfo(
      context,
      message: 'Share link copied for ${_store.name}',
    );
  }

  List<BookingServiceItem>? _getInitialBookingServices([String? selectedServiceId]) {
    try {
      final servicesBloc = context.read<StoreServicesBloc>();
      final state = servicesBloc.state;
      if (state.isLoaded && state.services.isNotEmpty) {
        final categoryNames = {
          for (final c in state.categories) c.id: c.name,
        };
        return state.services.map((s) {
          final cat = (s.categoryId != null && categoryNames.containsKey(s.categoryId))
              ? categoryNames[s.categoryId]!
              : 'Services';
          final formattedPrice = s.price >= 1000
              ? '${s.price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} VND'
              : '\$${s.price.toStringAsFixed(0)}';
          return BookingServiceItem(
            id: s.id,
            category: cat,
            name: s.name,
            duration: '${s.durationMinutes} min',
            durationMinutes: s.durationMinutes,
            price: s.price,
            priceDisplay: formattedPrice,
            isSelected: selectedServiceId != null ? (s.id == selectedServiceId) : false,
          );
        }).toList();
      }
    } catch (_) {}

    if (_store.serviceGroups.isNotEmpty) {
      final list = <BookingServiceItem>[];
      for (final group in _store.serviceGroups) {
        for (final s in group.services) {
          final match = RegExp(r'(\d+)').firstMatch(s.duration);
          final mins = match != null ? int.tryParse(match.group(1) ?? '0') : null;
          list.add(
            BookingServiceItem(
              id: s.id,
              category: group.categoryName,
              name: s.name,
              duration: s.duration,
              durationMinutes: mins,
              price: s.price.toInt(),
              priceDisplay: s.priceDisplay,
              isSelected: selectedServiceId != null ? (s.id == selectedServiceId) : false,
            ),
          );
        }
      }
      return list;
    }
    return null;
  }

  List<BookingStaffItem>? _getInitialStaffMembers() {
    try {
      final staffBloc = context.read<StoreStaffBloc>();
      final state = staffBloc.state;
      if (state.isLoaded && state.staffList.isNotEmpty) {
        const colors = [
          Color(0xFFB2EBF2),
          Color(0xFFE1BEE7),
          Color(0xFFF8BBD0),
          Color(0xFFB2DFDB),
        ];
        return state.staffList.asMap().entries.map((entry) {
          final idx = entry.key;
          final s = entry.value;
          return BookingStaffItem(
            id: s.staffProfileId,
            name: s.fullName,
            initials: _getInitials(s.fullName),
            avatarBgColor: colors[idx % colors.length],
            photoUrl: s.avatarUrl,
            isOff: false,
          );
        }).toList();
      }
    } catch (_) {}
    return null;
  }

  void _onBookSeat() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SelectServicesView(
          storeId: widget.storeId ?? _store.id,
          salonName: _store.name,
          initialServices: _getInitialBookingServices(),
          initialStaffMembers: _getInitialStaffMembers(),
        ),
      ),
    );
  }

  void _onBookService(StoreServiceItem service) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SelectServicesView(
          storeId: widget.storeId ?? _store.id,
          salonName: _store.name,
          initialSelectedServiceId: service.id,
          initialServices: _getInitialBookingServices(service.id),
          initialStaffMembers: _getInitialStaffMembers(),
        ),
      ),
    );
  }

  void _onBookAppointment() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BookingScheduleView(
          storeId: widget.storeId ?? _store.id,
          salonName: _store.name,
        ),
      ),
    );
  }

  void _onGetDirections() {
    AppToastHelper.showInfo(
      context,
      message: 'Opening directions to ${_store.location.address}',
    );
  }

  void _onPhotoTap(StoreGalleryPhotoItem photo) {
    AppToastHelper.showInfo(
      context,
      message: 'Viewing photo: ${photo.category}',
    );
  }

  void _onViewAllReviews() {
    AppToastHelper.showInfo(
      context,
      message: 'Displaying all ${_store.reviewCount} customer reviews',
    );
  }

  String _formatTimeAgo(DateTime dateTime) {
    final diff = DateTime.now().difference(dateTime);
    if (diff.inDays > 365) {
      return '${(diff.inDays / 365).floor()}y ago';
    } else if (diff.inDays > 30) {
      return '${(diff.inDays / 30).floor()}mo ago';
    } else if (diff.inDays > 0) {
      return '${diff.inDays}d ago';
    } else if (diff.inHours > 0) {
      return '${diff.inHours}h ago';
    } else if (diff.inMinutes > 0) {
      return '${diff.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  String _getInitials(String name) {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return 'U';
    final parts = trimmed.split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }
    return trimmed.substring(0, trimmed.length >= 2 ? 2 : 1).toUpperCase();
  }

  Color _getAvatarColor(String id) {
    const colors = [
      Color(0xFFE8F5E9),
      Color(0xFFE3F2FD),
      Color(0xFFF3E5F5),
      Color(0xFFFFF3E0),
      Color(0xFFFFEBEE),
    ];
    return colors[id.hashCode.abs() % colors.length];
  }

  void _onWriteReview() async {
    final result = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) => WriteReviewView(
          salonName: _store.name,
          logoUrl: _store.coverImageUrl,
        ),
      ),
    );
    if (result == true && mounted) {
      AppToastHelper.showSuccess(
        context,
        message: 'Review recorded for ${_store.name}',
      );
      final effectiveId = widget.storeId ?? _store.id;
      if (mounted) {
        try {
          context.read<StoreReviewsBloc>().add(
                FetchStoreReviewsEvent(storeId: effectiveId, isRefresh: true),
              );
        } catch (_) {}
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasBloc = context.findAncestorWidgetOfExactType<BlocProvider<StoreDetailBloc>>() != null;
    if (!hasBloc) {
      return _buildScaffold(context, _store, false);
    }

    final hasReviewsBloc = sl.isRegistered<StoreReviewsBloc>() &&
        context.findAncestorWidgetOfExactType<BlocProvider<StoreReviewsBloc>>() != null;

    return MultiBlocListener(
      listeners: [
        BlocListener<StoreDetailBloc, StoreDetailState>(
          listener: (context, state) {
            if (state.isFailure && state.failure != null) {
              AppToastHelper.showError(
                context,
                error: state.failure,
              );
            }
          },
        ),
        BlocListener<StoreServicesBloc, StoreServicesState>(
          listener: (context, state) {
            if (state.isFailure && state.failure != null) {
              AppToastHelper.showError(
                context,
                error: state.failure,
              );
            }
          },
        ),
        if (hasReviewsBloc)
          BlocListener<StoreReviewsBloc, StoreReviewsState>(
            listener: (context, state) {
              if (state.isFailure && state.failure != null) {
                AppToastHelper.showError(
                  context,
                  error: state.failure,
                );
              }
            },
          ),
      ],
      child: BlocBuilder<StoreDetailBloc, StoreDetailState>(
        builder: (context, detailState) {
          final servicesState = context.watch<StoreServicesBloc>().state;
          final reviewsState = hasReviewsBloc
              ? context.watch<StoreReviewsBloc>().state
              : null;

          StoreDetailItem displayStore = _store;
          if (detailState.isLoaded && detailState.detail != null) {
            final real = detailState.detail!;
            Map<String, String> schedule = {};
            for (final bh in real.businessHours) {
              schedule[bh.dayName] = bh.isOpen
                  ? '${bh.openTime} - ${bh.closeTime}'
                  : 'Closed';
            }

            displayStore = displayStore.copyWith(
              id: real.id,
              name: real.name,
              coverImageUrl:
                  real.coverUrl ?? real.logoUrl ?? displayStore.coverImageUrl,
              aboutDescription:
                  real.description ?? displayStore.aboutDescription,
              distance: real.address.contains(',')
                  ? real.address.split(',').last.trim()
                  : real.address,
              location: StoreLocationItem(
                address: real.address,
                cityStateZip: real.address,
                latitude: displayStore.location.latitude,
                longitude: displayStore.location.longitude,
                mapImageUrl: displayStore.location.mapImageUrl,
              ),
              openingHours: schedule.isNotEmpty
                  ? StoreOpeningHoursItem(
                      todayHours: 'Today: ${schedule.values.first}',
                      weeklySchedule: schedule,
                    )
                  : displayStore.openingHours,
              galleryPhotos: real.images.isNotEmpty
                  ? real.images
                      .map((url) => StoreGalleryPhotoItem(
                            id: url,
                            imageUrl: url,
                            category: 'Interior',
                          ))
                      .toList()
                  : displayStore.galleryPhotos,
            );
          }

          if (servicesState.isLoaded && servicesState.services.isNotEmpty) {
            final catMap = <String, List<StoreServiceItem>>{};
            final categoryNameMap = {
              for (final cat in servicesState.categories) cat.id: cat.name
            };

            for (final s in servicesState.services) {
              final catName = (s.categoryId != null &&
                      categoryNameMap.containsKey(s.categoryId))
                  ? categoryNameMap[s.categoryId]!
                  : 'Services';
              final formattedPrice = s.price >= 1000
                  ? '${s.price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} VND'
                  : '\$${s.price.toStringAsFixed(0)}';
              final item = StoreServiceItem(
                id: s.id,
                name: s.name,
                badge: (s.originalPrice != null && s.originalPrice! > s.price)
                    ? 'Special'
                    : null,
                description: s.description ?? '',
                duration: '${s.durationMinutes} min',
                price: s.price.toDouble(),
                priceDisplay: formattedPrice,
              );
              catMap.putIfAbsent(catName, () => []).add(item);
            }
            final groups = catMap.entries
                .map((e) => StoreServiceCategoryGroup(
                      categoryName: e.key,
                      services: e.value,
                    ))
                .toList();

            final overviewServices = servicesState.services.take(4).map((s) {
              final formattedPrice = s.price >= 1000
                  ? '${s.price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} VND'
                  : '\$${s.price.toStringAsFixed(0)}';
              return StoreOverviewServiceItem(
                title: s.name,
                duration: '${s.durationMinutes} min',
                price: formattedPrice,
              );
            }).toList();

            final minPrice = servicesState.services
                .map((s) => s.price)
                .reduce((a, b) => a < b ? a : b);
            final startingPrice = minPrice >= 1000
                ? 'From ${minPrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} VND'
                : 'From \$${minPrice.toStringAsFixed(0)}';

            displayStore = displayStore.copyWith(
              serviceGroups: groups,
              overviewServices: overviewServices,
              startingPrice: startingPrice,
            );
          } else if (servicesState.isLoaded && servicesState.services.isEmpty) {
            displayStore = displayStore.copyWith(
              serviceGroups: const [],
              overviewServices: const [],
            );
          }

          if (reviewsState != null &&
              reviewsState.isLoaded &&
              reviewsState.reviewData != null) {
            final reviewData = reviewsState.reviewData!;
            final total = reviewData.totalReviews > 0 ? reviewData.totalReviews : 1;
            final starRatios = {
              5: reviewData.ratingDistribution.star5 / total,
              4: reviewData.ratingDistribution.star4 / total,
              3: reviewData.ratingDistribution.star3 / total,
              2: reviewData.ratingDistribution.star2 / total,
              1: reviewData.ratingDistribution.star1 / total,
            };

            final convertedReviews = reviewData.items
                .map((r) => StoreReviewItem(
                      id: r.id,
                      author: r.customerName,
                      authorInitials: _getInitials(r.customerName),
                      avatarBgColor: _getAvatarColor(r.id),
                      timeAgo: _formatTimeAgo(r.createdAt),
                      rating: r.rating,
                      content: r.comment,
                    ))
                .toList();

            displayStore = displayStore.copyWith(
              rating: reviewData.averageRating,
              reviewCount: reviewData.totalReviews,
              ratingSummary: StoreRatingSummary(
                averageRating: reviewData.averageRating,
                totalReviews: reviewData.totalReviews,
                starRatios: starRatios,
              ),
              reviews: convertedReviews,
            );
          }

          return _buildScaffold(context, displayStore, detailState.isLoading);
        },
      ),
    );
  }

  Widget _buildScaffold(
    BuildContext context,
    StoreDetailItem displayStore,
    bool isLoading,
  ) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(color: Color(0xFFFA7762)),
              )
            : StoreDetailBodyView(
                store: displayStore,
                activeTab: _activeTab,
                onTabChanged: (tab) {
                  setState(() {
                    _activeTab = tab;
                  });
                },
                onBackTap: () => Navigator.of(context).maybePop(),
                onFavoriteToggle: _onFavoriteToggle,
                onShareTap: _onShare,
                onBookSeat: _onBookSeat,
                onBookService: _onBookService,
                onPhotoTap: _onPhotoTap,
                onGetDirections: _onGetDirections,
                onViewAllReviews: _onViewAllReviews,
                onWriteReview: _onWriteReview,
              ),
        bottomNavigationBar: StoreDetailBottomBarSection(
          activeTab: _activeTab,
          startingPrice: 'From ${displayStore.startingPrice}',
          seatsText: displayStore.seatsText,
          onBookNow: _onBookSeat,
          onBookAppointment: _onBookAppointment,
        ),
      ),
    );
  }
}


