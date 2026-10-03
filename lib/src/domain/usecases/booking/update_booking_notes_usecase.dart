import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/booking/booking_entity.dart';
import '../../repositories/booking/booking_repository.dart';

class UpdateBookingNotesUseCase {
  final BookingRepository repository;

  const UpdateBookingNotesUseCase(this.repository);

  Future<Either<Failure, BookingEntity>> call({
    required String bookingId,
    required String note,
  }) {
    return repository.updateBookingNotes(
      bookingId: bookingId,
      note: note,
    );
  }
}
