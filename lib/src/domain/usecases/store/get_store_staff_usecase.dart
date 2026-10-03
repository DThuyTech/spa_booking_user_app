import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/store/staff_entity.dart';
import '../../repositories/store/store_repository.dart';

class GetStoreStaffUseCase {
  final StoreRepository _repository;

  const GetStoreStaffUseCase(this._repository);

  Future<Either<Failure, List<StaffEntity>>> call(
    String storeId, {
    String? serviceId,
  }) {
    return _repository.getStoreStaff(
      storeId,
      serviceId: serviceId,
    );
  }
}
