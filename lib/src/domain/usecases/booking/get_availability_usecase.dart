import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/booking/booking_availability_entity.dart';
import '../../repositories/booking/booking_repository.dart';

class GetAvailabilityUseCase {
  final BookingRepository _repository;

  const GetAvailabilityUseCase(this._repository);

  Future<Either<Failure, BookingAvailabilityEntity>> call({
    required String storeId,
    required String date,
    required List<String> serviceIds,
    String? staffProfileId,
  }) {
    return _repository.getAvailability(
      storeId: storeId,
      date: date,
      serviceIds: serviceIds,
      staffProfileId: staffProfileId,
    );
  }
}
