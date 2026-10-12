import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/booking/booking_availability_entity.dart';
import '../../entities/booking/booking_item_param.dart';
import '../../repositories/booking/booking_repository.dart';

class GetAvailabilityUseCase {
  final BookingRepository _repository;

  const GetAvailabilityUseCase(this._repository);

  Future<Either<Failure, BookingAvailabilityEntity>> call({
    required String storeId,
    required List<BookingItemParam> services,
    String? dateFrom,
    String? dateTo,
    int stepMinutes = 15,
    String mode = 'SLOT_SEARCH',
    String orderMode = 'FLEXIBLE',
  }) {
    return _repository.getAvailability(
      storeId: storeId,
      services: services,
      dateFrom: dateFrom,
      dateTo: dateTo,
      stepMinutes: stepMinutes,
      mode: mode,
      orderMode: orderMode,
    );
  }
}
