import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/store/store_detail_entity.dart';
import '../../repositories/store/store_repository.dart';

class GetStoreDetailUseCase {
  final StoreRepository _repository;

  const GetStoreDetailUseCase(this._repository);

  Future<Either<Failure, StoreDetailEntity>> call(String storeId) {
    return _repository.getStoreDetail(storeId);
  }
}
