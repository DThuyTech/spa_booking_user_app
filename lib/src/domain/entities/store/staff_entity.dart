import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_entity.freezed.dart';

@freezed
abstract class StaffEntity with _$StaffEntity {
  const factory StaffEntity({
    required String staffProfileId,
    required String fullName,
    String? role,
    String? avatarUrl,
    String? bio,
    @Default(5.0) double rating,
  }) = _StaffEntity;
}
