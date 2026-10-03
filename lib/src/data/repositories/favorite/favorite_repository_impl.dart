import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/core/error/failure_mapper.dart';
import '../../../data/datasources/remote/favorite/favorite_remote_data_source.dart';
import '../../../domain/entities/favorite/favorite_store_entity.dart';
import '../../../domain/repositories/favorite/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteRemoteDataSource remoteDataSource;

  const FavoriteRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<FavoriteStoreEntity>>> getFavorites({
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final response = await remoteDataSource.getFavorites(page: page, limit: limit);
      final entities = response.items.map((m) => m.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, bool>> addFavorite(String storeId) async {
    try {
      final result = await remoteDataSource.addFavorite(storeId);
      return Right(result);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, bool>> removeFavorite(String storeId) async {
    try {
      final result = await remoteDataSource.removeFavorite(storeId);
      return Right(result);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }
}
