import 'package:board_oi/src/shared/design_system/tokens/app_colors.dart';
import 'package:board_oi/src/shared/design_system/tokens/app_radius.dart';
import 'package:flutter/material.dart';

/// Skeleton loading placeholder for Home sections.
class HomeSkeleton extends StatefulWidget {
  const HomeSkeleton({super.key});

  @override
  State<HomeSkeleton> createState() => _HomeSkeletonState();
}

class _HomeSkeletonState extends State<HomeSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.35,
      end: 0.85,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildBox({
    required double width,
    required double height,
    BorderRadius? borderRadius,
  }) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: AppColors.neutral200.withValues(alpha: _animation.value),
            borderRadius: borderRadius ?? BorderRadius.circular(8),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          // Header Skeleton
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBox(width: 140, height: 22),
                  const SizedBox(height: 8),
                  _buildBox(width: 200, height: 14),
                ],
              ),
              _buildBox(
                width: 44,
                height: 44,
                borderRadius: BorderRadius.circular(22),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Search Bar Skeleton
          _buildBox(
            width: double.infinity,
            height: 48,
            borderRadius: AppRadius.borderFull,
          ),
          const SizedBox(height: 28),

          // Booking Section Skeleton
          _buildBox(width: 160, height: 20),
          const SizedBox(height: 12),
          _buildBox(
            width: double.infinity,
            height: 90,
            borderRadius: AppRadius.borderCard,
          ),
          const SizedBox(height: 28),

          // Categories Skeleton
          _buildBox(width: 100, height: 20),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              4,
              (index) => Column(
                children: [
                  _buildBox(
                    width: 58,
                    height: 58,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  const SizedBox(height: 8),
                  _buildBox(width: 46, height: 12),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),

          // Stores Section Skeleton
          _buildBox(width: 150, height: 20),
          const SizedBox(height: 12),
          _buildBox(
            width: double.infinity,
            height: 80,
            borderRadius: AppRadius.borderCard,
          ),
        ],
      ),
    );
  }
}
