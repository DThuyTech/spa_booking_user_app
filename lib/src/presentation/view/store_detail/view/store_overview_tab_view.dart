import 'package:flutter/material.dart';
import 'package:spa_booking/src/domain/entities/store/store.dart';
import '../widgets/store_about_card.dart';
import '../widgets/store_location_card.dart';
import '../widgets/store_opening_hours_card.dart';

class StoreOverviewTabView extends StatelessWidget {
  final StoreFullDetailEntity store;
  final VoidCallback? onBookSeat;
  final VoidCallback? onViewAllServices;
  final VoidCallback? onGetDirections;

  const StoreOverviewTabView({
    super.key,
    required this.store,
    this.onBookSeat,
    this.onViewAllServices,
    this.onGetDirections,
  });

  @override
  Widget build(BuildContext context) {
    final storeDetail = store;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          // 1. Opening Hours Card (Giờ mở cửa)
          StoreOpeningHoursCard(openingHours: store.businessHours?.days ?? []),
          const SizedBox(height: 16),

          // 2. Location Card (Vị trí & Bản đồ)
          StoreLocationCard(
            onGetDirections: onGetDirections,
            longtitude: storeDetail.longitude ?? 0,
            latitude: storeDetail.latitude ?? 0,
            address: storeDetail.address,
            city: storeDetail.city ?? '-',
            district: storeDetail.district ?? '-',
          ),
          const SizedBox(height: 16),

          // 3. About Card (Mô tả)
          StoreAboutCard(description: storeDetail.description ?? ''),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
