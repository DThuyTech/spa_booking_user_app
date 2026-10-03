// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_gallery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreGalleryItemModel _$StoreGalleryItemModelFromJson(
  Map<String, dynamic> json,
) => _StoreGalleryItemModel(
  url: json['url'] as String,
  thumbnailUrl: json['thumbnailUrl'] as String?,
  category: json['category'] as String? ?? 'INTERIOR',
  caption: json['caption'] as String?,
);

Map<String, dynamic> _$StoreGalleryItemModelToJson(
  _StoreGalleryItemModel instance,
) => <String, dynamic>{
  'url': instance.url,
  'thumbnailUrl': instance.thumbnailUrl,
  'category': instance.category,
  'caption': instance.caption,
};

_StoreGalleryResponseModel _$StoreGalleryResponseModelFromJson(
  Map<String, dynamic> json,
) => _StoreGalleryResponseModel(
  storeId: json['storeId'] as String,
  categoryCounts: json['categoryCounts'] as Map<String, dynamic>?,
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => StoreGalleryItemModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$StoreGalleryResponseModelToJson(
  _StoreGalleryResponseModel instance,
) => <String, dynamic>{
  'storeId': instance.storeId,
  'categoryCounts': instance.categoryCounts,
  'items': instance.items,
};
