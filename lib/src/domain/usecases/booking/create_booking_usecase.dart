import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/booking/booking_entity.dart';
import '../../entities/booking/booking_item_param.dart';
import '../../repositories/booking/booking_repository.dart';

class CreateBookingUseCase {
  final BookingRepository _repository;

  const CreateBookingUseCase(this._repository);

  Future<Either<Failure, BookingEntity>> call({
    required String storeId,
    String? startAt,
    List<BookingItemParam>? items,
    List<String>? serviceIds,
    String? staffProfileId,
    String? note,
  }) {
    return _repository.createBooking(
      storeId: storeId,
      startAt: startAt,
      items: items,
      serviceIds: serviceIds,
      staffProfileId: staffProfileId,
      note: note,
    );
  }
}
