import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../booking/view/booking_view.dart';
import '../home/view/home_view.dart';
import '../profile/view/profile_view.dart';
import '../search/view/search_view.dart';
import 'widgets/app_bottom_nav_bar.dart';

@RoutePage()
class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(onSearchTap: () => _onTabSelected(1)),
      const SearchView(),
      const BookingView(),
      const ProfilePage(),
    ];
  }

  void _onTabSelected(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  void _onCenterAction() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Quick Spa Actions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF2C2420),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(LucideIcons.x, size: 20),
                      onPressed: () => Navigator.of(sheetContext).pop(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildQuickActionTile(
                  icon: LucideIcons.calendar_plus,
                  title: 'Book New Treatment',
                  subtitle: 'Explore available salons & therapists',
                  color: const Color(0xFFBA4A32),
                  onTap: () {
                    Navigator.of(sheetContext).pop();
                    _onTabSelected(1);
                  },
                ),
                const SizedBox(height: 12),
                _buildQuickActionTile(
                  icon: LucideIcons.sparkles,
                  title: 'AI Beauty Matcher',
                  subtitle: 'Personalized treatment recommendations',
                  color: const Color(0xFFE55D47),
                  onTap: () {
                    Navigator.of(sheetContext).pop();
                  },
                ),
                const SizedBox(height: 12),
                _buildQuickActionTile(
                  icon: LucideIcons.tag,
                  title: 'Special Spa Offers',
                  subtitle: 'Discount vouchers and seasonal packages',
                  color: const Color(0xFF1E5B6E),
                  onTap: () {
                    Navigator.of(sheetContext).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildQuickActionTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFFAF7F5),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFF0EBE6)),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Center(child: Icon(icon, color: color, size: 20)),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2C2420),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF8A7D75),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              LucideIcons.chevron_right,
              size: 18,
              color: Color(0xFF8A7D75),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarContrastEnforced: false,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F6F3),
        extendBody: true,
        body: IndexedStack(index: _currentIndex, children: _pages),
        bottomNavigationBar: AppBottomNavBar(
          currentIndex: _currentIndex,
          onTabSelected: _onTabSelected,
          onCenterAction: _onCenterAction,
        ),
      ),
    );
  }
}
