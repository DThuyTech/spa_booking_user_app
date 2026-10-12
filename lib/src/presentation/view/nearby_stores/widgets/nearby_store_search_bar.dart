import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';

class NearbyStoreSearchHeader extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onClearSearch;
  final VoidCallback onOpenFilter;
  final String activeFilter;
  final ValueChanged<String> onSelectFilter;
  final int totalResults;
  final VoidCallback? onBack;

  const NearbyStoreSearchHeader({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
    required this.onClearSearch,
    required this.onOpenFilter,
    required this.activeFilter,
    required this.onSelectFilter,
    required this.totalResults,
    this.onBack,
  });

  static const Color _primaryCoral = Color(0xFFFC6E58);
  static const Color _darkEspresso = Color(0xFF2C2420);

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
        // Search Row: Back Button + AppSearchBar component
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              // Back Button
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    if (onBack != null) {
                      onBack!();
                    } else {
                      Navigator.of(context).maybePop();
                    }
                  },
                  borderRadius: BorderRadius.circular(24),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFE4DED6),
                        width: 1.2,
                      ),
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
                    child: const Center(
                      child: Icon(
                        LucideIcons.arrow_left,
                        size: 20,
                        color: _darkEspresso,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),

              // AppSearchBar component
              Expanded(
                child: AppSearchBar(
                  controller: searchController,
                  hintText: 'Tìm kiếm spa, salon gần bạn...',
                  onChanged: onSearchChanged,
                  onClear: onClearSearch,
                  onFilterTap: onOpenFilter,
                  showFilterButton: true,
                  isFilterActive: activeFilter != 'Tất cả',
                  prefixIcon: const Icon(
                    LucideIcons.search,
                    size: 19,
                    color: _primaryCoral,
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
