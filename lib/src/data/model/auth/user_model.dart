import 'package:spa_booking/src/domain/entities/auth/user_role_enum.dart';
import 'package:spa_booking/src/domain/entities/auth/user_status_enum.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String phone;
  final UserRoleEnum role;
  final String fullName;
  final String? avatar;
  final UserStatusEnum status;
  final String? dateOfBirth;

  const UserModel({
    required this.id,
    this.email = '',
    this.phone = '',
    this.role = UserRoleEnum.customer,
    this.fullName = '',
    this.avatar,
    this.status = UserStatusEnum.active,
    this.dateOfBirth,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    String? rawRole;
    if (json['roles'] is List && (json['roles'] as List).isNotEmpty) {
      rawRole = (json['roles'] as List).first?.toString();
    } else if (json['role'] is String) {
      rawRole = json['role'] as String;
    }

    final role = UserRoleEnum.fromString(rawRole);
    final status = UserStatusEnum.fromString(json['status'] as String?);

    final firstName = json['firstName'] as String?;
    final lastName = json['lastName'] as String?;
    String resolvedFullName =
        (json['fullName'] ?? json['name'] ?? '') as String;
    if (resolvedFullName.isEmpty && (firstName != null || lastName != null)) {
      resolvedFullName = '${firstName ?? ''} ${lastName ?? ''}'.trim();
    }

    return UserModel(
      id: (json['_id'] ?? json['id'] ?? json['userId'] ?? '') as String,
      email: (json['email'] ?? '') as String,
      phone: (json['phoneNumber'] ?? json['phone'] ?? '') as String,
      role: role,
      fullName: resolvedFullName,
      avatar: (json['avatarUrl'] ?? json['avatar']) as String?,
      status: status,
      dateOfBirth: json['dateOfBirth']?.toString(),
    );
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? phone,
    UserRoleEnum? role,
    String? fullName,
    String? Function()? avatar,
    UserStatusEnum? status,
    String? Function()? dateOfBirth,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      fullName: fullName ?? this.fullName,
      avatar: avatar != null ? avatar() : this.avatar,
      status: status ?? this.status,
      dateOfBirth: dateOfBirth != null ? dateOfBirth() : this.dateOfBirth,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'phone': phone,
    'role': role.toJson(),
    'fullName': fullName,
    if (avatar != null) 'avatar': avatar,
    'status': status.toJson(),
    if (dateOfBirth != null) 'dateOfBirth': dateOfBirth,
  };

  @override
  List<Object?> get props => [
    id,
    email,
    phone,
    role,
    fullName,
    avatar,
    status,
    dateOfBirth,
  ];
}
