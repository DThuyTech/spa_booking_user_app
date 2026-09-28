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

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        20,
        0,
        20,
        bottomInset > 0 ? bottomInset + 8 : 16,
      ),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // The Island Navigation Bar
          Container(
            height: 66,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(33),
              border: Border.all(color: const Color(0xFFF0EBE6), width: 1.2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 20,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                // Tab 0: Home
                Expanded(
                  child: _NavItem(
                    icon: LucideIcons.house,
                    isSelected: currentIndex == 0,
                    onTap: () => onTabSelected(0),
                  ),
                ),

                // Tab 1: Search
                Expanded(
                  child: _NavItem(
                    icon: LucideIcons.search,
                    isSelected: currentIndex == 1,
                    onTap: () => onTabSelected(1),
                  ),
                ),

                // Gap for the center floating button
                const SizedBox(width: 58),

                // Tab 2: Booking
                Expanded(
                  child: _NavItem(
                    icon: LucideIcons.calendar,
                    isSelected: currentIndex == 2,
                    onTap: () => onTabSelected(2),
                  ),
                ),

                // Tab 3: Profile
                Expanded(
                  child: _NavItem(
                    icon: LucideIcons.user,
                    isSelected: currentIndex == 3,
                    onTap: () => onTabSelected(3),
                  ),
                ),
              ],
            ),
          ),

          // Center Floating Coral Action Button
          Positioned(
            top: -14,
            child: GestureDetector(
              onTap: onCenterAction,
              child: Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFF2725A), Color(0xFFE55D47)],
                  ),
                  border: Border.all(color: Colors.white, width: 3.5),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFE55D47).withValues(alpha: 0.45),
                      blurRadius: 14,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    LucideIcons.sparkles,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const activeColor = Color(0xFFFC6E58);
    const inactiveColor = Color(0xFF6B7280);

    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 23, color: isSelected ? activeColor : inactiveColor),
          const SizedBox(height: 3),
          // Active dot indicator matching design
          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? activeColor : Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
