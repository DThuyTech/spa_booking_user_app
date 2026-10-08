import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../../shared/shared.dart';

class StoreLocationCard extends StatelessWidget {
  final double longtitude;
  final double latitude;
  final String address;
  final String city;
  final String district;
  final VoidCallback? onGetDirections;

  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF71717A);
  static const Color _coralColor = Color(0xFFFF6F59);

  const StoreLocationCard({
    super.key,
    this.onGetDirections,
    required this.longtitude,
    required this.latitude,
    required this.address,
    required this.city,
    required this.district,
  });

  @override
  Widget build(BuildContext context) {
    final hasValidCoords = latitude != 0 || longtitude != 0;
    final centerPoint = LatLng(
      hasValidCoords ? latitude : 10.7769,
      hasValidCoords ? longtitude : 106.7009,
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.location,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: _textDark,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 14),

          // Map preview container using FlutterMap (OpenStreetMap, no API key required)
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: 150,
              width: double.infinity,
              child: Stack(
                children: [
                  FlutterMap(
                    options: MapOptions(
                      initialCenter: centerPoint,
                      initialZoom: 15.0,
                      minZoom: 11.0,
                      maxZoom: 18.0,
                      interactionOptions: const InteractionOptions(
                        flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                      ),
                      onTap: (_, _) => onGetDirections?.call(),
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.aura.spa_booking',
                        maxZoom: 19,
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: centerPoint,
                            width: 44,
                            height: 44,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: _coralColor,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: _coralColor.withValues(alpha: 0.4),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                LucideIcons.map_pin,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),

          // Address
          Text(
            address,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: _textDark,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            [district, city].where((s) => s.isNotEmpty && s != '-').join(', '),
            style: const TextStyle(fontSize: 13, color: _textMuted),
          ),
          const SizedBox(height: 16),

          // Get directions button
          AppButton(
            text: 'Get directions',
            leadingIcon: const Icon(LucideIcons.navigation, size: 16),
            onPressed: onGetDirections,
            variant: AppButtonVariant.outline,
            textColor: _textDark,
            borderRadius: BorderRadius.circular(20),
            height: 44,
            fullWidth: true,
          ),
        ],
      ),
    );
  }
}
