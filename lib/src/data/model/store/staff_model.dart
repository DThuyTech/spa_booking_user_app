import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/store/staff_entity.dart';

part 'staff_model.freezed.dart';
part 'staff_model.g.dart';

@freezed
abstract class StaffModel with _$StaffModel {
  const factory StaffModel({
    required String staffProfileId,
    required String fullName,
    String? role,
    String? avatarUrl,
    String? bio,
    @Default(5.0) double rating,
  }) = _StaffModel;

  factory StaffModel.fromJson(Map<String, dynamic> json) => StaffModel(
        staffProfileId: (json['staffProfileId'] ?? json['id'] ?? '') as String,
        fullName: (json['fullName'] ?? json['name'] ?? '') as String,
        role: (json['role'] ?? json['title']) as String?,
        avatarUrl: json['avatarUrl'] as String?,
        bio: json['bio'] as String?,
        rating: (json['rating'] as num?)?.toDouble() ?? 5.0,
      );
}

extension StaffModelX on StaffModel {
  StaffEntity toEntity() => StaffEntity(
        staffProfileId: staffProfileId,
        fullName: fullName,
        role: role,
        avatarUrl: avatarUrl,
        bio: bio,
        rating: rating,
      );
}
