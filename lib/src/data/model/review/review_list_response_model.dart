import 'package:json_annotation/json_annotation.dart';
import 'package:spa_booking/src/data/model/review/review_model.dart';
import 'package:spa_booking/src/domain/entities/review/review_entity.dart';
part 'review_list_response_model.g.dart';

@JsonSerializable()
class ReviewListResponseModel {
  final String storeId;

  @JsonKey(defaultValue: 5.0)
  final double averageRating;

  @JsonKey(defaultValue: 0)
  final int totalReviews;

  final Map<String, dynamic>? ratingDistribution;

  @JsonKey(defaultValue: [])
  final List<ReviewModel> items;

  final Map<String, dynamic>? pagination;

  const ReviewListResponseModel({
    required this.storeId,
    this.averageRating = 5.0,
    this.totalReviews = 0,
    this.ratingDistribution,
    this.items = const [],
    this.pagination,
  });

  factory ReviewListResponseModel.fromJson(Map<String, dynamic> json) {
    final rawItems = json['items'] ?? json['reviews'] ?? json['data'];

    final items = rawItems is List
        ? rawItems
              .whereType<Map<String, dynamic>>()
              .map(ReviewModel.fromJson)
              .toList()
        : <ReviewModel>[];

    final rawAvg = json['averageRating'];

    final avg = rawAvg is num
        ? rawAvg.toDouble()
        : double.tryParse(rawAvg?.toString() ?? '') ?? 5.0;

    final rawTotal = json['totalReviews'] ?? json['total'];

    final total = rawTotal is num
        ? rawTotal.toInt()
        : int.tryParse(rawTotal?.toString() ?? '') ?? items.length;

    Map<String, dynamic>? pagination =
        json['pagination'] is Map<String, dynamic>
        ? json['pagination'] as Map<String, dynamic>
        : null;

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
      ratingDistribution: json['ratingDistribution'] is Map<String, dynamic>
          ? json['ratingDistribution'] as Map<String, dynamic>
          : null,
      items: items,
      pagination: pagination,
    );
  }

  Map<String, dynamic> toJson() => _$ReviewListResponseModelToJson(this);

  ReviewListEntity toEntity() {
    final dist = ratingDistribution ?? const {};

    final distributionEntity = StoreRatingDistributionEntity(
      star5: _toInt(dist['5']),
      star4: _toInt(dist['4']),
      star3: _toInt(dist['3']),
      star2: _toInt(dist['2']),
      star1: _toInt(dist['1']),
    );

    final pag = pagination ?? const {};

    final page = _toInt(pag['page'], fallback: 1);

    final totalPages = _toInt(pag['totalPages'], fallback: 1);

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

int _toInt(dynamic value, {int fallback = 0}) {
  if (value is num) {
    return value.toInt();
  }

  return int.tryParse(value?.toString() ?? '') ?? fallback;
}
