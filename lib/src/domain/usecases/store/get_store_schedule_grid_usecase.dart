import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/store/schedule_grid_entity.dart';
import '../../repositories/store/store_repository.dart';

class GetStoreScheduleGridUseCase {
  final StoreRepository _repository;

  const GetStoreScheduleGridUseCase(this._repository);

  Future<Either<Failure, ScheduleGridEntity>> call({
    required String storeId,
    required String date,
    String? staffProfileId,
  }) {
    return _repository.getStoreScheduleGrid(
      storeId: storeId,
      date: date,
      staffProfileId: staffProfileId,
    );
  }
}
