import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/review/review_entity.dart';

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
}
