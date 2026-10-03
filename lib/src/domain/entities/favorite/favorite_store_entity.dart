import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_store_entity.freezed.dart';

@freezed
abstract class FavoriteStoreEntity with _$FavoriteStoreEntity {
  const factory FavoriteStoreEntity({
    required String id,
    required String name,
    required String slug,
    String? logoUrl,
    String? coverImageUrl,
    required String address,
    String? phoneNumber,
    @Default(true) bool isFavorite,
    DateTime? favoritedAt,
  }) = _FavoriteStoreEntity;
}
