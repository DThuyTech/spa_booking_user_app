import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/booking/booking_entity.dart';
import '../../repositories/booking/booking_repository.dart';

class CreateBookingUseCase {
  final BookingRepository _repository;

  const CreateBookingUseCase(this._repository);

  Future<Either<Failure, BookingEntity>> call({
    required String storeId,
    required List<String> serviceIds,
    required String startAt,
    String? staffProfileId,
    String? note,
  }) {
    return _repository.createBooking(
      storeId: storeId,
      serviceIds: serviceIds,
      startAt: startAt,
      staffProfileId: staffProfileId,
      note: note,
    );
  }
}
