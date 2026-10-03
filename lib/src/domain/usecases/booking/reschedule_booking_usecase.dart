import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/booking/booking_entity.dart';
import '../../repositories/booking/booking_repository.dart';

class RescheduleBookingUseCase {
  final BookingRepository _repository;

  const RescheduleBookingUseCase(this._repository);

  Future<Either<Failure, BookingEntity>> call({
    required String bookingId,
    required String startAt,
  }) {
    return _repository.rescheduleBooking(
      bookingId: bookingId,
      startAt: startAt,
    );
  }
}
