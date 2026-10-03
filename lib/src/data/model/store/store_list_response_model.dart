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
    final normalized = Map<String, dynamic>.from(json);
    if (!normalized.containsKey('pagination') && normalized.containsKey('total')) {
      normalized['pagination'] = {
        'total': normalized['total'],
        'page': normalized['page'] ?? 1,
        'limit': normalized['limit'] ?? 10,
        'totalPages': normalized['totalPages'] ?? 1,
      };
    }
    return _$StoreListResponseModelFromJson(normalized);
  }
}
