import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';
import '../widgets/home_near_salon_card.dart';

class HomeSalonsNearYouSection extends StatelessWidget {
  final List<HomeNearSalonItem> salons;
  final String? title;
  final VoidCallback? onSeeAllTap;
  final ValueChanged<HomeNearSalonItem>? onSalonTap;
  final ValueChanged<HomeNearSalonItem>? onBookTap;

  static const Color _coralColor = Color(0xFFFC6E58);
  static const Color _textDark = Color(0xFF1E2022);

  const HomeSalonsNearYouSection({
    super.key,
    required this.salons,
    this.title,
    this.onSeeAllTap,
    this.onSalonTap,
    this.onBookTap,
  });

  @override
  Widget build(BuildContext context) {
    if (salons.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title ?? context.l10n.nearbySalons,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: _textDark,
                  letterSpacing: -0.3,
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
        ),

        const SizedBox(height: 12),

        // Horizontal List
        SizedBox(
          height: 230,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: salons.length,
            separatorBuilder: (context, index) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final salon = salons[index];
              return HomeNearSalonCard(
                salon: salon,
                onTap: () => onSalonTap?.call(salon),
                onBook: () => onBookTap?.call(salon),
              );
            },
          ),
        ),
      ],
    );
  }
}
