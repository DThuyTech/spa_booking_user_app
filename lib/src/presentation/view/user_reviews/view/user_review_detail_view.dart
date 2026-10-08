import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/di/dependency_injection.dart';
import '../../../../domain/entities/review/user_review_entity.dart';
import '../../../../shared/shared.dart';
import '../../../bloc/review/user_reviews/user_reviews_bloc.dart';
import '../../../bloc/review/user_reviews/user_reviews_event.dart';
import '../../../bloc/review/user_reviews/user_reviews_state.dart';
import '../body_view/user_review_detail_body_view.dart';
import '../widgets/user_review_edit_sheet.dart';

@RoutePage()
class UserReviewDetailPage extends StatelessWidget {
  final String reviewId;
  final UserReviewEntity? initialReview;

  const UserReviewDetailPage({
    super.key,
    required this.reviewId,
    this.initialReview,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserReviewsBloc>(
      create: (_) {
        final bloc = sl<UserReviewsBloc>();
        if (initialReview == null) {
          bloc.add(GetUserReviewDetailEvent(reviewId));
        }
        return bloc;
      },
      child: UserReviewDetailView(
        reviewId: reviewId,
        initialReview: initialReview,
      ),
    );
  }
}

class UserReviewDetailView extends StatefulWidget {
  final String reviewId;
  final UserReviewEntity? initialReview;

  const UserReviewDetailView({
    super.key,
    required this.reviewId,
    this.initialReview,
  });

  @override
  State<UserReviewDetailView> createState() => _UserReviewDetailViewState();
}

class _UserReviewDetailViewState extends State<UserReviewDetailView> {
  UserReviewEntity? _currentReview;

  @override
  void initState() {
    super.initState();
    _currentReview = widget.initialReview;
  }

  void _showDeleteDialog(BuildContext context, String reviewId) {
    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Xóa đánh giá',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1E293B),
          ),
        ),
        content: const Text(
          'Bạn có chắc chắn muốn xóa bài đánh giá này không? Hành động này không thể hoàn tác.',
          style: TextStyle(fontSize: 14, color: Color(0xFF64748B)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogCtx).pop(),
            child: const Text(
              'Hủy',
              style: TextStyle(
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          AppButton(
            text: 'Xóa',
            onPressed: () {
              Navigator.of(dialogCtx).pop();
              context.read<UserReviewsBloc>().add(
                DeleteUserReviewEvent(reviewId),
              );
            },
            backgroundColor: const Color(0xFFEF4444),
            textColor: Colors.white,
            borderRadius: BorderRadius.circular(20),
            height: 40,
          ),
        ],
      ),
    );
  }

  void _showEditSheet(BuildContext context, UserReviewEntity review) {
    UserReviewEditSheet.show(
      context,
      review: review,
      onSave: (rating, comment) {
        context.read<UserReviewsBloc>().add(
          UpdateUserReviewEvent(
            reviewId: review.id,
            rating: rating,
            comment: comment,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserReviewsBloc, UserReviewsState>(
      listener: (context, state) {
        if (state.status == UserReviewsStatus.deleteSuccess) {
          AppToast.success(
            context,
            message: state.message ?? 'Đã xóa đánh giá thành công',
          );
          Navigator.of(context).pop(true);
        } else if (state.status == UserReviewsStatus.updateSuccess) {
          if (state.selectedReview != null) {
            setState(() {
              _currentReview = state.selectedReview;
            });
          }
          AppToast.success(
            context,
            message: state.message ?? 'Đã cập nhật đánh giá thành công',
          );
        } else if (state.status == UserReviewsStatus.failure &&
            state.failure != null) {
          AppToast.error(
            context,
            message: state.failure?.message ?? 'Đã có lỗi xảy ra',
          );
        }
      },
      builder: (context, state) {
        final review = state.selectedReview ?? _currentReview;

        return Scaffold(
          backgroundColor: const Color(0xFFF8FAFC),
          appBar: AppAppBar(title: 'Chi tiết đánh giá'),
          body: SafeArea(
            top: false,
            child: review != null
                ? UserReviewDetailBodyView(
                    review: review,
                    onEdit: () => _showEditSheet(context, review),
                    onDelete: () => _showDeleteDialog(context, review.id),
                  )
                : const Center(
                    child: CircularProgressIndicator(color: Color(0xFFFA7762)),
                  ),
          ),
        );
      },
    );
  }
}
