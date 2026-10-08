import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';
import '../../../../shared/design_system/components/sheets/app_filter_bottom_sheet.dart';

class SearchHeaderSection extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onQueryChanged;
  final VoidCallback onClearQuery;
  final VoidCallback onFilterTap;
  final SpaFilterCriteria activeFilters;
  final int resultCount;
  final ValueChanged<String>? onRemoveServiceFilter;

  static const Color _coralColor = Color(0xFFFC6E58);
  static const Color _textDark = Color(0xFF1E2022);

  const SearchHeaderSection({
    super.key,
    required this.searchController,
    required this.onQueryChanged,
    required this.onClearQuery,
    required this.onFilterTap,
    required this.activeFilters,
    required this.resultCount,
    this.onRemoveServiceFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          context.l10n.findYourSanctuary,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: _textDark,
            letterSpacing: -0.4,
          ),
        ),
        const SizedBox(height: 12),

        // Search Bar Row + Coral Filter Button
        Row(
          children: [
            Expanded(
              child: AppTextField(
                controller: searchController,
                onChanged: onQueryChanged,
                hint: 'Search salon, treatment, area...',
                hintStyle: const TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 13.5,
                  fontWeight: FontWeight.w400,
                ),
                style: const TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w500,
                  color: _textDark,
                ),
                fillColor: const Color(0xFFF4F6F8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 13,
                ),
                prefixIcon: const Icon(
                  LucideIcons.search,
                  color: Color(0xFF9CA3AF),
                  size: 20,
                ),
                suffixIcon: searchController.text.isNotEmpty
                    ? AppIconButton(
                        icon: LucideIcons.x,
                        size: AppIconButtonSize.sm,
                        onPressed: onClearQuery,
                        color: const Color(0xFF9CA3AF),
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 10),

            // Coral Filter Button
            AppIconButton(
              icon: LucideIcons.sliders_horizontal,
              onPressed: onFilterTap,
              backgroundColor: _coralColor,
              iconColor: Colors.white,
              dimension: 48,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: _coralColor.withValues(alpha: 0.35),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          ],
        ),

        // Active Filter Chips
        if (activeFilters.services.isNotEmpty ||
            activeFilters.distanceKm < 50) ...[
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                // Distance Chip
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: _coralColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _coralColor.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        LucideIcons.map_pin,
                        size: 12,
                        color: _coralColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Within ${activeFilters.distanceKm.toStringAsFixed(0)} km',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: _coralColor,
                        ),
                      ),
                    ],
                  ),
                ),

                // Services Chips
                ...activeFilters.services.map((service) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          service,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF4B5563),
                          ),
                        ),
                        if (onRemoveServiceFilter != null) ...[
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () => onRemoveServiceFilter!(service),
                            child: const Icon(
                              LucideIcons.x,
                              size: 12,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],

        const SizedBox(height: 14),

        // Result Count Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Found $resultCount salons near you',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6B7280),
              ),
            ),
            Row(
              children: [
                const Icon(
                  LucideIcons.arrow_down_up,
                  size: 13,
                  color: Color(0xFF6B7280),
                ),
                const SizedBox(width: 4),
                Text(
                  context.l10n.topRated,
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
