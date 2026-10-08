import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spa_booking/src/domain/entities/store/business_hours_summary_entity.dart';
import 'package:spa_booking/src/domain/entities/store/store_booking_settings_entity.dart';
import 'package:spa_booking/src/domain/entities/store/store_reviews_overview_entity.dart';

import 'service_category_entity.dart';
import 'service_entity.dart';
import 'staff_entity.dart';

part 'store_full_detail_entity.freezed.dart';

@freezed
abstract class StoreFullDetailEntity with _$StoreFullDetailEntity {
  const factory StoreFullDetailEntity({
    required String id,
    required String name,
    required String slug,
    String? description,
    required String address,
    required String phoneNumber,
    String? logoUrl,
    String? coverImageUrl,
    @Default([]) List<String> images,
    BusinessHoursSummaryEntity? businessHours,
    StoreBookingSettingsEntity? bookingSettings,
    double? latitude,
    double? longitude,
    String? district,
    String? city,
    @Default([]) List<ServiceCategoryEntity> categories,
    @Default([]) List<ServiceEntity> services,
    @Default([]) List<StaffEntity> staff,
    StoreReviewsOverviewEntity? reviewSummary,
    @Default(false) bool isFavorite,
    @Default(0) double averageRating,
    @Default(0) double minPrice,
  }) = _StoreFullDetailEntity;
}
