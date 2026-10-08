import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/store/store_detail_entity.dart';
import 'store_booking_settings_model.dart';
import 'store_business_hour_model.dart';

part 'store_detail_model.g.dart';

@JsonSerializable()
class StoreDetailModel {
  final String id;
  final String name;
  final String slug;
  final String? description;
  final String address;
  final String phoneNumber;
  final String? logoUrl;
  final String? coverUrl;
  final double? latitude;
  final double? longitude;
  final String? district;
  final String? city;

  @JsonKey(defaultValue: [])
  final List<String> images;

  @JsonKey(defaultValue: [])
  final List<StoreBusinessHourModel> businessHours;

  final StoreBookingSettingsModel? bookingSettings;

  @JsonKey(defaultValue: false)
  final bool isFavorite;

  const StoreDetailModel({
    required this.id,
    required this.name,
    required this.slug,
    this.description,
    required this.address,
    required this.phoneNumber,
    this.logoUrl,
    this.coverUrl,
    this.images = const [],
    this.businessHours = const [],
    this.bookingSettings,
    this.latitude,
    this.longitude,
    this.district,
    this.city,
    this.isFavorite = false,
  });

  factory StoreDetailModel.fromJson(Map<String, dynamic> json) =>
      _$StoreDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreDetailModelToJson(this);

  StoreDetailEntity toEntity() {
    return StoreDetailEntity(
      id: id,
      name: name,
      slug: slug,
      description: description,
      address: address,
      phoneNumber: phoneNumber,
      logoUrl: logoUrl,
      coverUrl: coverUrl,
      images: images,
      businessHours: businessHours.map((e) => e.toEntity()).toList(),
      bookingSettings: bookingSettings?.toEntity(),
      latitude: latitude,
      longitude: longitude,
      district: district,
      city: city,
      isFavorite: isFavorite,
    );
  }
}
