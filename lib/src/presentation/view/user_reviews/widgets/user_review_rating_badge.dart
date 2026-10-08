import 'package:flutter/material.dart';

class UserReviewRatingBadge extends StatelessWidget {
  final int rating;
  final double starSize;
  final double fontSize;

  const UserReviewRatingBadge({
    super.key,
    required this.rating,
    this.starSize = 20,
    this.fontSize = 15,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.star_rounded,
          size: starSize,
          color: const Color(0xFFF59E0B),
        ),
        const SizedBox(width: 3),
        Text(
          '$rating',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1E5AF6),
          ),
        ),
      ],
    );
  }
}
