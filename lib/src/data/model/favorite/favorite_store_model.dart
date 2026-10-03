import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/favorite/favorite_store_entity.dart';

part 'favorite_store_model.freezed.dart';
part 'favorite_store_model.g.dart';

@freezed
abstract class FavoriteStoreModel with _$FavoriteStoreModel {
  const FavoriteStoreModel._();

  const factory FavoriteStoreModel({
    required String id,
    @JsonKey(name: 'name', defaultValue: '') required String name,
    @JsonKey(name: 'slug', defaultValue: '') required String slug,
    @JsonKey(name: 'logoUrl') String? logoUrl,
    @JsonKey(name: 'coverImageUrl') String? coverImageUrl,
    @JsonKey(name: 'address', defaultValue: '') required String address,
    @JsonKey(name: 'phoneNumber') String? phoneNumber,
    @JsonKey(name: 'isFavorite', defaultValue: true) required bool isFavorite,
    @JsonKey(name: 'favoritedAt') String? favoritedAt,
  }) = _FavoriteStoreModel;

  factory FavoriteStoreModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteStoreModelFromJson(json);

  FavoriteStoreEntity toEntity() {
    return FavoriteStoreEntity(
      id: id,
      name: name,
      slug: slug,
      logoUrl: logoUrl,
      coverImageUrl: coverImageUrl,
      address: address,
      phoneNumber: phoneNumber,
      isFavorite: isFavorite,
      favoritedAt: favoritedAt != null
          ? DateTime.tryParse(favoritedAt!)
          : null,
    );
  }
}

@freezed
abstract class FavoriteListResponseModel with _$FavoriteListResponseModel {
  const FavoriteListResponseModel._();

  const factory FavoriteListResponseModel({
    @Default([]) List<FavoriteStoreModel> items,
    Map<String, dynamic>? pagination,
  }) = _FavoriteListResponseModel;

  factory FavoriteListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteListResponseModelFromJson(json);
}
