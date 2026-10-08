import 'package:json_annotation/json_annotation.dart';
import 'package:spa_booking/src/data/model/store/business_hours_summary_model.dart';
import 'package:spa_booking/src/data/model/store/service_category_model.dart';
import 'package:spa_booking/src/data/model/store/service_model.dart';
import 'package:spa_booking/src/data/model/store/staff_model.dart';
import 'package:spa_booking/src/data/model/store/store_booking_settings_model.dart';
import 'package:spa_booking/src/data/model/store/store_reviews_overview_model.dart';
import 'package:spa_booking/src/domain/entities/store/store_full_detail_entity.dart';

part 'store_full_detail_model.g.dart';

@JsonSerializable()
class StoreFullDetailModel {
  final String id;
  final String name;
  final String slug;
  final String? description;
  final String address;
  final String phoneNumber;
  final String? logoUrl;
  final String? coverImageUrl;
  final double? latitude;
  final double? longitude;
  final String? district;
  final String? city;
  final double averageRating;
  final double minPrice;

  @JsonKey(defaultValue: [])
  final List<String> images;

  final BusinessHoursSummaryModel? businessHours;

  final StoreBookingSettingsModel? bookingSettings;

  @JsonKey(defaultValue: [])
  final List<ServiceCategoryModel> categories;

  @JsonKey(defaultValue: [])
  final List<ServiceModel> services;

  @JsonKey(defaultValue: [])
  final List<StaffModel> staff;

  final StoreReviewsOverviewModel? reviewSummary;
  final bool isFavorite;

  const StoreFullDetailModel({
    required this.id,
    required this.name,
    required this.slug,
    this.description,
    required this.address,
    required this.phoneNumber,
    this.logoUrl,
    this.coverImageUrl,
    this.latitude,
    this.longitude,
    this.district,
    this.city,
    this.images = const [],
    this.businessHours,
    this.bookingSettings,
    this.categories = const [],
    this.services = const [],
    this.staff = const [],
    this.reviewSummary,
    this.isFavorite = false,
    this.averageRating = 0,
    this.minPrice = 0,
  });

  factory StoreFullDetailModel.fromJson(Map<String, dynamic> json) {
    final storeMap = json['store'] as Map<String, dynamic>?;
    final reviewsMap = json['reviews'] as Map<String, dynamic>?;

    final isFav = (json['isFavorite'] ?? storeMap?['isFavorite']) == true;

    final merged = <String, dynamic>{
      ...?storeMap,
      ...json,
      'isFavorite': isFav,
      if (reviewsMap != null && json['reviewSummary'] == null)
        'reviewSummary': reviewsMap,
      if (reviewsMap != null && json['averageRating'] == null)
        'averageRating': reviewsMap['averageRating'] ?? 0,
    };

    return _$StoreFullDetailModelFromJson(merged);
  }

  Map<String, dynamic> toJson() => _$StoreFullDetailModelToJson(this);

  StoreFullDetailEntity toEntity() {
    return StoreFullDetailEntity(
      id: id,
      name: name,
      slug: slug,
      description: description,
      address: address,
      phoneNumber: phoneNumber,
      logoUrl: logoUrl,
      coverImageUrl: coverImageUrl,
      latitude: latitude,
      longitude: longitude,
      district: district,
      city: city,
      images: images,
      businessHours: businessHours?.toEntity(),
      bookingSettings: bookingSettings?.toEntity(),
      categories: categories.map((e) => e.toEntity()).toList(),
      services: services.map((e) => e.toEntity()).toList(),
      staff: staff.map((e) => e.toEntity()).toList(),
      reviewSummary: reviewSummary?.toEntity(),
      isFavorite: isFavorite,
      averageRating: averageRating,
      minPrice: minPrice,
    );
  }
}
