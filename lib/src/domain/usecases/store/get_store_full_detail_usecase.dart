import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/domain/entities/store/store.dart';
import '../../repositories/store/store_repository.dart';

class GetStoreFullDetailUseCase {
  final StoreRepository _repository;

  const GetStoreFullDetailUseCase(this._repository);

  Future<Either<Failure, StoreFullDetailEntity>> call(String storeId) {
    return _repository.getStoreFullDetail(storeId: storeId);
  }
}
