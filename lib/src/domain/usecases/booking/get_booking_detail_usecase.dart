import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/booking/booking_entity.dart';
import '../../repositories/booking/booking_repository.dart';

class GetBookingDetailUseCase {
  final BookingRepository _repository;

  const GetBookingDetailUseCase(this._repository);

  Future<Either<Failure, BookingEntity>> call(String bookingId) {
    return _repository.getBookingDetail(bookingId);
  }
}
