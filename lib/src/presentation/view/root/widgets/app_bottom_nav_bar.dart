import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;
  final VoidCallback onCenterAction;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
    required this.onCenterAction,
  });

  /// Map page index (0: Home, 1: Search, 2: Bookings, 3: Profile)
  /// to 5-item curved bar index (0: Home, 1: Search, 2: Center Action, 3: Bookings, 4: Profile)
  int _toBarIndex(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return 0;
      case 1:
        return 1;
      case 2:
        return 3;
      case 3:
        return 4;
      default:
        return 0;
    }
  }

  int _toPageIndex(int barIndex) {
    switch (barIndex) {
      case 0:
        return 0;
      case 1:
        return 1;
      case 3:
        return 2;
      case 4:
        return 3;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final barIndex = _toBarIndex(currentIndex);

    return CurvedNavigationBar(
      index: barIndex,
      height: 65.0,
      items: <Widget>[
        _CurvedBarIcon(
          icon: LucideIcons.house,
          isSelected: barIndex == 0,
        ),
        _CurvedBarIcon(
          icon: LucideIcons.search,
          isSelected: barIndex == 1,
        ),
        const _CurvedBarIcon(
          icon: LucideIcons.sparkles,
          isSelected: false,
          inactiveColor: Color(0xFFFA7762),
          size: 26,
        ),
        _CurvedBarIcon(
          icon: LucideIcons.calendar,
          isSelected: barIndex == 3,
        ),
        _CurvedBarIcon(
          icon: LucideIcons.user,
          isSelected: barIndex == 4,
        ),
      ],
      color: Colors.white,
      buttonBackgroundColor: const Color(0xFFFA7762),
      backgroundColor: Colors.transparent,
      animationCurve: Curves.easeInOutCubic,
      animationDuration: const Duration(milliseconds: 350),
      onTap: (index) {
        if (index == 2) {
          onCenterAction();
        } else {
          onTabSelected(_toPageIndex(index));
        }
      },
      letIndexChange: (index) {
        if (index == 2) {
          onCenterAction();
          return false;
        }
        return true;
      },
    );
  }
}

class _CurvedBarIcon extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Color? inactiveColor;
  final double size;

  const _CurvedBarIcon({
    required this.icon,
    required this.isSelected,
    this.inactiveColor,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: isSelected
          ? Colors.white
          : (inactiveColor ?? const Color(0xFF64748B)),
    );
  }
}
