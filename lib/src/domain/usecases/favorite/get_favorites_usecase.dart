import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/favorite/favorite_store_entity.dart';
import '../../repositories/favorite/favorite_repository.dart';

class GetFavoritesUseCase {
  final FavoriteRepository repository;

  const GetFavoritesUseCase(this.repository);

  Future<Either<Failure, List<FavoriteStoreEntity>>> call({
    int page = 1,
    int limit = 20,
  }) {
    return repository.getFavorites(page: page, limit: limit);
  }
}

class ToggleFavoriteUseCase {
  final FavoriteRepository repository;

  const ToggleFavoriteUseCase(this.repository);

  Future<Either<Failure, bool>> call({
    required String storeId,
    required bool isFavorite,
  }) {
    if (isFavorite) {
      return repository.addFavorite(storeId);
    } else {
      return repository.removeFavorite(storeId);
    }
  }
}
