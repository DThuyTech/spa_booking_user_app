// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FavoriteStoreModel _$FavoriteStoreModelFromJson(Map<String, dynamic> json) =>
    _FavoriteStoreModel(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      logoUrl: json['logoUrl'] as String?,
      coverImageUrl: json['coverImageUrl'] as String?,
      address: json['address'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String?,
      isFavorite: json['isFavorite'] as bool? ?? true,
      favoritedAt: json['favoritedAt'] as String?,
    );

Map<String, dynamic> _$FavoriteStoreModelToJson(_FavoriteStoreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'logoUrl': instance.logoUrl,
      'coverImageUrl': instance.coverImageUrl,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'isFavorite': instance.isFavorite,
      'favoritedAt': instance.favoritedAt,
    };

_FavoriteListResponseModel _$FavoriteListResponseModelFromJson(
  Map<String, dynamic> json,
) => _FavoriteListResponseModel(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => FavoriteStoreModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  pagination: json['pagination'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$FavoriteListResponseModelToJson(
  _FavoriteListResponseModel instance,
) => <String, dynamic>{
  'items': instance.items,
  'pagination': instance.pagination,
};
