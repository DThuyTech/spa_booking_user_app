import 'package:flutter/material.dart';

enum StoreDetailTab { overview, services, reviews, gallery }

class StoreDetailTabBarSection extends StatelessWidget {
  final StoreDetailTab activeTab;
  final ValueChanged<StoreDetailTab> onTabChanged;

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _inactiveText = Color(0xFF64748B);

  const StoreDetailTabBarSection({
    super.key,
    required this.activeTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isVi = Localizations.localeOf(context).languageCode == 'vi';

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTabItem(
                StoreDetailTab.overview,
                isVi ? 'Tổng quan' : 'Overview',
              ),
              _buildTabItem(
                StoreDetailTab.services,
                isVi ? 'Dịch vụ' : 'Services',
              ),
              _buildTabItem(
                StoreDetailTab.reviews,
                isVi ? 'Đánh giá' : 'Reviews',
              ),
              _buildTabItem(
                StoreDetailTab.gallery,
                isVi ? 'Thư viện' : 'Gallery',
              ),
            ],
          ),
        ),
        const Divider(color: Color(0xFFF1F5F9), height: 1, thickness: 1),
      ],
    );
  }

  Widget _buildTabItem(StoreDetailTab tab, String label) {
    final isSelected = activeTab == tab;
    return GestureDetector(
      onTap: () => onTabChanged(tab),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14.5,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: isSelected ? _coralColor : _inactiveText,
              ),
            ),
          ),
          Container(
            height: 2.5,
            width: 44,
            decoration: BoxDecoration(
              color: isSelected ? _coralColor : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
