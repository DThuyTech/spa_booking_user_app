import 'package:flutter/material.dart';

class NotificationFilterChips extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;

  const NotificationFilterChips({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  static const List<String> _filters = ['All', 'Bookings', 'Vouchers'];
  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: _filters.map((filter) {
          final isSelected = selectedFilter == filter;
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ChoiceChip(
              label: Text(
                filter,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected ? Colors.white : _textDark,
                ),
              ),
              selected: isSelected,
              selectedColor: _coralColor,
              backgroundColor: Colors.white,
              side: BorderSide(
                color: isSelected ? _coralColor : const Color(0xFFE2E8F0),
                width: 1.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onSelected: (_) => onFilterChanged(filter),
            ),
          );
        }).toList(),
      ),
    );
  }
}
