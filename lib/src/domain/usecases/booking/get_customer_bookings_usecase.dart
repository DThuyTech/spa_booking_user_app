import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/booking/booking_list_entity.dart';
import '../../repositories/booking/booking_repository.dart';

class GetCustomerBookingsUseCase {
  final BookingRepository _repository;

  const GetCustomerBookingsUseCase(this._repository);

  Future<Either<Failure, BookingListResponseEntity>> call({
    String? tab,
    String? status,
    String? date,
    int page = 1,
    int limit = 20,
  }) {
    return _repository.getCustomerBookings(
      tab: tab,
      status: status,
      date: date,
      page: page,
      limit: limit,
    );
  }
}
