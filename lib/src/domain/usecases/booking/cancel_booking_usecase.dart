import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/booking/booking_entity.dart';
import '../../repositories/booking/booking_repository.dart';

class CancelBookingUseCase {
  final BookingRepository _repository;

  const CancelBookingUseCase(this._repository);

  Future<Either<Failure, BookingEntity>> call({
    required String bookingId,
    String? cancellationReason,
  }) {
    return _repository.cancelBooking(
      bookingId: bookingId,
      cancellationReason: cancellationReason,
    );
  }
}
