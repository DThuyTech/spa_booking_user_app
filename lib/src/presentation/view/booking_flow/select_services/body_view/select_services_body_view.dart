import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../../../../../shared/design_system/components/inputs/app_text_field.dart';
import '../../models/booking_models.dart';
import '../widgets/booking_service_selection_card.dart';
import '../widgets/booking_staff_avatar_item.dart';

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
  });

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF64748B);

  static const List<String> _categories = ['All', 'Hair', 'Beauty', 'Team'];

  @override
  Widget build(BuildContext context) {
    final hairServices = services.where((s) => s.category == 'Hair').toList();
    final beautyServices = services
        .where((s) => s.category == 'Beauty')
        .toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Summary Card (Matching Image 1 & 2)
          _buildSummaryCard(),

          const SizedBox(height: 20),

          // 2. Customer Section (Matching Image 2)
          _buildCustomerSection(),

          const SizedBox(height: 22),

          // 3. Service Type Category Filter Chips
          _buildCategoryChips(),

          const SizedBox(height: 24),

          // 4. Hair Services Group
          if (selectedCategory == 'All' || selectedCategory == 'Hair') ...[
            _buildSectionHeader('Hair Service'),
            const SizedBox(height: 12),
            ...hairServices.map(
              (service) => BookingServiceSelectionCard(
                service: service,
                onTap: () => onServiceToggle(service),
              ),
            ),
            const SizedBox(height: 16),
          ],

          // 5. Beauty Services Group
          if (selectedCategory == 'All' || selectedCategory == 'Beauty') ...[
            _buildSectionHeader('Beauty Service'),
            const SizedBox(height: 12),
            ...beautyServices.map(
              (service) => BookingServiceSelectionCard(
                service: service,
                onTap: () => onServiceToggle(service),
              ),
            ),
            const SizedBox(height: 16),
          ],

          // 6. Select Staff Section (Matching Image 2 bottom)
          _buildStaffSection(),

          const SizedBox(height: 32),
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

  Widget _buildCustomerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Customer',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: _textDark,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                '+ Add new customer',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: _coralColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        AppTextField(
          controller: customerSearchController,
          hint: 'Search existing customers...',
          prefixIcon: const Icon(
            LucideIcons.search,
            size: 18,
            color: Color(0xFF94A3B8),
          ),
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryChips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Service Type',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: _textDark,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          children: _categories.map((category) {
            final isSelected = selectedCategory == category;
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
              selectedColor: isSelected && category == 'All'
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

  Widget _buildStaffSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Staff',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: _textDark,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 96,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: staffMembers.length,
            itemBuilder: (context, index) {
              final staff = staffMembers[index];
              return BookingStaffAvatarItem(
                staff: staff,
                isSelected: selectedStaffId == staff.id,
                onTap: () => onStaffSelected(staff),
              );
            },
          ),
        ),
      ],
    );
  }
}
