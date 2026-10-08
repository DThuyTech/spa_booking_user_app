import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/review/user_review_entity.dart';
import '../../repositories/review/review_repository.dart';

class GetMyReviewsUseCase {
  final ReviewRepository repository;

  const GetMyReviewsUseCase(this.repository);

  Future<Either<Failure, UserReviewListEntity>> call({
    int page = 1,
    int limit = 10,
  }) {
    return repository.getMyReviews(page: page, limit: limit);
  }
}
