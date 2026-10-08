import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/di/dependency_injection.dart';
import '../../../../app/router/app_router.gr.dart';
import '../../../../domain/entities/review/user_review_entity.dart';
import '../../../../shared/shared.dart';
import '../../../bloc/review/user_reviews/user_reviews_bloc.dart';
import '../../../bloc/review/user_reviews/user_reviews_event.dart';
import '../../../bloc/review/user_reviews/user_reviews_state.dart';
import '../body_view/user_reviews_body_view.dart';
import '../widgets/user_review_edit_sheet.dart';

@RoutePage()
class UserReviewsPage extends StatelessWidget {
  const UserReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserReviewsBloc>(
      create: (_) => sl<UserReviewsBloc>()..add(const FetchUserReviewsEvent()),
      child: const UserReviewsView(),
    );
  }
}

class UserReviewsView extends StatelessWidget {
  const UserReviewsView({super.key});

  void _showDeleteDialog(BuildContext context, UserReviewEntity review) {
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
                DeleteUserReviewEvent(review.id),
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
        } else if (state.status == UserReviewsStatus.updateSuccess) {
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
        return Scaffold(
          backgroundColor: const Color(0xFFF8FAFC),
          appBar: AppAppBar(title: 'Đánh giá của tôi'),
          body: SafeArea(
            top: false,
            child: UserReviewsBodyView(
              reviews: state.reviews,
              isLoading: state.status == UserReviewsStatus.loading,
              onRefresh: () async {
                context.read<UserReviewsBloc>().add(
                  const FetchUserReviewsEvent(isRefresh: true),
                );
              },
              onLoadMore: () {
                context.read<UserReviewsBloc>().add(
                  const LoadMoreUserReviewsEvent(),
                );
              },
              onTapReview: (review) async {
                final result = await context.router.push(
                  UserReviewDetailRoute(
                    reviewId: review.id,
                    initialReview: review,
                  ),
                );
                if (result == true && context.mounted) {
                  context.read<UserReviewsBloc>().add(
                    const FetchUserReviewsEvent(isRefresh: true),
                  );
                }
              },
              onEditReview: (review) => _showEditSheet(context, review),
              onDeleteReview: (review) => _showDeleteDialog(context, review),
            ),
          ),
        );
      },
    );
  }
}
