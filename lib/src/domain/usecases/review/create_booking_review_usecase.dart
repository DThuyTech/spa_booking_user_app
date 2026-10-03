import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/review/review_entity.dart';
import '../../repositories/review/review_repository.dart';

class CreateBookingReviewUseCase {
  final ReviewRepository repository;

  const CreateBookingReviewUseCase(this.repository);

  Future<Either<Failure, ReviewEntity>> call({
    required String bookingId,
    required int rating,
    required String comment,
    List<String> images = const [],
  }) {
    return repository.createBookingReview(
      bookingId: bookingId,
      rating: rating,
      comment: comment,
      images: images,
    );
  }
}
