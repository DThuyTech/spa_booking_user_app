// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreDetailModel _$StoreDetailModelFromJson(Map<String, dynamic> json) =>
    StoreDetailModel(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String?,
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String,
      logoUrl: json['logoUrl'] as String?,
      coverUrl: json['coverUrl'] as String?,
      images:
          (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      businessHours:
          (json['businessHours'] as List<dynamic>?)
              ?.map(
                (e) =>
                    StoreBusinessHourModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
      bookingSettings: json['bookingSettings'] == null
          ? null
          : StoreBookingSettingsModel.fromJson(
              json['bookingSettings'] as Map<String, dynamic>,
            ),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      district: json['district'] as String?,
      city: json['city'] as String?,
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$StoreDetailModelToJson(StoreDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'logoUrl': instance.logoUrl,
      'coverUrl': instance.coverUrl,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'district': instance.district,
      'city': instance.city,
      'images': instance.images,
      'businessHours': instance.businessHours,
      'bookingSettings': instance.bookingSettings,
      'isFavorite': instance.isFavorite,
    };
