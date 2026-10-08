import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_review_entity.freezed.dart';

@freezed
abstract class UserReviewStoreEntity with _$UserReviewStoreEntity {
  const factory UserReviewStoreEntity({
    required String id,
    required String name,
    String? address,
    String? logoUrl,
    String? coverImageUrl,
  }) = _UserReviewStoreEntity;
}

@freezed
abstract class UserReviewEntity with _$UserReviewEntity {
  const factory UserReviewEntity({
    required String id,
    required String storeId,
    UserReviewStoreEntity? store,
    String? bookingId,
    required int rating,
    required String comment,
    @Default([]) List<String> images,
    @Default([]) List<String> serviceNames,
    String? staffName,
    String? merchantReply,
    DateTime? merchantRepliedAt,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _UserReviewEntity;
}

@freezed
abstract class UserReviewListEntity with _$UserReviewListEntity {
  const factory UserReviewListEntity({
    @Default([]) List<UserReviewEntity> items,
    @Default(0) int total,
    @Default(1) int page,
    @Default(10) int limit,
    @Default(1) int totalPages,
  }) = _UserReviewListEntity;
}
