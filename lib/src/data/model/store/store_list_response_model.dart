// ignore_for_file: unused_element
import 'package:freezed_annotation/freezed_annotation.dart';
import 'store_model.dart';

part 'store_list_response_model.freezed.dart';
part 'store_list_response_model.g.dart';

@freezed
abstract class StorePaginationModel with _$StorePaginationModel {
  const factory StorePaginationModel({
    @Default(0) int total,
    @Default(1) int page,
    @Default(10) int limit,
    @Default(1) int totalPages,
  }) = _StorePaginationModel;

  factory StorePaginationModel.fromJson(Map<String, dynamic> json) =>
      _$StorePaginationModelFromJson(json);
}

@freezed
abstract class StoreListResponseModel with _$StoreListResponseModel {
  const factory StoreListResponseModel({
    @Default([]) List<StoreModel> items,
    StorePaginationModel? pagination,
  }) = _StoreListResponseModel;

  factory StoreListResponseModel.fromJson(Map<String, dynamic> json) {
    final rawItems = json['items'] ?? json['data'] ?? json['stores'];
    List<StoreModel> items = [];
    if (rawItems is List) {
      items = rawItems
          .whereType<Map<String, dynamic>>()
          .map(StoreModel.fromJson)
          .toList();
    }

    StorePaginationModel? pagination;
    if (json['pagination'] is Map<String, dynamic>) {
      pagination = StorePaginationModel.fromJson(
        json['pagination'] as Map<String, dynamic>,
      );
    } else if (json.containsKey('total')) {
      pagination = StorePaginationModel(
        total: (json['total'] as num?)?.toInt() ?? 0,
        page: (json['page'] as num?)?.toInt() ?? 1,
        limit: (json['limit'] as num?)?.toInt() ?? 10,
        totalPages: (json['totalPages'] as num?)?.toInt() ?? 1,
      );
    }

    return StoreListResponseModel(items: items, pagination: pagination);
  }
}
