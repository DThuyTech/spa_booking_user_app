import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/store/store_entity.dart';
import '../../repositories/store/store_repository.dart';

class GetNearbyStoresUseCase {
  final StoreRepository repository;

  const GetNearbyStoresUseCase(this.repository);

  Future<Either<Failure, List<StoreEntity>>> call({
    required double lat,
    required double lng,
    double? distanceKm,
    double? radius,
    int? page,
    int limit = 10,
    String? search,
    String? city,
    String? district,
    bool? isFavorite,
  }) {
    return repository.getNearbyStores(
      lat: lat,
      lng: lng,
      distanceKm: distanceKm,
      radius: radius,
      page: page,
      limit: limit,
      search: search,
      city: city,
      district: district,
      isFavorite: isFavorite,
    );
  }
}
