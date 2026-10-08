import 'package:flutter/material.dart';
import '../../../../domain/entities/review/user_review_entity.dart';
import '../../../../shared/shared.dart';

class UserReviewEditSheet extends StatefulWidget {
  final UserReviewEntity review;
  final void Function(int rating, String comment) onSave;

  const UserReviewEditSheet({
    super.key,
    required this.review,
    required this.onSave,
  });

  static Future<void> show(
    BuildContext context, {
    required UserReviewEntity review,
    required void Function(int rating, String comment) onSave,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => UserReviewEditSheet(review: review, onSave: onSave),
    );
  }

  @override
  State<UserReviewEditSheet> createState() => _UserReviewEditSheetState();
}

class _UserReviewEditSheetState extends State<UserReviewEditSheet> {
  late int _rating;
  late final TextEditingController _commentController;

  @override
  void initState() {
    super.initState();
    _rating = widget.review.rating;
    _commentController = TextEditingController(text: widget.review.comment);
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _handleSave() {
    final comment = _commentController.text.trim();
    if (comment.isEmpty) {
      AppToast.warning(context, message: 'Vui lòng nhập nội dung đánh giá');
      return;
    }
    Navigator.of(context).pop();
    widget.onSave(_rating, comment);
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 14,
        bottom: 24 + bottomInset,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFE2E8F0),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Header
          Row(
            children: [
              const Text(
                'Chỉnh sửa đánh giá',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1E293B),
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.close,
                  size: 20,
                  color: Color(0xFF94A3B8),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Interactive Star Rating
          const Text(
            'Đánh giá sao của bạn',
            style: TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w600,
              color: Color(0xFF475569),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final starValue = index + 1;
              final isSelected = starValue <= _rating;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _rating = starValue;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Icon(
                    Icons.star_rounded,
                    size: 38,
                    color: isSelected
                        ? const Color(0xFFF59E0B)
                        : const Color(0xFFE2E8F0),
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 18),

          // Comment Text Field
          const Text(
            'Nhận xét của bạn',
            style: TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w600,
              color: Color(0xFF475569),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: TextField(
              controller: _commentController,
              maxLines: 4,
              style: const TextStyle(fontSize: 14, color: Color(0xFF1E293B)),
              decoration: const InputDecoration(
                hintText: 'Chia sẻ trải nghiệm của bạn...',
                hintStyle: TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
                contentPadding: EdgeInsets.all(14),
                border: InputBorder.none,
              ),
            ),
          ),

          const SizedBox(height: 22),

          // Save Button
          AppButton(
            text: 'Lưu thay đổi',
            onPressed: _handleSave,
            backgroundColor: const Color(0xFFFA7762),
            textColor: Colors.white,
            borderRadius: BorderRadius.circular(24),
            height: 48,
            fullWidth: true,
          ),
        ],
      ),
    );
  }
}
