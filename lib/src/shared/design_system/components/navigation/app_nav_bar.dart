import 'package:flutter/material.dart';

class AppNavBarItem {
  final IconData icon;
  final IconData? activeIcon;
  final String label;

  const AppNavBarItem({
    required this.icon,
    this.activeIcon,
    required this.label,
  });
}

class AppNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<AppNavBarItem> items;

  const AppNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      destinations: items
          .map(
            (item) => NavigationDestination(
              icon: Icon(item.icon),
              selectedIcon: item.activeIcon != null
                  ? Icon(item.activeIcon)
                  : null,
              label: item.label,
            ),
          )
          .toList(),
    );
  }
}
