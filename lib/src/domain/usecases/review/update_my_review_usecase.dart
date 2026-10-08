import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/review/user_review_entity.dart';
import '../../repositories/review/review_repository.dart';

class UpdateMyReviewUseCase {
  final ReviewRepository repository;

  const UpdateMyReviewUseCase(this.repository);

  Future<Either<Failure, UserReviewEntity>> call({
    required String reviewId,
    int? rating,
    String? comment,
    List<String>? images,
  }) {
    return repository.updateMyReview(
      reviewId: reviewId,
      rating: rating,
      comment: comment,
      images: images,
    );
  }
}
