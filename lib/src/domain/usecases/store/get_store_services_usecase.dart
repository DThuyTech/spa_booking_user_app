import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/store/service_entity.dart';
import '../../repositories/store/store_repository.dart';

class GetStoreServicesUseCase {
  final StoreRepository _repository;

  const GetStoreServicesUseCase(this._repository);

  Future<Either<Failure, List<ServiceEntity>>> call(
    String storeId, {
    String? categoryId,
    String? search,
  }) {
    return _repository.getStoreServices(
      storeId,
      categoryId: categoryId,
      search: search,
    );
  }
}
