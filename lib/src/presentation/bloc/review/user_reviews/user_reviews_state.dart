import 'package:equatable/equatable.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/entities/review/user_review_entity.dart';

enum UserReviewsStatus {
  initial,
  loading,
  success,
  failure,
  actionLoading,
  deleteSuccess,
  updateSuccess,
}

class UserReviewsState extends Equatable {
  final UserReviewsStatus status;
  final List<UserReviewEntity> reviews;
  final UserReviewEntity? selectedReview;
  final int page;
  final int totalPages;
  final int total;
  final bool hasReachedMax;
  final Failure? failure;
  final String? message;

  const UserReviewsState({
    this.status = UserReviewsStatus.initial,
    this.reviews = const [],
    this.selectedReview,
    this.page = 1,
    this.totalPages = 1,
    this.total = 0,
    this.hasReachedMax = false,
    this.failure,
    this.message,
  });

  UserReviewsState copyWith({
    UserReviewsStatus? status,
    List<UserReviewEntity>? reviews,
    UserReviewEntity? selectedReview,
    int? page,
    int? totalPages,
    int? total,
    bool? hasReachedMax,
    Failure? failure,
    String? message,
  }) {
    return UserReviewsState(
      status: status ?? this.status,
      reviews: reviews ?? this.reviews,
      selectedReview: selectedReview ?? this.selectedReview,
      page: page ?? this.page,
      totalPages: totalPages ?? this.totalPages,
      total: total ?? this.total,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      failure: failure,
      message: message,
    );
  }

  @override
  List<Object?> get props => [
    status,
    reviews,
    selectedReview,
    page,
    totalPages,
    total,
    hasReachedMax,
    failure,
    message,
  ];
}
