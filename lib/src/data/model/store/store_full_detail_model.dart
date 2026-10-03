import 'package:equatable/equatable.dart';
import 'package:spa_booking/src/data/model/store/service_category_model.dart';
import 'package:spa_booking/src/data/model/store/service_model.dart';
import 'package:spa_booking/src/data/model/store/staff_model.dart';
import 'package:spa_booking/src/data/model/store/store_detail_model.dart';

class StoreReviewsOverviewModel extends Equatable {
  final double averageRating;
  final int totalReviews;
  final Map<String, int> ratingDistribution;

  const StoreReviewsOverviewModel({
    this.averageRating = 5.0,
    this.totalReviews = 0,
    this.ratingDistribution = const {},
  });

  factory StoreReviewsOverviewModel.fromJson(Map<String, dynamic> json) {
    final rawDist = json['ratingDistribution'] as Map<String, dynamic>? ?? {};
    final dist = <String, int>{};
    rawDist.forEach((key, value) {
      if (value is num) {
        dist[key] = value.toInt();
      } else {
        dist[key] = int.tryParse(value.toString()) ?? 0;
      }
    });

    final rawAvg = json['averageRating'];
    final avg = (rawAvg is num)
        ? rawAvg.toDouble()
        : (double.tryParse(rawAvg?.toString() ?? '') ?? 5.0);

    final rawTotal = json['totalReviews'];
    final total = (rawTotal is num)
        ? rawTotal.toInt()
        : (int.tryParse(rawTotal?.toString() ?? '') ?? 0);

    return StoreReviewsOverviewModel(
      averageRating: avg,
      totalReviews: total,
      ratingDistribution: dist,
    );
  }

  @override
  List<Object?> get props => [averageRating, totalReviews, ratingDistribution];
}

class StoreFullDetailModel extends Equatable {
  final StoreDetailModel store;
  final List<StoreBusinessHourModel> businessHours;
  final StoreBookingSettingsModel? bookingSettings;
  final List<ServiceCategoryModel> categories;
  final List<ServiceModel> services;
  final List<StaffModel> staff;
  final StoreReviewsOverviewModel? reviews;
  final bool isFavorite;

  const StoreFullDetailModel({
    required this.store,
    this.businessHours = const [],
    this.bookingSettings,
    this.categories = const [],
    this.services = const [],
    this.staff = const [],
    this.reviews,
    this.isFavorite = false,
  });

  factory StoreFullDetailModel.fromJson(Map<String, dynamic> json) {
    final storeDetail = StoreDetailModel.fromJson(json);

    final rawHours = json['businessHours'] ??
        (json['store'] is Map<String, dynamic>
            ? (json['store'] as Map<String, dynamic>)['businessHours']
            : null);
    List<StoreBusinessHourModel> parsedHours = [];
    if (rawHours is List) {
      parsedHours = rawHours
          .whereType<Map<String, dynamic>>()
          .map(StoreBusinessHourModel.fromJson)
          .toList();
    }

    final rawSettings = json['bookingSettings'] ??
        (json['store'] is Map<String, dynamic>
            ? (json['store'] as Map<String, dynamic>)['bookingSettings']
            : null);
    StoreBookingSettingsModel? parsedSettings;
    if (rawSettings is Map<String, dynamic>) {
      parsedSettings = StoreBookingSettingsModel.fromJson(rawSettings);
    }

    final rawCategories = json['categories'];
    List<ServiceCategoryModel> parsedCategories = [];
    if (rawCategories is List) {
      parsedCategories = rawCategories
          .whereType<Map<String, dynamic>>()
          .map(ServiceCategoryModel.fromJson)
          .toList();
    }

    final rawServices = json['services'];
    List<ServiceModel> parsedServices = [];
    if (rawServices is List) {
      parsedServices = rawServices
          .whereType<Map<String, dynamic>>()
          .map(ServiceModel.fromJson)
          .toList();
    }

    final rawStaff = json['staff'];
    List<StaffModel> parsedStaff = [];
    if (rawStaff is List) {
      parsedStaff = rawStaff
          .whereType<Map<String, dynamic>>()
          .map(StaffModel.fromJson)
          .toList();
    }

    final rawReviews = json['reviews'];
    StoreReviewsOverviewModel? parsedReviews;
    if (rawReviews is Map<String, dynamic>) {
      parsedReviews = StoreReviewsOverviewModel.fromJson(rawReviews);
    }

    final isFav = json['isFavorite'] as bool? ?? false;

    return StoreFullDetailModel(
      store: storeDetail,
      businessHours: parsedHours.isNotEmpty ? parsedHours : storeDetail.businessHours,
      bookingSettings: parsedSettings ?? storeDetail.bookingSettings,
      categories: parsedCategories,
      services: parsedServices,
      staff: parsedStaff,
      reviews: parsedReviews,
      isFavorite: isFav,
    );
  }

  @override
  List<Object?> get props => [
        store,
        businessHours,
        bookingSettings,
        categories,
        services,
        staff,
        reviews,
        isFavorite,
      ];
}
