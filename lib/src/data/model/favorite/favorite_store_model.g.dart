// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FavoriteStoreModel _$FavoriteStoreModelFromJson(Map<String, dynamic> json) =>
    _FavoriteStoreModel(
      id: _readId(json, 'id') as String,
      name: _readName(json, 'name') as String? ?? '',
      slug: _readSlug(json, 'slug') as String? ?? '',
      logoUrl: _readLogoUrl(json, 'logoUrl') as String?,
      coverImageUrl: _readCoverImageUrl(json, 'coverImageUrl') as String?,
      address: _readAddress(json, 'address') as String? ?? '',
      phoneNumber: _readPhoneNumber(json, 'phoneNumber') as String?,
      averageRating: _ratingFromJson(_readRating(json, 'averageRating')),
      isFavorite: _readIsFavorite(json, 'isFavorite') as bool? ?? true,
      favoritedAt: _readFavoritedAt(json, 'favoritedAt') as String?,
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
      'averageRating': instance.averageRating,
      'isFavorite': instance.isFavorite,
      'favoritedAt': instance.favoritedAt,
    };

_FavoriteListResponseModel _$FavoriteListResponseModelFromJson(
  Map<String, dynamic> json,
) => _FavoriteListResponseModel(
  items:
      (_readItems(json, 'items') as List<dynamic>?)
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
