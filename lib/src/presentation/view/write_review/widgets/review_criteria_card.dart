import 'package:flutter/material.dart';
import '../mockup_data/write_review_mock_data.dart';

class ReviewCriteriaCard extends StatelessWidget {
  final List<SpecificRatingDetail> criteria;
  final void Function(int index, double value)? onCriteriaChanged;

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF52525B);
  static const Color _trackColor = Color(0xFFF1F5F9);

  const ReviewCriteriaCard({
    super.key,
    required this.criteria,
    this.onCriteriaChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Rate specific details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: _textDark,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(criteria.length, (index) {
            final item = criteria[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Label & Status row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.label,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: _textDark,
                        ),
                      ),
                      Text(
                        item.statusText,
                        style: const TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                          color: _textMuted,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Custom Interactive Slider Track
                  GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      final box = context.findRenderObject() as RenderBox?;
                      if (box != null && box.size.width > 0) {
                        final localX = details.localPosition.dx;
                        final ratio = (localX / (box.size.width - 40)).clamp(
                          0.1,
                          1.0,
                        );
                        onCriteriaChanged?.call(index, ratio);
                      }
                    },
                    onTapDown: (details) {
                      final box = context.findRenderObject() as RenderBox?;
                      if (box != null && box.size.width > 0) {
                        final localX = details.localPosition.dx;
                        final ratio = (localX / (box.size.width - 40)).clamp(
                          0.1,
                          1.0,
                        );
                        onCriteriaChanged?.call(index, ratio);
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Container(
                        height: 7,
                        width: double.infinity,
                        color: _trackColor,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: FractionallySizedBox(
                            widthFactor: item.value.clamp(0.05, 1.0),
                            child: Container(color: _coralColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
