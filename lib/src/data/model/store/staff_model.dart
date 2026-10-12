import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/store/staff_entity.dart';

part 'staff_model.freezed.dart';

@freezed
abstract class StaffModel with _$StaffModel {
  const StaffModel._();

  const factory StaffModel({
    required String staffProfileId,
    required String fullName,
    String? role,
    String? avatarUrl,
    String? bio,
    @Default(5.0) double rating,
    @Default([]) List<String> capableServiceIds,
  }) = _StaffModel;

  factory StaffModel.fromJson(Map<String, dynamic> json) {
    String nameStr = '';
    if (json['fullName'] != null &&
        json['fullName'].toString().trim().isNotEmpty) {
      nameStr = json['fullName'].toString().trim();
    } else if (json['name'] != null &&
        json['name'].toString().trim().isNotEmpty) {
      nameStr = json['name'].toString().trim();
    } else {
      final first = (json['firstName'] ?? '').toString().trim();
      final last = (json['lastName'] ?? '').toString().trim();
      if (last.isNotEmpty && first.isNotEmpty) {
        if (RegExp(r'^\d+$').hasMatch(last)) {
          nameStr = '$first $last';
        } else {
          nameStr = '$last $first';
        }
      } else {
        nameStr = last.isNotEmpty ? last : first;
      }
    }
    if (nameStr.isEmpty) nameStr = 'Nhân viên';

    final capableIds =
        (json['capableServiceIds'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
        const <String>[];

    return StaffModel(
      staffProfileId: (json['staffProfileId'] ?? json['id'] ?? '') as String,
      fullName: nameStr,
      role: (json['role'] ?? json['title']) as String?,
      avatarUrl: json['avatarUrl'] as String?,
      bio: json['bio'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 5.0,
      capableServiceIds: capableIds,
    );
  }

  Map<String, dynamic> toJson() => {
    'staffProfileId': staffProfileId,
    'fullName': fullName,
    'role': role,
    'avatarUrl': avatarUrl,
    'bio': bio,
    'rating': rating,
    'capableServiceIds': capableServiceIds,
  };
}

extension StaffModelX on StaffModel {
  StaffEntity toEntity() => StaffEntity(
    staffProfileId: staffProfileId,
    fullName: fullName,
    role: role,
    avatarUrl: avatarUrl,
    bio: bio,
    rating: rating,
    capableServiceIds: capableServiceIds,
  );
}
