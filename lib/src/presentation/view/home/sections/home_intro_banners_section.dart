import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class HomeIntroBannersSection extends StatefulWidget {
  final VoidCallback? onExploreUserApp;
  final VoidCallback? onExploreMerchantApp;

  const HomeIntroBannersSection({
    super.key,
    this.onExploreUserApp,
    this.onExploreMerchantApp,
  });

  @override
  State<HomeIntroBannersSection> createState() =>
      _HomeIntroBannersSectionState();
}

class _HomeIntroBannersSectionState extends State<HomeIntroBannersSection> {
  late final PageController _pageController;
  int _currentPage = 0;
  Timer? _autoScrollTimer;

  static const Color _coralPrimary = Color(0xFFFC6E58);

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.92);
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 6), (_) {
      if (!mounted) return;
      final nextPage = (_currentPage + 1) % 2;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 168,
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [_buildUserAppBanner(), _buildMerchantAppBanner()],
          ),
        ),
        const SizedBox(height: 10),
        // Dots indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(2, (index) {
            final isActive = _currentPage == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: isActive ? 22 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: isActive ? _coralPrimary : const Color(0xFFE2E8F0),
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildUserAppBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFA6F59), Color(0xFFFF8E78)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFA6F59).withValues(alpha: 0.28),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Background decorative glow circles
          Positioned(
            right: -25,
            top: -25,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.12),
              ),
            ),
          ),
          Positioned(
            right: 40,
            bottom: -40,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.08),
              ),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.22),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              LucideIcons.sparkles,
                              color: Colors.white,
                              size: 11,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'ỨNG DỤNG KHÁCH HÀNG',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.4,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Title & Subtitle
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Đặt lịch Spa & Salon dễ dàng',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.5,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.2,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Khám phá salon uy tín, đặt chỗ tức thì & xác nhận nhanh chóng.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.5,
                              fontWeight: FontWeight.w400,
                              height: 1.25,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),

                      // CTA Button
                      InkWell(
                        onTap: widget.onExploreUserApp,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.08),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Khám phá ngay',
                                style: TextStyle(
                                  color: Color(0xFFFA6F59),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                LucideIcons.arrow_right,
                                color: Color(0xFFFA6F59),
                                size: 13,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 10),

                // Right Illustration/Icon
                Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.35),
                      width: 1.5,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      LucideIcons.calendar_check_2,
                      color: Colors.white,
                      size: 34,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMerchantAppBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF221D1A), Color(0xFF3F3530)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFFC6E58).withValues(alpha: 0.3),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Background decorative glow
          Positioned(
            right: -20,
            bottom: -20,
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFFC6E58).withValues(alpha: 0.14),
              ),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFFFC6E58,
                          ).withValues(alpha: 0.22),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              LucideIcons.store,
                              color: Color(0xFFFF9E8D),
                              size: 11,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'DÀNH CHO CHỦ SPA & SALON',
                              style: TextStyle(
                                color: Color(0xFFFF9E8D),
                                fontSize: 10,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.4,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Title & Subtitle
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Spa Booking Merchant',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.5,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.2,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Quản lý tiệm thông minh, nhân viên, doanh thu & hút khách hàng.',
                            style: TextStyle(
                              color: Color(0xFFCBD5E1),
                              fontSize: 11.5,
                              fontWeight: FontWeight.w400,
                              height: 1.25,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),

                      // CTA Button
                      InkWell(
                        onTap: widget.onExploreMerchantApp,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFC6E58),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(
                                  0xFFFC6E58,
                                ).withValues(alpha: 0.35),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Tìm hiểu ngay',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                LucideIcons.external_link,
                                color: Colors.white,
                                size: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 10),

                // Right Illustration/Icon
                Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.08),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFFC6E58).withValues(alpha: 0.35),
                      width: 1.5,
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      LucideIcons.store,
                      color: Color(0xFFFF9E8D),
                      size: 32,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
