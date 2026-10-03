import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/store/service_entity.dart';

part 'service_model.freezed.dart';

@freezed
abstract class ServiceModel with _$ServiceModel {
  const factory ServiceModel({
    required String id,
    required String name,
    String? description,
    required int price,
    int? originalPrice,
    required int durationMinutes,
    String? imageUrl,
    String? categoryId,
  }) = _ServiceModel;

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    final rawPrice =
        json['effectivePrice'] ?? json['price'] ?? json['basePrice'] ?? 0;
    final priceVal = (rawPrice is num)
        ? rawPrice.toInt()
        : (int.tryParse(rawPrice.toString()) ?? 0);

    final rawOrigPrice =
        (json['effectivePrice'] != null && json['basePrice'] != null)
        ? json['basePrice']
        : json['originalPrice'];
    final origPriceVal = (rawOrigPrice is num)
        ? rawOrigPrice.toInt()
        : (rawOrigPrice != null ? int.tryParse(rawOrigPrice.toString()) : null);

    final rawDuration = json['durationMinutes'] ?? 30;
    final durationVal = (rawDuration is num)
        ? rawDuration.toInt()
        : (int.tryParse(rawDuration.toString()) ?? 30);

    return ServiceModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String?,
      price: priceVal,
      originalPrice: origPriceVal,
      durationMinutes: durationVal,
      imageUrl: (json['imageUrl'] ?? json['coverImageUrl']) as String?,
      categoryId: json['categoryId'] as String?,
    );
  }
}

extension ServiceModelX on ServiceModel {
  ServiceEntity toEntity() => ServiceEntity(
    id: id,
    name: name,
    description: description,
    price: price,
    originalPrice: originalPrice,
    durationMinutes: durationMinutes,
    imageUrl: imageUrl,
    categoryId: categoryId,
  );
}
