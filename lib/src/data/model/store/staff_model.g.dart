// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StaffModel _$StaffModelFromJson(Map<String, dynamic> json) => _StaffModel(
  staffProfileId: json['staffProfileId'] as String,
  fullName: json['fullName'] as String,
  role: json['role'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
  bio: json['bio'] as String?,
  rating: (json['rating'] as num?)?.toDouble() ?? 5.0,
);

Map<String, dynamic> _$StaffModelToJson(_StaffModel instance) =>
    <String, dynamic>{
      'staffProfileId': instance.staffProfileId,
      'fullName': instance.fullName,
      'role': instance.role,
      'avatarUrl': instance.avatarUrl,
      'bio': instance.bio,
      'rating': instance.rating,
    };
