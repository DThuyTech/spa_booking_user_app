import 'package:spa_booking/src/core/network/network_client.dart';
import 'package:spa_booking/src/data/model/favorite/favorite_store_model.dart';

abstract interface class FavoriteRemoteDataSource {
  Future<FavoriteListResponseModel> getFavorites({
    int page = 1,
    int limit = 20,
  });

  Future<bool> toggleFavorite(String storeId);

  Future<bool> checkFavorite(String storeId);

  Future<bool> addFavorite(String storeId);

  Future<bool> removeFavorite(String storeId);
}

class FavoriteRemoteDataSourceImpl implements FavoriteRemoteDataSource {
  final NetworkClient _client;

  const FavoriteRemoteDataSourceImpl(this._client);

  @override
  Future<FavoriteListResponseModel> getFavorites({
    int page = 1,
    int limit = 20,
  }) async {
    final safeLimit = limit.clamp(1, 50);
    final response = await _client.get<Map<String, dynamic>>(
      '/customer/favorites/stores',
      queryParameters: {'page': page, 'limit': safeLimit},
    );

    final data = response.data;
    if (data != null) {
      final payload = (data['data'] as Map<String, dynamic>?) ?? data;
      return FavoriteListResponseModel.fromJson(payload);
    }
    return const FavoriteListResponseModel();
  }

  @override
  Future<bool> toggleFavorite(String storeId) async {
    final response = await _client.post<Map<String, dynamic>>(
      '/customer/stores/$storeId/favorite/toggle',
    );
    final data = response.data;
    if (data != null) {
      final payload = (data['data'] as Map<String, dynamic>?) ?? data;
      return payload['isFavorite'] as bool? ?? true;
    }
    return true;
  }

  @override
  Future<bool> checkFavorite(String storeId) async {
    final response = await _client.get<Map<String, dynamic>>(
      '/customer/stores/$storeId/favorite',
    );
    final data = response.data;
    if (data != null) {
      final payload = (data['data'] as Map<String, dynamic>?) ?? data;
      return payload['isFavorite'] as bool? ?? false;
    }
    return false;
  }

  @override
  Future<bool> addFavorite(String storeId) async {
    return toggleFavorite(storeId);
  }

  @override
  Future<bool> removeFavorite(String storeId) async {
    return toggleFavorite(storeId);
  }
}
