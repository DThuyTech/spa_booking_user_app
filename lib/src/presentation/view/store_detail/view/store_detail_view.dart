import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../shared/widgets/toast/app_toast.dart';
import '../../booking_flow/booking_schedule/view/booking_schedule_view.dart';
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
    return StoreDetailView(storeId: storeId, initialStore: initialStore);
  }
}

class StoreDetailView extends StatefulWidget {
  final String? storeId;
  final StoreDetailItem? initialStore;

  const StoreDetailView({super.key, this.storeId, this.initialStore});

  @override
  State<StoreDetailView> createState() => _StoreDetailViewState();
}

class _StoreDetailViewState extends State<StoreDetailView> {
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
    AppToast.info(
      context,
      message: isFavorite
          ? 'Added ${_store.name} to favorites'
          : 'Removed from favorites',
    );
  }

  void _onShare() {
    AppToast.info(context, message: 'Share link copied for ${_store.name}');
  }

  void _onBookSeat() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SelectServicesView(salonName: _store.name),
      ),
    );
  }

  void _onBookService(StoreServiceItem service) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SelectServicesView(salonName: _store.name),
      ),
    );
  }

  void _onBookAppointment() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BookingScheduleView(salonName: _store.name),
      ),
    );
  }

  void _onGetDirections() {
    AppToast.info(
      context,
      message: 'Opening directions to ${_store.location.address}',
    );
  }

  void _onPhotoTap(StoreGalleryPhotoItem photo) {
    AppToast.info(context, message: 'Viewing photo: ${photo.category}');
  }

  void _onViewAllReviews() {
    AppToast.info(
      context,
      message: 'Displaying all ${_store.reviewCount} customer reviews',
    );
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
      AppToast.success(context, message: 'Review recorded for ${_store.name}');
    }
  }

  @override
  Widget build(BuildContext context) {
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
        body: StoreDetailBodyView(
          store: _store,
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
          startingPrice: 'From ${_store.startingPrice}',
          seatsText: _store.seatsText,
          onBookNow: _onBookSeat,
          onBookAppointment: _onBookAppointment,
        ),
      ),
    );
  }
}
