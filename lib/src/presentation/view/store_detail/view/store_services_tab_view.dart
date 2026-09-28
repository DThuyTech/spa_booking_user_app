import 'package:flutter/material.dart';
import '../mockup_data/store_detail_mock_data.dart';
import '../widgets/store_service_item_card.dart';

class StoreServicesTabView extends StatefulWidget {
  final List<StoreServiceCategoryGroup> serviceGroups;
  final ValueChanged<StoreServiceItem>? onBookService;

  const StoreServicesTabView({
    super.key,
    required this.serviceGroups,
    this.onBookService,
  });

  @override
  State<StoreServicesTabView> createState() => _StoreServicesTabViewState();
}

class _StoreServicesTabViewState extends State<StoreServicesTabView> {
  String _selectedCategory = 'All';

  static const List<String> _filterCategories = [
    'All',
    'Hair',
    'Beauty',
    'Team',
  ];

  static const Color _selectedChipBg = Color(0xFFA53C2A);
  static const Color _unselectedChipBg = Color(0xFFE0F2FE);
  static const Color _unselectedChipText = Color(0xFF0369A1);
  static const Color _textDark = Color(0xFF1E2022);

  @override
  Widget build(BuildContext context) {
    final filteredGroups = _selectedCategory == 'All'
        ? widget.serviceGroups
        : widget.serviceGroups
              .where(
                (g) =>
                    g.categoryName.toLowerCase() ==
                    _selectedCategory.toLowerCase(),
              )
              .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          // Horizontal Category Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: _filterCategories.map((cat) {
                final isSelected = _selectedCategory == cat;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = cat;
                      });
                    },
                    behavior: HitTestBehavior.opaque,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 9,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected ? _selectedChipBg : _unselectedChipBg,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        cat,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w600,
                          color: isSelected
                              ? Colors.white
                              : _unselectedChipText,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 20),

          // Service Groups
          if (filteredGroups.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: Text(
                  'No services available under $_selectedCategory',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ),
            )
          else
            ...filteredGroups.map((group) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    group.categoryName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: _textDark,
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...group.services.map((service) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: StoreServiceItemCard(
                        service: service,
                        onBook: () => widget.onBookService?.call(service),
                      ),
                    );
                  }),
                  const SizedBox(height: 12),
                ],
              );
            }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
