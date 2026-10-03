import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';
import '../mockup_data/write_review_mock_data.dart';
import '../widgets/review_add_photos_section.dart';
import '../widgets/review_criteria_card.dart';
import '../widgets/review_input_card.dart';
import '../widgets/review_salon_header_card.dart';

class WriteReviewBodyView extends StatelessWidget {
  final String salonName;
  final String logoUrl;
  final int selectedRating;
  final ValueChanged<int> onRatingChanged;
  final TextEditingController reviewController;
  final List<SpecificRatingDetail> criteria;
  final void Function(int index, double value) onCriteriaChanged;
  final List<String> photoUrls;
  final VoidCallback onAddPhoto;
  final ValueChanged<int> onRemovePhoto;
  final VoidCallback onSubmitReview;

  static const Color _coralColor = Color(0xFFFF6F59);

  const WriteReviewBodyView({
    super.key,
    required this.salonName,
    required this.logoUrl,
    required this.selectedRating,
    required this.onRatingChanged,
    required this.reviewController,
    required this.criteria,
    required this.onCriteriaChanged,
    required this.photoUrls,
    required this.onAddPhoto,
    required this.onRemovePhoto,
    required this.onSubmitReview,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Salon Header Card with 5 Stars Rating
          ReviewSalonHeaderCard(
            salonName: salonName,
            logoUrl: logoUrl,
            selectedRating: selectedRating,
            onRatingChanged: onRatingChanged,
          ),
          const SizedBox(height: 16),

          // 2. Multiline Review Input Card
          ReviewInputCard(controller: reviewController),
          const SizedBox(height: 16),

          // 3. Rate Specific Details Card
          ReviewCriteriaCard(
            criteria: criteria,
            onCriteriaChanged: onCriteriaChanged,
          ),
          const SizedBox(height: 20),

          // 4. Add Photos Section
          ReviewAddPhotosSection(
            photoUrls: photoUrls,
            onAddPhoto: onAddPhoto,
            onRemovePhoto: onRemovePhoto,
          ),
          const SizedBox(height: 28),

          // 5. Submit Review Button
          AppButton(
            text: 'Submit Review',
            onPressed: onSubmitReview,
            backgroundColor: _coralColor,
            textColor: Colors.white,
            borderRadius: BorderRadius.circular(26),
            height: 52,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
