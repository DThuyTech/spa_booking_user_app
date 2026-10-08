import 'package:flutter/material.dart';
import 'package:spa_booking/src/domain/entities/store/store.dart';
import '../../../../shared/shared.dart';

import '../widgets/store_service_item_card.dart';

class StoreServicesTabView extends StatefulWidget {
  final List<ServiceCategoryEntity> categories;
  final List<ServiceEntity> services;
  final ValueChanged<StoreDetailEntity>? onBookService;

  const StoreServicesTabView({
    super.key,
    required this.categories,
    required this.services,
    this.onBookService,
  });

  @override
  State<StoreServicesTabView> createState() => _StoreServicesTabViewState();
}

class _StoreServicesTabViewState extends State<StoreServicesTabView> {
  String? _selectedCategoryId;

  static const Color _selectedChipBg = Color(0xFFA53C2A);
  static const Color _unselectedChipBg = Color(0xFFE0F2FE);
  static const Color _unselectedChipText = Color(0xFF0369A1);
  static const Color _textDark = Color(0xFF1E2022);

  @override
  Widget build(BuildContext context) {
    final categories = _sortedCategories;
    final filteredServices = _filteredServices;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          _buildCategoryFilter(categories),

          const SizedBox(height: 20),

          if (filteredServices.isEmpty)
            _buildEmptyState()
          else
            _buildServiceList(categories, filteredServices),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  List<ServiceCategoryEntity> get _sortedCategories {
    final result = [...widget.categories];

    result.sort((a, b) => a.displayOrder.compareTo(b.displayOrder));

    return result;
  }

  List<ServiceEntity> get _filteredServices {
    if (_selectedCategoryId == null) {
      return widget.services;
    }

    return widget.services
        .where((service) => service.categoryId == _selectedCategoryId)
        .toList();
  }

  Widget _buildCategoryFilter(List<ServiceCategoryEntity> categories) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          _buildCategoryChip(
            label: context.l10n.all,
            isSelected: _selectedCategoryId == null,
            onTap: () {
              setState(() {
                _selectedCategoryId = null;
              });
            },
          ),

          ...categories.map(
            (category) => _buildCategoryChip(
              label: category.name,
              isSelected: _selectedCategoryId == category.id,
              onTap: () {
                setState(() {
                  _selectedCategoryId = category.id;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
          decoration: BoxDecoration(
            color: isSelected ? _selectedChipBg : _unselectedChipBg,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
              color: isSelected ? Colors.white : _unselectedChipText,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildServiceList(
    List<ServiceCategoryEntity> categories,
    List<ServiceEntity> services,
  ) {
    if (_selectedCategoryId != null) {
      final category = categories
          .where((e) => e.id == _selectedCategoryId)
          .firstOrNull;

      return _buildCategorySection(
        categoryName: category?.name ?? 'Services',
        services: services,
      );
    }

    final sections = <Widget>[];

    for (final category in categories) {
      final categoryServices = services
          .where((service) => service.categoryId == category.id)
          .toList();

      if (categoryServices.isEmpty) {
        continue;
      }

      sections.add(
        _buildCategorySection(
          categoryName: category.name,
          services: categoryServices,
        ),
      );
    }

    // Services không có category hoặc category không tồn tại.
    final uncategorizedServices = services
        .where(
          (service) =>
              service.categoryId == null ||
              !categories.any((category) => category.id == service.categoryId),
        )
        .toList();

    if (uncategorizedServices.isNotEmpty) {
      sections.add(
        _buildCategorySection(
          categoryName: 'Other Services',
          services: uncategorizedServices,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sections,
    );
  }

  Widget _buildCategorySection({
    required String categoryName,
    required List<ServiceEntity> services,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          categoryName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: _textDark,
            letterSpacing: -0.2,
          ),
        ),
        const SizedBox(height: 12),

        ...services.map(
          (service) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: StoreDetailEntityCard(
              service: service,
              // onBook: () => widget.onBookService?.call(service),
              onBook: () {},
            ),
          ),
        ),

        const SizedBox(height: 12),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Center(
        child: Text(
          context.l10n.noServicesInCategory,
          style: const TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
        ),
      ),
    );
  }
}
