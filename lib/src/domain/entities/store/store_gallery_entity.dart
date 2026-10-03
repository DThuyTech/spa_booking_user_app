import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_gallery_entity.freezed.dart';

@freezed
abstract class StoreGalleryItemEntity with _$StoreGalleryItemEntity {
  const factory StoreGalleryItemEntity({
    required String url,
    String? thumbnailUrl,
    @Default('INTERIOR') String category,
    String? caption,
  }) = _StoreGalleryItemEntity;
}

@freezed
abstract class StoreGalleryEntity with _$StoreGalleryEntity {
  const factory StoreGalleryEntity({
    required String storeId,
    @Default({}) Map<String, int> categoryCounts,
    @Default([]) List<StoreGalleryItemEntity> items,
  }) = _StoreGalleryEntity;
}
