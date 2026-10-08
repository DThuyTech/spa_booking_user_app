import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class NearbyStoreSearchHeader extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onClearSearch;
  final VoidCallback onOpenFilter;
  final String activeFilter;
  final ValueChanged<String> onSelectFilter;
  final int totalResults;

  const NearbyStoreSearchHeader({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
    required this.onClearSearch,
    required this.onOpenFilter,
    required this.activeFilter,
    required this.onSelectFilter,
    required this.totalResults,
  });

  static const Color _primaryCoral = Color(0xFFFC6E58);
  static const Color _darkEspresso = Color(0xFF2C2420);
  static const Color _secondaryText = Color(0xFF756C64);

  static const List<String> _filters = [
    'Tất cả',
    'Gần nhất (< 1km)',
    'Đánh giá 4.8+ ⭐',
    'Đang mở cửa',
    'Ưu đãi sốc 🔥',
    'Massage Body',
    'Dưỡng sinh đông y',
    'Chăm sóc da & Nail',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Floating Search Bar Card
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: const Color(0xFFF0EBE6), width: 1.2),
            boxShadow: [
              BoxShadow(
                color: _darkEspresso.withValues(alpha: 0.08),
                blurRadius: 18,
                offset: const Offset(0, 6),
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(width: 14),
              const Icon(LucideIcons.search, size: 20, color: _primaryCoral),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: searchController,
                  onChanged: onSearchChanged,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                    color: _darkEspresso,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Tìm kiếm spa, salon, dịch vụ gần bạn...',
                    hintStyle: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFA59B91),
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
              if (searchController.text.isNotEmpty)
                IconButton(
                  icon: const Icon(
                    LucideIcons.x,
                    size: 18,
                    color: _secondaryText,
                  ),
                  onPressed: onClearSearch,
                  splashRadius: 18,
                ),
              Container(height: 24, width: 1, color: const Color(0xFFEFE8DF)),
              // Filter Button
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onOpenFilter,
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(22),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 13,
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const Icon(
                          LucideIcons.sliders_horizontal,
                          size: 19,
                          color: _darkEspresso,
                        ),
                        if (activeFilter != 'Tất cả')
                          Positioned(
                            top: -2,
                            right: -2,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: _primaryCoral,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        // Horizontal Quick Filter Chips Bar
        SizedBox(
          height: 36,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: _filters.length,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final filter = _filters[index];
              final isSelected = activeFilter == filter;

              return GestureDetector(
                onTap: () => onSelectFilter(filter),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? _primaryCoral : Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: isSelected
                          ? _primaryCoral
                          : const Color(0xFFECE5DC),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: isSelected
                            ? _primaryCoral.withValues(alpha: 0.3)
                            : Colors.black.withValues(alpha: 0.04),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      filter,
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w600,
                        color: isSelected ? Colors.white : _darkEspresso,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
