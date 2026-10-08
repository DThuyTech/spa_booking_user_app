import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_booking/src/app/router/app_router.gr.dart';
import 'package:spa_booking/src/core/extensions/double_extensions.dart';
import 'package:spa_booking/src/domain/entities/store/store_full_detail_entity.dart';
import 'package:spa_booking/src/presentation/bloc/review/store_reviews/store_reviews_bloc.dart';
import 'package:spa_booking/src/presentation/bloc/store/store_detail/store_detail_bloc.dart';
import 'package:spa_booking/src/presentation/view/booking_flow/booking_schedule/view/booking_schedule_view.dart';
import 'package:spa_booking/src/presentation/view/store_detail/body_view/store_detail_body_view.dart';
import 'package:spa_booking/src/presentation/view/store_detail/sections/store_detail_bottom_bar_section.dart';
import 'package:spa_booking/src/presentation/view/store_detail/sections/store_detail_tab_bar_section.dart';
import 'package:spa_booking/src/shared/shared.dart';

class StoreDetailContentView extends StatefulWidget {
  final String storeId;

  const StoreDetailContentView({super.key, required this.storeId});

  @override
  State<StoreDetailContentView> createState() => _StoreDetailContentViewState();
}

class _StoreDetailContentViewState extends State<StoreDetailContentView> {
  StoreDetailTab _activeTab = StoreDetailTab.overview;

  void _onShare(StoreFullDetailEntity store) {
    AppToastHelper.showInfo(
      context,
      message: 'Share link copied for ${store.name}',
    );
  }

  void _onBookSeat(StoreFullDetailEntity store) {
    context.router.push(
      SelectServicesRoute(
        storeId: widget.storeId,
        salonName: store.name,
        initialServices: [],
        initialStaffMembers: [],
      ),
    );
  }

  // void _onBookService(StoreFullDetailEntity store) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (_) => SelectServicesView(
  //         storeId: widget.storeId,
  //         salonName: _store.name,
  //         initialSelectedServiceId: service.id,
  //         initialServices: _getInitialBookingServices(service.id),
  //         initialStaffMembers: _getInitialStaffMembers(),
  //       ),
  //     ),
  //   );
  // }

  void _onBookAppointment(StoreFullDetailEntity store) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) =>
            BookingScheduleView(storeId: widget.storeId, salonName: store.name),
      ),
    );
  }

  // void _onGetDirections() {
  //   AppToastHelper.showInfo(
  //     context,
  //     message: 'Opening directions to ${_store.address}',
  //   );
  // }

  // void _onPhotoTap(StoreGalleryPhotoItem photo) {
  //   AppToastHelper.showInfo(
  //     context,
  //     message: 'Viewing photo: ${photo.category}',
  //   );
  // }

  // void _onViewAllReviews() {
  //   AppToastHelper.showInfo(
  //     context,
  //     message: 'Displaying all ${_store.} customer reviews',
  //   );
  // }

  // String _getInitials(String name) {
  //   final trimmed = name.trim();
  //   if (trimmed.isEmpty) return 'U';
  //   final parts = trimmed.split(RegExp(r'\s+'));
  //   if (parts.length >= 2) {
  //     return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  //   }
  //   return trimmed.substring(0, trimmed.length >= 2 ? 2 : 1).toUpperCase();
  // }

  // Color _getAvatarColor(String id) {
  //   const colors = [
  //     Color(0xFFE8F5E9),
  //     Color(0xFFE3F2FD),
  //     Color(0xFFF3E5F5),
  //     Color(0xFFFFF3E0),
  //     Color(0xFFFFEBEE),
  //   ];
  //   return colors[id.hashCode.abs() % colors.length];
  // }

  void _onWriteReview(StoreFullDetailEntity store) async {
    final result = await context.router.push(
      WriteReviewRoute(
        storeId: store.id,
        salonName: store.name,
        logoUrl: store.logoUrl,
      ),
    );

    if (result == true && mounted) {
      AppToastHelper.showSuccess(
        context,
        message: 'Review recorded for ${store.name}',
      );
      final effectiveId = widget.storeId;
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
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<StoreDetailBloc, StoreDetailState>(
            listener: (context, state) {
              if (state.isFailure && state.failure != null) {
                AppToastHelper.showError(context, error: state.failure);
              }
            },
          ),

          BlocListener<StoreReviewsBloc, StoreReviewsState>(
            listener: (context, state) {
              if (state.isFailure && state.failure != null) {
                AppToastHelper.showError(context, error: state.failure);
              }
            },
          ),
        ],
        child: BlocBuilder<StoreDetailBloc, StoreDetailState>(
          builder: (context, detailState) {
            StoreFullDetailEntity? displayStore = detailState.detail;
            return _buildScaffold(context, displayStore, detailState.isLoading);
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder<StoreDetailBloc, StoreDetailState>(
        builder: (context, state) {
          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(color: Color(0xFFFA7762)),
            );
          }
          if (state.detail == null) return SizedBox();
          return StoreDetailBottomBarSection(
            activeTab: _activeTab,
            startingPrice: 'From ${state.detail!.minPrice.toVnd()}',
            seatsText: '0',
            onBookNow: () => _onBookSeat(state.detail!),
            onBookAppointment: () => _onBookAppointment(state.detail!),
          );
        },
      ),
    );
  }

  Widget _buildScaffold(
    BuildContext context,
    StoreFullDetailEntity? displayStore,
    bool isLoading,
  ) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator(color: Color(0xFFFA7762)));
    }
    if (displayStore == null) return SizedBox();
    return StoreDetailBodyView(
      store: displayStore,
      activeTab: _activeTab,
      onTabChanged: (tab) {
        setState(() {
          _activeTab = tab;
        });
      },
      onBackTap: () => Navigator.of(context).maybePop(),
      onFavoriteToggle: (val) {
        context.read<StoreDetailBloc>().add(
          ToggleStoreFavoriteEvent(storeId: displayStore.id, isFavorite: val),
        );
        if (val) {
          AppToastHelper.showSuccess(
            context,
            message: 'Added ${displayStore.name} to favorites',
          );
        } else {
          AppToastHelper.showInfo(
            context,
            message: 'Removed ${displayStore.name} from favorites',
          );
        }
      },
      onShareTap: () => _onShare(displayStore),
      onBookSeat: () => _onBookSeat(displayStore),
      onBookService: (val) {},
      // onPhotoTap: _onPhotoTap,
      onGetDirections: () {},
      onViewAllReviews: () {},
      onWriteReview: () => _onWriteReview(displayStore),
    );
  }
}
