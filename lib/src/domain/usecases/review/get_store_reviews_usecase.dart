import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/review/review_entity.dart';
import '../../repositories/review/review_repository.dart';

class GetStoreReviewsUseCase {
  final ReviewRepository repository;

  const GetStoreReviewsUseCase(this.repository);

  Future<Either<Failure, ReviewListEntity>> call({
    required String storeId,
    int page = 1,
    int limit = 10,
    int? rating,
  }) {
    return repository.getStoreReviews(
      storeId: storeId,
      page: page,
      limit: limit,
      rating: rating,
    );
  }
}
