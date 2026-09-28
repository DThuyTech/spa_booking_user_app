import 'package:flutter/material.dart';
import '../widgets/home_recommended_salon_card.dart';

class HomeRecommendedForYouSection extends StatelessWidget {
  final List<HomeRecommendedSalonItem> salons;
  final VoidCallback? onSeeAllTap;
  final ValueChanged<HomeRecommendedSalonItem>? onSalonTap;
  final ValueChanged<HomeRecommendedSalonItem>? onFavoriteToggle;

  static const Color _coralColor = Color(0xFFFC6E58);
  static const Color _textDark = Color(0xFF1E2022);

  const HomeRecommendedForYouSection({
    super.key,
    required this.salons,
    this.onSeeAllTap,
    this.onSalonTap,
    this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    if (salons.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recommended for You',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: _textDark,
                  letterSpacing: -0.3,
                ),
              ),
              InkWell(
                onTap: onSeeAllTap,
                borderRadius: BorderRadius.circular(8),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: _coralColor,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Vertical List of Recommended Salon Cards
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: salons.length,
            itemBuilder: (context, index) {
              final item = salons[index];
              return HomeRecommendedSalonCard(
                item: item,
                onTap: () => onSalonTap?.call(item),
                onFavoriteToggle: () => onFavoriteToggle?.call(item),
              );
            },
          ),
        ],
      ),
    );
  }
}
