import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/store/store_entity.dart';
import '../../repositories/store/store_repository.dart';

class GetRecentlyBookedStoresUseCase {
  final StoreRepository repository;

  const GetRecentlyBookedStoresUseCase(this.repository);

  Future<Either<Failure, List<StoreEntity>>> call({int limit = 10}) {
    return repository.getRecentlyBookedStores(limit: limit);
  }
}
