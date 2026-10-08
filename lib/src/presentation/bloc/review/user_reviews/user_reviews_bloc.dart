import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/usecases/review/delete_my_review_usecase.dart';
import '../../../../domain/usecases/review/get_my_review_detail_usecase.dart';
import '../../../../domain/usecases/review/get_my_reviews_usecase.dart';
import '../../../../domain/usecases/review/update_my_review_usecase.dart';
import 'user_reviews_event.dart';
import 'user_reviews_state.dart';

class UserReviewsBloc extends Bloc<UserReviewsEvent, UserReviewsState> {
  final GetMyReviewsUseCase getMyReviewsUseCase;
  final GetMyReviewDetailUseCase getMyReviewDetailUseCase;
  final UpdateMyReviewUseCase updateMyReviewUseCase;
  final DeleteMyReviewUseCase deleteMyReviewUseCase;

  UserReviewsBloc({
    required this.getMyReviewsUseCase,
    required this.getMyReviewDetailUseCase,
    required this.updateMyReviewUseCase,
    required this.deleteMyReviewUseCase,
  }) : super(const UserReviewsState()) {
    on<FetchUserReviewsEvent>(_onFetchUserReviews);
    on<LoadMoreUserReviewsEvent>(_onLoadMoreUserReviews);
    on<DeleteUserReviewEvent>(_onDeleteUserReview);
    on<UpdateUserReviewEvent>(_onUpdateUserReview);
    on<GetUserReviewDetailEvent>(_onGetUserReviewDetail);
  }

  Future<void> _onFetchUserReviews(
    FetchUserReviewsEvent event,
    Emitter<UserReviewsState> emit,
  ) async {
    if (event.isRefresh) {
      emit(state.copyWith(status: UserReviewsStatus.loading));
    } else if (state.reviews.isEmpty) {
      emit(state.copyWith(status: UserReviewsStatus.loading));
    }

    final result = await getMyReviewsUseCase(page: event.page, limit: 10);

    result.fold(
      (failure) => emit(
        state.copyWith(status: UserReviewsStatus.failure, failure: failure),
      ),
      (data) {
        emit(
          state.copyWith(
            status: UserReviewsStatus.success,
            reviews: event.page == 1
                ? data.items
                : [...state.reviews, ...data.items],
            page: data.page,
            totalPages: data.totalPages,
            total: data.total,
            hasReachedMax: data.page >= data.totalPages,
          ),
        );
      },
    );
  }

  Future<void> _onLoadMoreUserReviews(
    LoadMoreUserReviewsEvent event,
    Emitter<UserReviewsState> emit,
  ) async {
    if (state.hasReachedMax || state.status == UserReviewsStatus.loading) {
      return;
    }

    final nextPage = state.page + 1;
    final result = await getMyReviewsUseCase(page: nextPage, limit: 10);

    result.fold((failure) => null, (data) {
      emit(
        state.copyWith(
          reviews: [...state.reviews, ...data.items],
          page: data.page,
          totalPages: data.totalPages,
          total: data.total,
          hasReachedMax: data.page >= data.totalPages,
        ),
      );
    });
  }

  Future<void> _onDeleteUserReview(
    DeleteUserReviewEvent event,
    Emitter<UserReviewsState> emit,
  ) async {
    emit(state.copyWith(status: UserReviewsStatus.actionLoading));

    final result = await deleteMyReviewUseCase(event.reviewId);

    result.fold(
      (failure) => emit(
        state.copyWith(status: UserReviewsStatus.failure, failure: failure),
      ),
      (success) {
        final updatedList = state.reviews
            .where((r) => r.id != event.reviewId)
            .toList();
        emit(
          state.copyWith(
            status: UserReviewsStatus.deleteSuccess,
            reviews: updatedList,
            total: state.total > 0 ? state.total - 1 : 0,
            message: 'Đánh giá đã được xóa thành công',
          ),
        );
      },
    );
  }

  Future<void> _onUpdateUserReview(
    UpdateUserReviewEvent event,
    Emitter<UserReviewsState> emit,
  ) async {
    emit(state.copyWith(status: UserReviewsStatus.actionLoading));

    final result = await updateMyReviewUseCase(
      reviewId: event.reviewId,
      rating: event.rating,
      comment: event.comment,
      images: event.images,
    );

    result.fold(
      (failure) => emit(
        state.copyWith(status: UserReviewsStatus.failure, failure: failure),
      ),
      (updatedReview) {
        final updatedList = state.reviews.map((r) {
          return r.id == updatedReview.id ? updatedReview : r;
        }).toList();

        emit(
          state.copyWith(
            status: UserReviewsStatus.updateSuccess,
            reviews: updatedList,
            selectedReview: updatedReview,
            message: 'Cập nhật đánh giá thành công',
          ),
        );
      },
    );
  }

  Future<void> _onGetUserReviewDetail(
    GetUserReviewDetailEvent event,
    Emitter<UserReviewsState> emit,
  ) async {
    final result = await getMyReviewDetailUseCase(event.reviewId);

    result.fold(
      (failure) => emit(
        state.copyWith(status: UserReviewsStatus.failure, failure: failure),
      ),
      (review) => emit(
        state.copyWith(
          status: UserReviewsStatus.success,
          selectedReview: review,
        ),
      ),
    );
  }
}
