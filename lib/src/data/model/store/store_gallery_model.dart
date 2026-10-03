import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/store/store_gallery_entity.dart';

part 'store_gallery_model.freezed.dart';
part 'store_gallery_model.g.dart';

@freezed
abstract class StoreGalleryItemModel with _$StoreGalleryItemModel {
  const StoreGalleryItemModel._();

  const factory StoreGalleryItemModel({
    required String url,
    @JsonKey(name: 'thumbnailUrl') String? thumbnailUrl,
    @JsonKey(name: 'category', defaultValue: 'INTERIOR') required String category,
    @JsonKey(name: 'caption') String? caption,
  }) = _StoreGalleryItemModel;

  factory StoreGalleryItemModel.fromJson(Map<String, dynamic> json) =>
      _$StoreGalleryItemModelFromJson(json);

  StoreGalleryItemEntity toEntity() {
    return StoreGalleryItemEntity(
      url: url,
      thumbnailUrl: thumbnailUrl ?? url,
      category: category,
      caption: caption,
    );
  }
}

@freezed
abstract class StoreGalleryResponseModel with _$StoreGalleryResponseModel {
  const StoreGalleryResponseModel._();

  const factory StoreGalleryResponseModel({
    required String storeId,
    @JsonKey(name: 'categoryCounts') Map<String, dynamic>? categoryCounts,
    @Default([]) List<StoreGalleryItemModel> items,
  }) = _StoreGalleryResponseModel;

  factory StoreGalleryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StoreGalleryResponseModelFromJson(json);

  StoreGalleryEntity toEntity() {
    final counts = <String, int>{};
    categoryCounts?.forEach((key, value) {
      if (value is num) counts[key] = value.toInt();
    });

    return StoreGalleryEntity(
      storeId: storeId,
      categoryCounts: counts,
      items: items.map((m) => m.toEntity()).toList(),
    );
  }
}
