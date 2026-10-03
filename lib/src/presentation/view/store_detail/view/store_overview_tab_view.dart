import 'package:flutter/material.dart';
import '../mockup_data/store_detail_mock_data.dart';
import '../widgets/store_about_card.dart';
import '../widgets/store_available_now_card.dart';
import '../widgets/store_information_card.dart';
import '../widgets/store_location_card.dart';
import '../widgets/store_opening_hours_card.dart';
import '../widgets/store_overview_services_card.dart';

class StoreOverviewTabView extends StatelessWidget {
  final StoreDetailItem store;
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          // 1. Available Now Card
          StoreAvailableNowCard(
            availableSeats: store.availableSeats,
            estimatedWait: '~5 min',
            onBookSeat: onBookSeat,
          ),
          const SizedBox(height: 16),

          // 2. About Card
          StoreAboutCard(description: store.aboutDescription),
          const SizedBox(height: 16),

          // 3. Services Preview Card
          StoreOverviewServicesCard(
            services: store.overviewServices,
            onViewAllServices: onViewAllServices,
          ),
          const SizedBox(height: 16),

          // 4. Location Card
          StoreLocationCard(
            location: store.location,
            onGetDirections: onGetDirections,
          ),
          const SizedBox(height: 16),

          // 5. Opening Hours Card
          StoreOpeningHoursCard(openingHours: store.openingHours),
          const SizedBox(height: 16),

          // 6. Information Card
          StoreInformationCard(information: store.information),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
