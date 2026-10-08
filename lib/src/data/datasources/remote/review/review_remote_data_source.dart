import 'package:spa_booking/src/core/network/network_client.dart';
import 'package:spa_booking/src/data/model/review/review_list_response_model.dart';
import 'package:spa_booking/src/data/model/review/review_model.dart';

import '../../../model/review/user_review_model.dart';

abstract interface class ReviewRemoteDataSource {
  Future<ReviewListResponseModel> getStoreReviews({
    required String storeId,
    int page = 1,
    int limit = 10,
    int? rating,
  });

  Future<ReviewModel> createReview({
    required String storeId,
    required String bookingId,
    required int rating,
    required String comment,
    List<String> images = const [],
  });

  Future<ReviewModel> createBookingReview({
    required String bookingId,
    required int rating,
    required String comment,
    List<String> images = const [],
  });

  Future<UserReviewListResponseModel> getMyReviews({
    int page = 1,
    int limit = 10,
  });

  Future<UserReviewModel> getMyReviewDetail(String reviewId);

  Future<UserReviewModel> updateMyReview({
    required String reviewId,
    int? rating,
    String? comment,
    List<String>? images,
  });

  Future<bool> deleteMyReview(String reviewId);
}

class ReviewRemoteDataSourceImpl implements ReviewRemoteDataSource {
  final NetworkClient _client;

  const ReviewRemoteDataSourceImpl(this._client);

  @override
  Future<ReviewListResponseModel> getStoreReviews({
    required String storeId,
    int page = 1,
    int limit = 10,
    int? rating,
  }) async {
    final queryParams = <String, dynamic>{'page': page, 'limit': limit};
    if (rating != null) {
      queryParams['rating'] = rating;
    }

    final response = await _client.get<dynamic>(
      '/public/stores/$storeId/reviews',
      queryParameters: queryParams,
    );

    final rawData = response.data;
    if (rawData != null) {
      if (rawData is List) {
        final items = rawData
            .whereType<Map<String, dynamic>>()
            .map((e) => ReviewModel.fromJson(e))
            .toList();
        return ReviewListResponseModel(
          storeId: storeId,
          totalReviews: items.length,
          averageRating: items.isNotEmpty
              ? items.map((e) => e.rating).reduce((a, b) => a + b) /
                    items.length
              : 5.0,
          items: items,
        );
      }

      if (rawData is Map<String, dynamic>) {
        final payload = rawData['data'];
        if (payload is List) {
          final items = payload
              .whereType<Map<String, dynamic>>()
              .map((e) => ReviewModel.fromJson(e))
              .toList();
          return ReviewListResponseModel(
            storeId: storeId,
            totalReviews: items.length,
            averageRating: items.isNotEmpty
                ? items.map((e) => e.rating).reduce((a, b) => a + b) /
                      items.length
                : 5.0,
            items: items,
          );
        }

        final map = (payload is Map<String, dynamic>) ? payload : rawData;
        final mutableMap = Map<String, dynamic>.from(map);
        mutableMap.putIfAbsent('storeId', () => storeId);
        return ReviewListResponseModel.fromJson(mutableMap);
      }
    }
    return ReviewListResponseModel(storeId: storeId);
  }

  @override
  Future<ReviewModel> createReview({
    required String storeId,
    required String bookingId,
    required int rating,
    required String comment,
    List<String> images = const [],
  }) async {
    final response = await _client.post<Map<String, dynamic>>(
      '/customer/stores/$storeId/reviews',
      data: {
        'bookingId': bookingId,
        'rating': rating,
        'comment': comment,
        'images': images,
      },
    );

    final data = response.data;
    if (data != null) {
      final payload = (data['data'] as Map<String, dynamic>?) ?? data;
      return ReviewModel.fromJson(payload);
    }
    throw const FormatException('Empty response received for create review');
  }

  @override
  Future<ReviewModel> createBookingReview({
    required String bookingId,
    required int rating,
    required String comment,
    List<String> images = const [],
  }) async {
    final response = await _client.post<Map<String, dynamic>>(
      '/customer/bookings/$bookingId/reviews',
      data: {'rating': rating, 'comment': comment, 'images': images},
    );

    final data = response.data;
    if (data != null) {
      final payload = (data['data'] as Map<String, dynamic>?) ?? data;
      return ReviewModel.fromJson(payload);
    }
    throw const FormatException(
      'Empty response received for create booking review',
    );
  }

  @override
  Future<UserReviewListResponseModel> getMyReviews({
    int page = 1,
    int limit = 10,
  }) async {
    final response = await _client.get<dynamic>(
      '/customer/reviews',
      queryParameters: {'page': page, 'limit': limit},
    );
    final rawData = response.data;
    if (rawData is Map<String, dynamic>) {
      return UserReviewListResponseModel.fromJson(rawData);
    }
    return const UserReviewListResponseModel();
  }

  @override
  Future<UserReviewModel> getMyReviewDetail(String reviewId) async {
    final response = await _client.get<dynamic>('/customer/reviews/$reviewId');
    final rawData = response.data;
    if (rawData is Map<String, dynamic>) {
      final payload = (rawData['data'] as Map<String, dynamic>?) ?? rawData;
      return UserReviewModel.fromJson(payload);
    }
    throw const FormatException('Empty response received for review detail');
  }

  @override
  Future<UserReviewModel> updateMyReview({
    required String reviewId,
    int? rating,
    String? comment,
    List<String>? images,
  }) async {
    final body = <String, dynamic>{};
    if (rating != null) body['rating'] = rating;
    if (comment != null) body['comment'] = comment;
    if (images != null) body['images'] = images;

    final response = await _client.patch<dynamic>(
      '/customer/reviews/$reviewId',
      data: body,
    );
    final rawData = response.data;
    if (rawData is Map<String, dynamic>) {
      final payload = (rawData['data'] as Map<String, dynamic>?) ?? rawData;
      return UserReviewModel.fromJson(payload);
    }
    throw const FormatException('Empty response received for update review');
  }

  @override
  Future<bool> deleteMyReview(String reviewId) async {
    final response = await _client.delete<dynamic>(
      '/customer/reviews/$reviewId',
    );
    final rawData = response.data;
    if (rawData is Map<String, dynamic>) {
      final data = rawData['data'];
      if (data is Map<String, dynamic> && data['success'] != null) {
        return data['success'] == true;
      }
    }
    return true;
  }
}
