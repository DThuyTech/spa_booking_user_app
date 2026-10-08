import 'package:flutter/material.dart';
import 'package:spa_booking/src/shared/shared.dart';
import '../../models/booking_models.dart';
import '../widgets/booking_service_selection_card.dart';

class SelectServicesBodyView extends StatelessWidget {
  final int selectedServiceCount;
  final String selectedDurationTotal;
  final String selectedPriceTotal;
  final TextEditingController customerSearchController;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;
  final List<BookingServiceItem> services;
  final ValueChanged<BookingServiceItem> onServiceToggle;
  final List<BookingStaffItem> staffMembers;
  final String? selectedStaffId;
  final ValueChanged<BookingStaffItem> onStaffSelected;
  final List<String>? categories;

  const SelectServicesBodyView({
    super.key,
    required this.selectedServiceCount,
    required this.selectedDurationTotal,
    required this.selectedPriceTotal,
    required this.customerSearchController,
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.services,
    required this.onServiceToggle,
    required this.staffMembers,
    required this.selectedStaffId,
    required this.onStaffSelected,
    this.categories,
  });

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF64748B);

  List<String> get _categoriesToDisplay {
    final list = <String>['All'];
    if (categories != null && categories!.isNotEmpty) {
      for (final cat in categories!) {
        final trimmed = cat.trim();
        if (trimmed.isNotEmpty && !list.contains(trimmed)) {
          list.add(trimmed);
        }
      }
    } else {
      for (final service in services) {
        final trimmed = service.category.trim();
        if (trimmed.isNotEmpty && !list.contains(trimmed)) {
          list.add(trimmed);
        }
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final filteredServices =
        (selectedCategory == 'All' || selectedCategory.isEmpty)
        ? services
        : services
              .where(
                (s) =>
                    s.category.toLowerCase() == selectedCategory.toLowerCase(),
              )
              .toList();

    // Group services by category
    final Map<String, List<BookingServiceItem>> categoryGroups = {};
    for (final service in filteredServices) {
      final cat = service.category.isNotEmpty ? service.category : 'General';
      categoryGroups.putIfAbsent(cat, () => []).add(service);
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Summary Card
          _buildSummaryCard(),

          const SizedBox(height: 20),

          // 3. Service Type Category Filter Chips
          _buildCategoryChips(context),

          const SizedBox(height: 24),

          // 4. Dynamic Category Services Group
          if (categoryGroups.isEmpty) ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 36),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Icon(
                    LucideIcons.scissors,
                    size: 36,
                    color: Color(0xFFCBD5E1),
                  ),
                  SizedBox(height: 10),
                  Text(
                    context.l10n.noServicesInCategory,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
          ] else ...[
            for (final entry in categoryGroups.entries) ...[
              _buildSectionHeader(
                entry.key.toLowerCase().contains('service')
                    ? entry.key
                    : '${entry.key} Service',
              ),
              const SizedBox(height: 12),
              ...entry.value.map(
                (service) => BookingServiceSelectionCard(
                  service: service,
                  onTap: () => onServiceToggle(service),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ],
        ],
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$selectedServiceCount Service',
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                  color: _textDark,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(LucideIcons.clock, size: 14, color: _textMuted),
                  const SizedBox(width: 5),
                  Text(
                    selectedDurationTotal,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: _textMuted,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            selectedPriceTotal,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: _coralColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChips(BuildContext context) {
    final cats = _categoriesToDisplay;
    if (cats.length <= 1) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.serviceType,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: _textDark,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 8,
          children: cats.map((category) {
            final isSelected =
                selectedCategory.toLowerCase() == category.toLowerCase();
            return ChoiceChip(
              label: Text(
                category,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : const Color(0xFF475569),
                ),
              ),
              selected: isSelected,
              selectedColor: isSelected && category.toLowerCase() == 'all'
                  ? const Color(0xFF8B2516)
                  : _coralColor,
              backgroundColor: const Color(0xFFE0F2FE),
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onSelected: (_) => onCategorySelected(category),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: _textDark,
      ),
    );
  }
}
