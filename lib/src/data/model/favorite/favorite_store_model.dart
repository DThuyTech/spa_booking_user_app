import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/favorite/favorite_store_entity.dart';

part 'favorite_store_model.freezed.dart';
part 'favorite_store_model.g.dart';

@freezed
abstract class FavoriteStoreModel with _$FavoriteStoreModel {
  const FavoriteStoreModel._();

  const factory FavoriteStoreModel({
    @JsonKey(readValue: _readId) required String id,
    @JsonKey(readValue: _readName, defaultValue: '') required String name,
    @JsonKey(readValue: _readSlug, defaultValue: '') required String slug,
    @JsonKey(readValue: _readLogoUrl) String? logoUrl,
    @JsonKey(readValue: _readCoverImageUrl) String? coverImageUrl,
    @JsonKey(readValue: _readAddress, defaultValue: '') required String address,
    @JsonKey(readValue: _readPhoneNumber) String? phoneNumber,
    @JsonKey(readValue: _readRating, fromJson: _ratingFromJson)
    double? averageRating,
    @JsonKey(readValue: _readIsFavorite, defaultValue: true)
    required bool isFavorite,
    @JsonKey(readValue: _readFavoritedAt) String? favoritedAt,
  }) = _FavoriteStoreModel;

  factory FavoriteStoreModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteStoreModelFromJson(json);

  FavoriteStoreEntity toEntity() {
    return FavoriteStoreEntity(
      id: id,
      name: name,
      slug: slug,
      averageRating: averageRating,
      logoUrl: logoUrl,
      coverImageUrl: coverImageUrl,
      address: address,
      phoneNumber: phoneNumber,
      isFavorite: isFavorite,
      favoritedAt: favoritedAt != null ? DateTime.tryParse(favoritedAt!) : null,
    );
  }
}

Object? _readId(Map json, String key) {
  final store = json['store'] is Map ? json['store'] as Map : null;
  return (json['id'] ??
          json['storeId'] ??
          json['_id'] ??
          store?['id'] ??
          store?['_id'] ??
          '')
      .toString();
}

Object? _readName(Map json, String key) {
  final store = json['store'] is Map ? json['store'] as Map : null;
  return (json['name'] ?? store?['name'] ?? '').toString();
}

Object? _readSlug(Map json, String key) {
  final store = json['store'] is Map ? json['store'] as Map : null;
  return (json['slug'] ?? store?['slug'] ?? '').toString();
}

Object? _readLogoUrl(Map json, String key) {
  final store = json['store'] is Map ? json['store'] as Map : null;
  return json['logoUrl'] ??
      json['avatarUrl'] ??
      store?['logoUrl'] ??
      store?['avatarUrl'];
}

Object? _readCoverImageUrl(Map json, String key) {
  final store = json['coverImageUrl'] ?? json['coverUrl'];
  if (store != null) return store;
  final storeObj = json['store'] is Map ? json['store'] as Map : null;
  return storeObj?['coverImageUrl'] ?? storeObj?['coverUrl'];
}

Object? _readAddress(Map json, String key) {
  final store = json['store'] is Map ? json['store'] as Map : null;
  return (json['address'] ?? store?['address'] ?? '').toString();
}

Object? _readPhoneNumber(Map json, String key) {
  final store = json['store'] is Map ? json['store'] as Map : null;
  return json['phoneNumber'] ?? store?['phoneNumber'];
}

Object? _readRating(Map json, String key) {
  final store = json['store'] is Map ? json['store'] as Map : null;
  return json['averageRating'] ??
      json['rating'] ??
      store?['averageRating'] ??
      store?['rating'];
}

Object? _readIsFavorite(Map json, String key) {
  final store = json['store'] is Map ? json['store'] as Map : null;
  return json['isFavorite'] ?? store?['isFavorite'] ?? true;
}

Object? _readFavoritedAt(Map json, String key) {
  final store = json['store'] is Map ? json['store'] as Map : null;
  return json['favoritedAt'] ?? store?['favoritedAt'];
}

double? _ratingFromJson(dynamic val) {
  if (val == null) return null;
  if (val is num) return val.toDouble();
  return double.tryParse(val.toString());
}

@freezed
abstract class FavoriteListResponseModel with _$FavoriteListResponseModel {
  const FavoriteListResponseModel._();

  const factory FavoriteListResponseModel({
    @JsonKey(readValue: _readItems) @Default([]) List<FavoriteStoreModel> items,
    Map<String, dynamic>? pagination,
  }) = _FavoriteListResponseModel;

  factory FavoriteListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteListResponseModelFromJson(json);
}

Object? _readItems(Map json, String key) {
  final items = json['items'] ?? json['data'];
  if (items is Map) {
    return items['items'] ?? items['data'];
  }
  return items;
}
