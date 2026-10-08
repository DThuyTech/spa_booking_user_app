// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_full_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreFullDetailModel _$StoreFullDetailModelFromJson(
  Map<String, dynamic> json,
) => StoreFullDetailModel(
  id: json['id'] as String,
  name: json['name'] as String,
  slug: json['slug'] as String,
  description: json['description'] as String?,
  address: json['address'] as String,
  phoneNumber: json['phoneNumber'] as String,
  logoUrl: json['logoUrl'] as String?,
  coverImageUrl: json['coverImageUrl'] as String?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  district: json['district'] as String?,
  city: json['city'] as String?,
  images:
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
  businessHours: json['businessHours'] == null
      ? null
      : BusinessHoursSummaryModel.fromJson(
          json['businessHours'] as Map<String, dynamic>,
        ),
  bookingSettings: json['bookingSettings'] == null
      ? null
      : StoreBookingSettingsModel.fromJson(
          json['bookingSettings'] as Map<String, dynamic>,
        ),
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => ServiceCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  services:
      (json['services'] as List<dynamic>?)
          ?.map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  staff:
      (json['staff'] as List<dynamic>?)
          ?.map((e) => StaffModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  reviewSummary: json['reviewSummary'] == null
      ? null
      : StoreReviewsOverviewModel.fromJson(
          json['reviewSummary'] as Map<String, dynamic>,
        ),
  isFavorite: json['isFavorite'] as bool? ?? false,
  averageRating: (json['averageRating'] as num?)?.toDouble() ?? 0,
  minPrice: (json['minPrice'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$StoreFullDetailModelToJson(
  StoreFullDetailModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'description': instance.description,
  'address': instance.address,
  'phoneNumber': instance.phoneNumber,
  'logoUrl': instance.logoUrl,
  'coverImageUrl': instance.coverImageUrl,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'district': instance.district,
  'city': instance.city,
  'averageRating': instance.averageRating,
  'minPrice': instance.minPrice,
  'images': instance.images,
  'businessHours': instance.businessHours,
  'bookingSettings': instance.bookingSettings,
  'categories': instance.categories,
  'services': instance.services,
  'staff': instance.staff,
  'reviewSummary': instance.reviewSummary,
  'isFavorite': instance.isFavorite,
};
