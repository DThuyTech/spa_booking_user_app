import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../models/nearby_store_model.dart';

class NearbyStoreBottomSlider extends StatelessWidget {
  final List<NearbyStoreItem> stores;
  final NearbyStoreItem? selectedStore;
  final ValueChanged<NearbyStoreItem> onSelectStore;
  final ValueChanged<NearbyStoreItem> onTapDetail;
  final PageController pageController;

  const NearbyStoreBottomSlider({
    super.key,
    required this.stores,
    required this.selectedStore,
    required this.onSelectStore,
    required this.onTapDetail,
    required this.pageController,
  });

  static const Color _primaryCoral = Color(0xFFFC6E58);
  static const Color _darkEspresso = Color(0xFF2C2420);
  static const Color _secondaryText = Color(0xFF756C64);

  @override
  Widget build(BuildContext context) {
    if (stores.isEmpty) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Row(
          children: [
            Icon(LucideIcons.map_pin_off, color: _primaryCoral, size: 22),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'Không tìm thấy spa nào quanh khu vực này',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: _darkEspresso,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return SizedBox(
      height: 126,
      child: PageView.builder(
        controller: pageController,
        itemCount: stores.length,
        onPageChanged: (index) {
          onSelectStore(stores[index]);
        },
        itemBuilder: (context, index) {
          final store = stores[index];
          final isSelected = selectedStore?.id == store.id;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? _primaryCoral : const Color(0xFFF0EBE6),
                  width: isSelected ? 1.8 : 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isSelected
                        ? _primaryCoral.withValues(alpha: 0.16)
                        : Colors.black.withValues(alpha: 0.06),
                    blurRadius: isSelected ? 16 : 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: () {
                    onSelectStore(store);
                    onTapDetail(store);
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        // Store Thumbnail
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: SizedBox(
                            width: 95,
                            height: double.infinity,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.network(
                                  store.imageUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                        color: const Color(0xFFF3ECE5),
                                        child: const Icon(
                                          LucideIcons.store,
                                          color: Color(0xFFB3A8A0),
                                          size: 26,
                                        ),
                                      ),
                                ),
                                if (store.promoBadge != null)
                                  Positioned(
                                    top: 6,
                                    left: 6,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 5,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: _primaryCoral,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        store.promoBadge!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 9,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),

                        // Store Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Name
                              Text(
                                store.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  color: _darkEspresso,
                                ),
                              ),
                              const SizedBox(height: 3),

                              // Rating + Distance
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star_rounded,
                                    size: 15,
                                    color: Color(0xFFF59E0B),
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    store.rating.toStringAsFixed(1),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: _darkEspresso,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    width: 3,
                                    height: 3,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFCCC2B8),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  const Icon(
                                    LucideIcons.navigation,
                                    size: 11,
                                    color: _primaryCoral,
                                  ),
                                  const SizedBox(width: 3),
                                  Expanded(
                                    child: Text(
                                      store.distanceText,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: _primaryCoral,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 3),

                              // Address snippet
                              Text(
                                store.address,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: _secondaryText,
                                ),
                              ),
                              const SizedBox(height: 5),

                              // Bottom Row: Price + Book Action
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Từ ${store.priceFrom}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800,
                                      color: _darkEspresso,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFAF5EE),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Đặt lịch',
                                          style: TextStyle(
                                            color: _primaryCoral,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(width: 3),
                                        Icon(
                                          LucideIcons.chevron_right,
                                          size: 13,
                                          color: _primaryCoral,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
