import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_entity.freezed.dart';

@freezed
abstract class ServiceEntity with _$ServiceEntity {
  const factory ServiceEntity({
    required String id,
    required String name,
    String? description,
    required int price,
    int? originalPrice,
    required int durationMinutes,
    String? imageUrl,
    String? categoryId,
  }) = _ServiceEntity;
}
