import 'package:flutter/material.dart';
import '../widgets/home_special_offer_card.dart';

class HomeSpecialOffersSection extends StatelessWidget {
  final List<HomeSpecialOfferItem> offers;
  final ValueChanged<HomeSpecialOfferItem>? onOfferTap;
  final ValueChanged<HomeSpecialOfferItem>? onBookNow;

  static const Color _textDark = Color(0xFF1E2022);

  const HomeSpecialOffersSection({
    super.key,
    required this.offers,
    this.onOfferTap,
    this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    if (offers.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Special Offers',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: _textDark,
              letterSpacing: -0.3,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 190,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: offers.length,
            separatorBuilder: (context, index) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final offer = offers[index];
              return HomeSpecialOfferCard(
                offer: offer,
                onTap: () => onOfferTap?.call(offer),
                onBookNow: () => onBookNow?.call(offer),
              );
            },
          ),
        ),
      ],
    );
  }
}
