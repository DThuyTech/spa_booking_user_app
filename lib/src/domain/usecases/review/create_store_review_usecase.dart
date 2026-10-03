import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/review/review_entity.dart';
import '../../repositories/review/review_repository.dart';

class CreateStoreReviewUseCase {
  final ReviewRepository repository;

  const CreateStoreReviewUseCase(this.repository);

  Future<Either<Failure, ReviewEntity>> call({
    required String storeId,
    required String bookingId,
    required int rating,
    required String comment,
    List<String> images = const [],
  }) {
    return repository.createReview(
      storeId: storeId,
      bookingId: bookingId,
      rating: rating,
      comment: comment,
      images: images,
    );
  }
}
