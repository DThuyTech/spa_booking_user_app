import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/store/store_entity.dart';
import '../../repositories/store/store_repository.dart';

class GetStoresUseCase {
  final StoreRepository _repository;

  const GetStoresUseCase(this._repository);

  Future<Either<Failure, List<StoreEntity>>> call({
    String? search,
    String? city,
    String? province,
    String? district,
    bool? isFavorite,
    int? minPrice,
    int? maxPrice,
    double? minRating,
    double? lat,
    double? lng,
    String? sortBy,
    int page = 1,
    int limit = 10,
  }) {
    return _repository.getStores(
      search: search,
      city: city,
      province: province,
      district: district,
      isFavorite: isFavorite,
      minPrice: minPrice,
      maxPrice: maxPrice,
      minRating: minRating,
      lat: lat,
      lng: lng,
      sortBy: sortBy,
      page: page,
      limit: limit,
    );
  }
}
