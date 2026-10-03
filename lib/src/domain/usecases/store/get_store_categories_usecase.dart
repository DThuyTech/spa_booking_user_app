import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/store/service_category_entity.dart';
import '../../repositories/store/store_repository.dart';

class GetStoreCategoriesUseCase {
  final StoreRepository _repository;

  const GetStoreCategoriesUseCase(this._repository);

  Future<Either<Failure, List<ServiceCategoryEntity>>> call(String storeId) {
    return _repository.getStoreCategories(storeId);
  }
}
