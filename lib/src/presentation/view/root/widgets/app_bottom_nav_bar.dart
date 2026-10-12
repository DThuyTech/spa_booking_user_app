import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  static const Color _activeColor = Color(0xFFFC6E58);
  static const Color _inactiveColor = Color(0xFF94A3B8);

  @override
  Widget build(BuildContext context) {
    final isVi = Localizations.localeOf(context).languageCode == 'vi';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        bottom: true,
        maintainBottomViewPadding: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: GNav(
            rippleColor: _activeColor.withValues(alpha: 0.15),
            hoverColor: _activeColor.withValues(alpha: 0.08),
            haptic: true,
            tabBorderRadius: 16,
            curve: Curves.easeOutExpo,
            duration: const Duration(milliseconds: 300),
            gap: 8,
            color: _inactiveColor,
            activeColor: _activeColor,
            iconSize: 22,
            tabBackgroundColor: _activeColor.withValues(alpha: 0.12),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            selectedIndex: currentIndex,
            onTabChange: onTabSelected,
            textStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: _activeColor,
              letterSpacing: -0.2,
            ),
            tabs: [
              GButton(
                icon: LucideIcons.house,
                text: isVi ? 'Trang chủ' : 'Home',
              ),
              GButton(
                icon: LucideIcons.search,
                text: isVi ? 'Tìm kiếm' : 'Search',
              ),
              GButton(
                icon: LucideIcons.calendar,
                text: isVi ? 'Lịch hẹn' : 'Bookings',
              ),
              GButton(
                icon: LucideIcons.user,
                text: isVi ? 'Cá nhân' : 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
