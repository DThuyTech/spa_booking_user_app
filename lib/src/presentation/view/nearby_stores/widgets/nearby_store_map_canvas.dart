import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../models/nearby_store_model.dart';

class NearbyStoreMapCanvas extends StatelessWidget {
  final List<NearbyStoreItem> stores;
  final NearbyStoreItem? selectedStore;
  final ValueChanged<NearbyStoreItem?> onSelectStore;
  final ValueChanged<NearbyStoreItem> onTapStoreDetail;
  final VoidCallback? onDirections;
  final MapController mapController;
  final LatLng userLocation;

  static const Color _primaryCoral = Color(0xFFFC6E58);
  static const Color _darkEspresso = Color(0xFF2C2420);

  const NearbyStoreMapCanvas({
    super.key,
    required this.stores,
    required this.selectedStore,
    required this.onSelectStore,
    required this.onTapStoreDetail,
    this.onDirections,
    required this.mapController,
    this.userLocation = const LatLng(
      NearbyStoreMockData.userLatitude,
      NearbyStoreMockData.userLongitude,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: userLocation,
        initialZoom: 15.0,
        minZoom: 11.0,
        maxZoom: 18.5,
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
        ),
        onTap: (tapPosition, point) => onSelectStore(null),
      ),
      children: [
        // Default standard OpenStreetMap tiles (no API key required)
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.aura.spa_booking',
          maxZoom: 19,
        ),

        // Store Markers & User Location Marker
        MarkerLayer(
          markers: [
            // 1. User Location Marker
            Marker(
              point: userLocation,
              width: 50,
              height: 50,
              alignment: Alignment.center,
              child: _buildUserLocationMarker(),
            ),

            // 2. Spa Store Markers
            ...stores.map((store) {
              final isSelected = store.id == selectedStore?.id;
              final markerWidth = isSelected ? 150.0 : 100.0;
              final markerHeight = isSelected ? 65.0 : 45.0;

              return Marker(
                point: LatLng(store.latitude, store.longitude),
                width: markerWidth,
                height: markerHeight,
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  onTap: () => onSelectStore(store),
                  behavior: HitTestBehavior.opaque,
                  child: _buildStorePin(store, isSelected),
                ),
              );
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildUserLocationMarker() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: _primaryCoral.withValues(alpha: 0.18),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: _primaryCoral,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
            boxShadow: [
              BoxShadow(
                color: _primaryCoral.withValues(alpha: 0.45),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStorePin(NearbyStoreItem store, bool isSelected) {
    if (isSelected) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: _primaryCoral,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: [
                BoxShadow(
                  color: _primaryCoral.withValues(alpha: 0.4),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.12),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.star_rounded,
                  size: 15,
                  color: Color(0xFFFFD166),
                ),
                const SizedBox(width: 3),
                Text(
                  store.rating.toStringAsFixed(1),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 5),
                Flexible(
                  child: Text(
                    store.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_drop_down, color: _primaryCoral, size: 16),
        ],
      );
    }

    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFF0EBE6), width: 1.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(LucideIcons.sparkles, size: 12, color: _primaryCoral),
            const SizedBox(width: 4),
            Text(
              store.priceFrom,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: _darkEspresso,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
