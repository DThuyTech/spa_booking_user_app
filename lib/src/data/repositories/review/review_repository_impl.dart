import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/core/error/failure_mapper.dart';
import '../../../data/datasources/remote/review/review_remote_data_source.dart';
import '../../../domain/entities/review/review_entity.dart';
import '../../../domain/entities/review/user_review_entity.dart';
import '../../../domain/repositories/review/review_repository.dart';

class ReviewRepositoryImpl implements ReviewRepository {
  final ReviewRemoteDataSource remoteDataSource;

  const ReviewRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ReviewListEntity>> getStoreReviews({
    required String storeId,
    int page = 1,
    int limit = 10,
    int? rating,
  }) async {
    try {
      final model = await remoteDataSource.getStoreReviews(
        storeId: storeId,
        page: page,
        limit: limit,
        rating: rating,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, ReviewEntity>> createReview({
    required String storeId,
    required String bookingId,
    required int rating,
    required String comment,
    List<String> images = const [],
  }) async {
    try {
      final model = await remoteDataSource.createReview(
        storeId: storeId,
        bookingId: bookingId,
        rating: rating,
        comment: comment,
        images: images,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, ReviewEntity>> createBookingReview({
    required String bookingId,
    required int rating,
    required String comment,
    List<String> images = const [],
  }) async {
    try {
      final model = await remoteDataSource.createBookingReview(
        bookingId: bookingId,
        rating: rating,
        comment: comment,
        images: images,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, UserReviewListEntity>> getMyReviews({
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final model = await remoteDataSource.getMyReviews(
        page: page,
        limit: limit,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, UserReviewEntity>> getMyReviewDetail(
    String reviewId,
  ) async {
    try {
      final model = await remoteDataSource.getMyReviewDetail(reviewId);
      return Right(model.toEntity());
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, UserReviewEntity>> updateMyReview({
    required String reviewId,
    int? rating,
    String? comment,
    List<String>? images,
  }) async {
    try {
      final model = await remoteDataSource.updateMyReview(
        reviewId: reviewId,
        rating: rating,
        comment: comment,
        images: images,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteMyReview(String reviewId) async {
    try {
      final success = await remoteDataSource.deleteMyReview(reviewId);
      return Right(success);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }
}
