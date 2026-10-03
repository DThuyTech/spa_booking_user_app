import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/store/store_entity.dart';
import '../../repositories/store/store_repository.dart';

class GetStoresUseCase {
  final StoreRepository _repository;

  const GetStoresUseCase(this._repository);

  Future<Either<Failure, List<StoreEntity>>> call({
    String? search,
    String? province,
    String? district,
    int page = 1,
    int limit = 10,
  }) {
    return _repository.getStores(
      search: search,
      province: province,
      district: district,
      page: page,
      limit: limit,
    );
  }
}
