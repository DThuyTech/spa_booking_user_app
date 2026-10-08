import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/review/review_entity.dart';

import '../../entities/review/user_review_entity.dart';

abstract interface class ReviewRepository {
  Future<Either<Failure, ReviewListEntity>> getStoreReviews({
    required String storeId,
    int page = 1,
    int limit = 10,
    int? rating,
  });

  Future<Either<Failure, ReviewEntity>> createReview({
    required String storeId,
    required String bookingId,
    required int rating,
    required String comment,
    List<String> images = const [],
  });

  Future<Either<Failure, ReviewEntity>> createBookingReview({
    required String bookingId,
    required int rating,
    required String comment,
    List<String> images = const [],
  });

  Future<Either<Failure, UserReviewListEntity>> getMyReviews({
    int page = 1,
    int limit = 10,
  });

  Future<Either<Failure, UserReviewEntity>> getMyReviewDetail(String reviewId);

  Future<Either<Failure, UserReviewEntity>> updateMyReview({
    required String reviewId,
    int? rating,
    String? comment,
    List<String>? images,
  });

  Future<Either<Failure, bool>> deleteMyReview(String reviewId);
}
