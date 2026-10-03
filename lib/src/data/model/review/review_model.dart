import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/review/review_entity.dart';

part 'review_model.freezed.dart';

@freezed
abstract class ReviewModel with _$ReviewModel {
  const ReviewModel._();

  const factory ReviewModel({
    required String id,
    @JsonKey(name: 'customerName', defaultValue: 'Customer')
    required String customerName,
    @JsonKey(name: 'avatarUrl') String? avatarUrl,
    @JsonKey(name: 'rating', defaultValue: 5) required int rating,
    @JsonKey(name: 'comment', defaultValue: '') required String comment,
    @JsonKey(name: 'images', defaultValue: []) List<String>? images,
    @JsonKey(name: 'serviceNames', defaultValue: []) List<String>? serviceNames,
    @JsonKey(name: 'staffName') String? staffName,
    @JsonKey(name: 'createdAt') String? createdAt,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    final customer = json['customer'] as Map<String, dynamic>?;
    final user = json['user'] as Map<String, dynamic>?;
    final customerName =
        json['customerName'] ??
        customer?['name'] ??
        customer?['fullName'] ??
        user?['name'] ??
        user?['fullName'] ??
        'Customer';
    final avatarUrl =
        json['avatarUrl'] ??
        customer?['avatar'] ??
        customer?['avatarUrl'] ??
        user?['avatar'] ??
        user?['avatarUrl'];

    final rawImages = json['images'];
    List<String> parsedImages = [];
    if (rawImages is List) {
      parsedImages = rawImages.map((e) => e.toString()).toList();
    }

    final rawServiceNames = json['serviceNames'];
    List<String> parsedServiceNames = [];
    if (rawServiceNames is List) {
      parsedServiceNames = rawServiceNames.map((e) => e.toString()).toList();
    }

    final rawRating = json['rating'];
    final ratingVal = (rawRating is num)
        ? rawRating.toInt()
        : (int.tryParse(rawRating?.toString() ?? '') ?? 5);

    return ReviewModel(
      id: (json['id'] ?? json['_id'] ?? '').toString(),
      customerName: customerName.toString(),
      avatarUrl: avatarUrl?.toString(),
      rating: ratingVal,
      comment: (json['comment'] ?? '').toString(),
      images: parsedImages,
      serviceNames: parsedServiceNames,
      staffName: json['staffName'] as String?,
      createdAt: json['createdAt'] as String?,
    );
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      id: id,
      customerName: customerName,
      avatarUrl: avatarUrl,
      rating: rating,
      comment: comment,
      images: images ?? [],
      serviceNames: serviceNames ?? [],
      staffName: staffName,
      createdAt: createdAt != null
          ? DateTime.tryParse(createdAt!) ?? DateTime.now()
          : DateTime.now(),
    );
  }
}

@freezed
abstract class ReviewListResponseModel with _$ReviewListResponseModel {
  const ReviewListResponseModel._();

  const factory ReviewListResponseModel({
    required String storeId,
    @Default(5.0) double averageRating,
    @Default(0) int totalReviews,
    @JsonKey(name: 'ratingDistribution')
    Map<String, dynamic>? ratingDistribution,
    @Default([]) List<ReviewModel> items,
    Map<String, dynamic>? pagination,
  }) = _ReviewListResponseModel;

  factory ReviewListResponseModel.fromJson(Map<String, dynamic> json) {
    final rawItems = json['items'] ?? json['reviews'] ?? json['data'];
    List<ReviewModel> items = [];
    if (rawItems is List) {
      items = rawItems
          .whereType<Map<String, dynamic>>()
          .map(ReviewModel.fromJson)
          .toList();
    }

    final rawAvg = json['averageRating'];
    final avg = (rawAvg is num)
        ? rawAvg.toDouble()
        : (double.tryParse(rawAvg?.toString() ?? '') ?? 5.0);

    final rawTotal = json['totalReviews'] ?? json['total'];
    final total = (rawTotal is num)
        ? rawTotal.toInt()
        : (int.tryParse(rawTotal?.toString() ?? '') ?? items.length);

    Map<String, dynamic>? pagination =
        json['pagination'] as Map<String, dynamic>?;
    if (pagination == null &&
        (json['total'] != null || json['totalPages'] != null)) {
      pagination = {
        'total': total,
        'page': json['page'] ?? 1,
        'limit': json['limit'] ?? 10,
        'totalPages': json['totalPages'] ?? 1,
      };
    }

    return ReviewListResponseModel(
      storeId: (json['storeId'] ?? '').toString(),
      averageRating: avg,
      totalReviews: total,
      ratingDistribution: json['ratingDistribution'] as Map<String, dynamic>?,
      items: items,
      pagination: pagination,
    );
  }

  ReviewListEntity toEntity() {
    final Map<dynamic, dynamic> dist = ratingDistribution ?? const {};
    final distributionEntity = StoreRatingDistributionEntity(
      star5: (dist['5'] as num?)?.toInt() ?? (dist[5] as num?)?.toInt() ?? 0,
      star4: (dist['4'] as num?)?.toInt() ?? (dist[4] as num?)?.toInt() ?? 0,
      star3: (dist['3'] as num?)?.toInt() ?? (dist[3] as num?)?.toInt() ?? 0,
      star2: (dist['2'] as num?)?.toInt() ?? (dist[2] as num?)?.toInt() ?? 0,
      star1: (dist['1'] as num?)?.toInt() ?? (dist[1] as num?)?.toInt() ?? 0,
    );

    final pag = pagination ?? {};
    final page = (pag['page'] as num?)?.toInt() ?? 1;
    final totalPages = (pag['totalPages'] as num?)?.toInt() ?? 1;

    return ReviewListEntity(
      storeId: storeId,
      averageRating: averageRating,
      totalReviews: totalReviews,
      ratingDistribution: distributionEntity,
      items: items.map((m) => m.toEntity()).toList(),
      page: page,
      totalPages: totalPages,
    );
  }
}
