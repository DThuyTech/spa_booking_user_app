import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/favorite/favorite_store_entity.dart';

abstract interface class FavoriteRepository {
  Future<Either<Failure, List<FavoriteStoreEntity>>> getFavorites({
    int page = 1,
    int limit = 20,
  });

  Future<Either<Failure, bool>> toggleFavorite(String storeId);

  Future<Either<Failure, bool>> checkFavorite(String storeId);

  Future<Either<Failure, bool>> addFavorite(String storeId);

  Future<Either<Failure, bool>> removeFavorite(String storeId);
}
