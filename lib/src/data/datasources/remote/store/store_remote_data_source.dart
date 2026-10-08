import 'package:spa_booking/src/core/network/network_client.dart';
import 'package:spa_booking/src/data/model/store/service_category_model.dart';
import 'package:spa_booking/src/data/model/store/service_model.dart';
import 'package:spa_booking/src/data/model/store/staff_model.dart';
import 'package:spa_booking/src/data/model/store/store_detail_model.dart';
import 'package:spa_booking/src/data/model/store/store_full_detail_model.dart';
import 'package:spa_booking/src/data/model/store/store_gallery_model.dart';
import 'package:spa_booking/src/data/model/store/store_list_response_model.dart';
import 'package:spa_booking/src/data/model/store/store_model.dart';
import 'package:spa_booking/src/data/model/store/store_schedule_grid_model.dart';

abstract interface class StoreRemoteDataSource {
  Future<StoreListResponseModel> getStores({
    String? search,
    String? serviceName,
    String? serviceId,
    double? lat,
    double? lng,
    double? distanceKm,
    String? city,
    String? province,
    String? district,
    int? minPrice,
    int? maxPrice,
    double? minRating,
    String? hasAvailabilityDate,
    bool? isFavorite,
    String? sortBy,
    int page = 1,
    int limit = 10,
  });

  Future<StoreListResponseModel> getNearbyStores({
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
  });

  Future<List<StoreModel>> getRecentlyBookedStores({int limit = 10});

  Future<StoreDetailModel> getStoreDetail(String storeId);

  Future<StoreFullDetailModel> getStoreFullDetail(String storeId);

  Future<StoreScheduleGridModel> getStoreScheduleGrid({
    required String storeId,
    required String date,
    String? staffProfileId,
  });

  Future<List<ServiceCategoryModel>> getStoreCategories(String storeId);

  Future<List<ServiceModel>> getStoreServices(
    String storeId, {
    String? categoryId,
    String? search,
  });

  Future<List<StaffModel>> getStoreStaff(String storeId, {String? serviceId});

  Future<StoreGalleryResponseModel> getStoreGallery(
    String storeId, {
    String category = 'ALL',
  });
}

class StoreRemoteDataSourceImpl implements StoreRemoteDataSource {
  final NetworkClient _client;

  const StoreRemoteDataSourceImpl(this._client);

  @override
  Future<StoreListResponseModel> getStores({
    String? search,
    String? serviceName,
    String? serviceId,
    double? lat,
    double? lng,
    double? distanceKm,
    String? city,
    String? province,
    String? district,
    int? minPrice,
    int? maxPrice,
    double? minRating,
    String? hasAvailabilityDate,
    bool? isFavorite,
    String? sortBy,
    int page = 1,
    int limit = 10,
  }) async {
    final safeLimit = limit.clamp(1, 50);
    final queryParams = <String, dynamic>{'page': page, 'limit': safeLimit};
    if (search != null && search.trim().isNotEmpty) {
      queryParams['search'] = search.trim();
    }
    if (serviceName != null && serviceName.trim().isNotEmpty) {
      queryParams['serviceName'] = serviceName.trim();
    }
    if (serviceId != null && serviceId.trim().isNotEmpty) {
      queryParams['serviceId'] = serviceId.trim();
    }
    if (lat != null) queryParams['lat'] = lat;
    if (lng != null) queryParams['lng'] = lng;
    if (distanceKm != null) queryParams['distanceKm'] = distanceKm;
    final resolvedCity = (city != null && city.trim().isNotEmpty)
        ? city.trim()
        : (province != null && province.trim().isNotEmpty
              ? province.trim()
              : null);
    if (resolvedCity != null) {
      queryParams['city'] = resolvedCity;
    }
    if (district != null && district.trim().isNotEmpty) {
      queryParams['district'] = district.trim();
    }
    if (minPrice != null) queryParams['minPrice'] = minPrice;
    if (maxPrice != null) queryParams['maxPrice'] = maxPrice;
    if (minRating != null) queryParams['minRating'] = minRating;
    if (hasAvailabilityDate != null && hasAvailabilityDate.trim().isNotEmpty) {
      queryParams['hasAvailabilityDate'] = hasAvailabilityDate.trim();
    }
    if (isFavorite != null) queryParams['isFavorite'] = isFavorite;
    if (sortBy != null && sortBy.trim().isNotEmpty) {
      queryParams['sortBy'] = sortBy.trim();
    }

    final response = await _client.get<dynamic>(
      '/public/stores',
      queryParameters: queryParams,
    );

    var result = _parseStoreListResponse(response.data);

    // If city was filtered on backend and returned 0 results, retry without city parameter
    // because stores in backend DB often have city column null while address contains the city.
    if (result.items.isEmpty && resolvedCity != null) {
      try {
        final fallbackParams = Map<String, dynamic>.from(queryParams)
          ..remove('city');
        final fallbackResponse = await _client.get<dynamic>(
          '/public/stores',
          queryParameters: fallbackParams,
        );
        final fallbackResult = _parseStoreListResponse(fallbackResponse.data);
        if (fallbackResult.items.isNotEmpty) {
          final normCity = resolvedCity
              .toLowerCase()
              .replaceAll('thành phố', '')
              .replaceAll('tp.', '')
              .replaceAll('city', '')
              .trim();
          final matched = fallbackResult.items.where((s) {
            final addr = s.address.toLowerCase();
            final scity = (s.city ?? '').toLowerCase();
            if (scity.contains(normCity) || addr.contains(normCity))
              return true;
            if (normCity.contains('hồ chí minh') ||
                normCity.contains('ho chi minh')) {
              return addr.contains('hồ chí minh') ||
                  addr.contains('ho chi minh') ||
                  addr.contains('hcm') ||
                  addr.contains('sài gòn') ||
                  addr.contains('bình thạnh') ||
                  addr.contains('quận');
            }
            return false;
          }).toList();

          result = StoreListResponseModel(
            items: matched.isNotEmpty ? matched : fallbackResult.items,
            pagination: fallbackResult.pagination,
          );
        }
      } catch (_) {}
    }

    return result;
  }

  StoreListResponseModel _parseStoreListResponse(dynamic data) {
    if (data is List) {
      final items = data
          .whereType<Map<String, dynamic>>()
          .map(StoreModel.fromJson)
          .toList();
      return StoreListResponseModel(items: items);
    } else if (data is Map<String, dynamic>) {
      if (data['data'] is List) {
        final items = (data['data'] as List)
            .whereType<Map<String, dynamic>>()
            .map(StoreModel.fromJson)
            .toList();
        return StoreListResponseModel(items: items);
      }
      final payload = (data['data'] is Map<String, dynamic>)
          ? data['data'] as Map<String, dynamic>
          : data;
      if (payload['items'] is List || payload['data'] is List) {
        return StoreListResponseModel.fromJson(payload);
      }
      return StoreListResponseModel.fromJson(data);
    }
    return const StoreListResponseModel();
  }

  @override
  Future<StoreListResponseModel> getNearbyStores({
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
  }) async {
    final safeLimit = limit.clamp(1, 50);
    final queryParams = <String, dynamic>{
      'lat': lat,
      'lng': lng,
      'limit': safeLimit,
    };
    if (page != null && page > 0) {
      queryParams['page'] = page;
    }
    if (distanceKm != null) {
      queryParams['distanceKm'] = distanceKm;
    } else if (radius != null) {
      queryParams['radius'] = radius;
    }
    if (search != null && search.trim().isNotEmpty) {
      queryParams['search'] = search.trim();
    }
    if (city != null && city.trim().isNotEmpty) {
      queryParams['city'] = city.trim();
    }
    if (district != null && district.trim().isNotEmpty) {
      queryParams['district'] = district.trim();
    }
    if (isFavorite != null) {
      queryParams['isFavorite'] = isFavorite;
    }

    final response = await _client.get<dynamic>(
      '/public/stores/nearby',
      queryParameters: queryParams,
    );

    final data = response.data;
    if (data is List) {
      final items = data
          .whereType<Map<String, dynamic>>()
          .map(StoreModel.fromJson)
          .toList();
      return StoreListResponseModel(items: items);
    } else if (data is Map<String, dynamic>) {
      if (data['data'] is List) {
        final items = (data['data'] as List)
            .whereType<Map<String, dynamic>>()
            .map(StoreModel.fromJson)
            .toList();
        return StoreListResponseModel(items: items);
      }
      final payload = (data['data'] is Map<String, dynamic>)
          ? data['data'] as Map<String, dynamic>
          : data;
      if (payload['items'] is List || payload['data'] is List) {
        return StoreListResponseModel.fromJson(payload);
      }
      return StoreListResponseModel.fromJson(data);
    }
    return const StoreListResponseModel();
  }

  @override
  Future<List<StoreModel>> getRecentlyBookedStores({int limit = 10}) async {
    final response = await _client.get<dynamic>(
      '/customer/stores/booked',
      queryParameters: {'limit': limit},
    );
    final data = response.data;
    List<dynamic> list = [];
    if (data is List) {
      list = data;
    } else if (data is Map<String, dynamic>) {
      final inner = data['data'];
      if (inner is List) {
        list = inner;
      } else if (inner is Map<String, dynamic> && inner['items'] is List) {
        list = inner['items'] as List;
      } else if (data['items'] is List) {
        list = data['items'] as List;
      }
    }
    return list
        .map(
          (item) => StoreModel.fromJson(Map<String, dynamic>.from(item as Map)),
        )
        .toList();
  }

  @override
  Future<StoreDetailModel> getStoreDetail(String storeId) async {
    final response = await _client.get<Map<String, dynamic>>(
      '/public/stores/$storeId',
    );

    final data = response.data;
    if (data != null) {
      final payload = (data['data'] as Map<String, dynamic>?) ?? data;
      return StoreDetailModel.fromJson(payload);
    }
    throw const FormatException('Empty response received for store detail');
  }

  @override
  Future<StoreFullDetailModel> getStoreFullDetail(String storeId) async {
    final response = await _client.get<Map<String, dynamic>>(
      '/public/stores/$storeId/full-detail',
    );

    final data = response.data;
    if (data != null) {
      final payload = (data['data'] as Map<String, dynamic>?) ?? data;
      return StoreFullDetailModel.fromJson(payload);
    }
    throw const FormatException(
      'Empty response received for store full-detail',
    );
  }

  @override
  Future<StoreScheduleGridModel> getStoreScheduleGrid({
    required String storeId,
    required String date,
    String? staffProfileId,
  }) async {
    final queryParams = <String, dynamic>{'date': date};
    if (staffProfileId != null && staffProfileId.isNotEmpty) {
      queryParams['staffProfileId'] = staffProfileId;
    }

    final response = await _client.get<Map<String, dynamic>>(
      '/public/stores/$storeId/schedule-grid',
      queryParameters: queryParams,
    );

    final data = response.data;
    if (data != null) {
      final payload = (data['data'] as Map<String, dynamic>?) ?? data;
      return StoreScheduleGridModel.fromJson(payload);
    }
    throw const FormatException(
      'Empty response received for store schedule grid',
    );
  }

  @override
  Future<List<ServiceCategoryModel>> getStoreCategories(String storeId) async {
    final response = await _client.get<dynamic>(
      '/public/stores/$storeId/service-categories',
    );

    final data = response.data;
    List<dynamic> list = [];
    if (data is List) {
      list = data;
    } else if (data is Map<String, dynamic>) {
      list =
          (data['data'] as List<dynamic>?) ??
          (data['items'] as List<dynamic>?) ??
          [];
    }

    return list
        .whereType<Map<String, dynamic>>()
        .map(ServiceCategoryModel.fromJson)
        .toList();
  }

  @override
  Future<List<ServiceModel>> getStoreServices(
    String storeId, {
    String? categoryId,
    String? search,
  }) async {
    final queryParams = <String, dynamic>{};
    if (categoryId != null && categoryId.isNotEmpty) {
      queryParams['categoryId'] = categoryId;
    }
    if (search != null && search.trim().isNotEmpty) {
      queryParams['search'] = search.trim();
    }

    final response = await _client.get<dynamic>(
      '/public/stores/$storeId/services',
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
    );

    final data = response.data;
    List<dynamic> list = [];
    if (data is List) {
      list = data;
    } else if (data is Map<String, dynamic>) {
      list =
          (data['data'] as List<dynamic>?) ??
          (data['items'] as List<dynamic>?) ??
          [];
    }

    return list
        .whereType<Map<String, dynamic>>()
        .map(ServiceModel.fromJson)
        .toList();
  }

  @override
  Future<List<StaffModel>> getStoreStaff(
    String storeId, {
    String? serviceId,
  }) async {
    final queryParams = <String, dynamic>{};
    if (serviceId != null && serviceId.isNotEmpty) {
      queryParams['serviceId'] = serviceId;
    }

    final response = await _client.get<dynamic>(
      '/public/stores/$storeId/staff',
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
    );

    final data = response.data;
    List<dynamic> list = [];
    if (data is List) {
      list = data;
    } else if (data is Map<String, dynamic>) {
      list =
          (data['data'] as List<dynamic>?) ??
          (data['items'] as List<dynamic>?) ??
          [];
    }

    return list
        .whereType<Map<String, dynamic>>()
        .map(StaffModel.fromJson)
        .toList();
  }

  @override
  Future<StoreGalleryResponseModel> getStoreGallery(
    String storeId, {
    String category = 'ALL',
  }) async {
    final response = await _client.get<Map<String, dynamic>>(
      '/public/stores/$storeId/gallery',
      queryParameters: {'category': category},
    );

    final data = response.data;
    if (data != null) {
      final payload = (data['data'] as Map<String, dynamic>?) ?? data;
      return StoreGalleryResponseModel.fromJson(payload);
    }
    throw const FormatException('Empty response received for store gallery');
  }
}
