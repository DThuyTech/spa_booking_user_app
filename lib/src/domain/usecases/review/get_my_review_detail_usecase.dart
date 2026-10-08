import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/review/user_review_entity.dart';
import '../../repositories/review/review_repository.dart';

class GetMyReviewDetailUseCase {
  final ReviewRepository repository;

  const GetMyReviewDetailUseCase(this.repository);

  Future<Either<Failure, UserReviewEntity>> call(String reviewId) {
    return repository.getMyReviewDetail(reviewId);
  }
}
