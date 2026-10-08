import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';
import '../widgets/home_recommended_salon_card.dart';

class HomeRecommendedForYouSection extends StatelessWidget {
  final List<HomeRecommendedSalonItem> salons;
  final String? title;
  final String? subtitle;
  final VoidCallback? onSeeAllTap;
  final ValueChanged<HomeRecommendedSalonItem>? onSalonTap;
  final ValueChanged<HomeRecommendedSalonItem>? onFavoriteToggle;

  static const Color _coralColor = Color(0xFFFC6E58);
  static const Color _textDark = Color(0xFF1E2022);

  const HomeRecommendedForYouSection({
    super.key,
    required this.salons,
    this.title,
    this.subtitle,
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? context.l10n.recommendedSalons,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: _textDark,
                        letterSpacing: -0.3,
                      ),
                    ),
                    if (subtitle != null && subtitle!.isNotEmpty) ...[
                      const SizedBox(height: 3),
                      Text(
                        subtitle!,
                        style: const TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              InkWell(
                onTap: onSeeAllTap,
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  child: Text(
                    context.l10n.seeAll,
                    style: const TextStyle(
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
