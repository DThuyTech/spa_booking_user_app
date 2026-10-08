import '../../../../core/network/network_client.dart';
import '../../../model/location/city_model.dart';

abstract interface class LocationRemoteDataSource {
  Future<List<CityModel>> getCities({String? search});
}

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final NetworkClient _client;

  const LocationRemoteDataSourceImpl(this._client);

  @override
  Future<List<CityModel>> getCities({String? search}) async {
    final queryParams = <String, dynamic>{};
    if (search != null && search.trim().isNotEmpty) {
      queryParams['search'] = search.trim();
    }

    final response = await _client.get<dynamic>(
      '/locations/cities',
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
    );

    final data = response.data;
    List<dynamic> list = [];
    if (data is List) {
      list = data;
    } else if (data is Map<String, dynamic>) {
      if (data['data'] is List) {
        list = data['data'] as List;
      } else if (data['items'] is List) {
        list = data['items'] as List;
      }
    }

    return list
        .map(
          (item) => CityModel.fromJson(Map<String, dynamic>.from(item as Map)),
        )
        .toList();
  }
}
