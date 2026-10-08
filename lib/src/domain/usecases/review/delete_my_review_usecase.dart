import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../repositories/review/review_repository.dart';

class DeleteMyReviewUseCase {
  final ReviewRepository repository;

  const DeleteMyReviewUseCase(this.repository);

  Future<Either<Failure, bool>> call(String reviewId) {
    return repository.deleteMyReview(reviewId);
  }
}
