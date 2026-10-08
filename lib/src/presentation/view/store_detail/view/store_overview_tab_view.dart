import 'package:flutter/material.dart';
import 'package:spa_booking/src/domain/entities/store/store.dart';
import '../widgets/store_about_card.dart';
import '../widgets/store_available_now_card.dart';
import '../widgets/store_location_card.dart';
import '../widgets/store_opening_hours_card.dart';
import '../widgets/store_overview_services_card.dart';

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

          // 1. Available Now Card
          StoreAvailableNowCard(
            availableSeats: 4,
            estimatedWait: '~5 min',
            onBookSeat: onBookSeat,
          ),
          const SizedBox(height: 16),

          // 2. About Card
          StoreAboutCard(description: storeDetail.description ?? ''),
          const SizedBox(height: 16),

          // 3. Services Preview Card
          StoreOverviewServicesCard(
            services: store.services,
            onViewAllServices: onViewAllServices,
          ),
          const SizedBox(height: 16),

          // 4. Location Card
          StoreLocationCard(
            onGetDirections: onGetDirections,
            longtitude: storeDetail.longitude ?? 0,
            latitude: storeDetail.latitude ?? 0,
            address: storeDetail.address,
            city: storeDetail.city ?? '-',
            district: storeDetail.district ?? '-',
          ),
          const SizedBox(height: 16),

          // 5. Opening Hours Card
          StoreOpeningHoursCard(openingHours: store.businessHours?.days ?? []),
          const SizedBox(height: 16),

          // // 6. Information Card
          // StoreInformationCard(information: store.information),
          // const SizedBox(height: 24),
        ],
      ),
    );
  }
}
