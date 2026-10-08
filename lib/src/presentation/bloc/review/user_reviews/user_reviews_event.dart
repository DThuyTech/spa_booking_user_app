import 'package:equatable/equatable.dart';

abstract class UserReviewsEvent extends Equatable {
  const UserReviewsEvent();

  @override
  List<Object?> get props => [];
}

class FetchUserReviewsEvent extends UserReviewsEvent {
  final int page;
  final bool isRefresh;

  const FetchUserReviewsEvent({this.page = 1, this.isRefresh = false});

  @override
  List<Object?> get props => [page, isRefresh];
}

class LoadMoreUserReviewsEvent extends UserReviewsEvent {
  const LoadMoreUserReviewsEvent();
}

class DeleteUserReviewEvent extends UserReviewsEvent {
  final String reviewId;

  const DeleteUserReviewEvent(this.reviewId);

  @override
  List<Object?> get props => [reviewId];
}

class UpdateUserReviewEvent extends UserReviewsEvent {
  final String reviewId;
  final int? rating;
  final String? comment;
  final List<String>? images;

  const UpdateUserReviewEvent({
    required this.reviewId,
    this.rating,
    this.comment,
    this.images,
  });

  @override
  List<Object?> get props => [reviewId, rating, comment, images];
}

class GetUserReviewDetailEvent extends UserReviewsEvent {
  final String reviewId;

  const GetUserReviewDetailEvent(this.reviewId);

  @override
  List<Object?> get props => [reviewId];
}
