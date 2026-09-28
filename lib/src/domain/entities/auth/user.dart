import 'package:equatable/equatable.dart';
import 'user_role_enum.dart';
import 'user_status_enum.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String phone;
  final String fullName;
  final UserRoleEnum role;
  final String? avatar;
  final UserStatusEnum status;
  final String? dateOfBirth;

  const User({
    required this.id,
    this.email = '',
    this.phone = '',
    this.fullName = '',
    this.role = UserRoleEnum.customer,
    this.avatar,
    this.status = UserStatusEnum.active,
    this.dateOfBirth,
  });

  User copyWith({
    String? id,
    String? email,
    String? phone,
    String? fullName,
    UserRoleEnum? role,
    String? Function()? avatar,
    UserStatusEnum? status,
    String? Function()? dateOfBirth,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      fullName: fullName ?? this.fullName,
      role: role ?? this.role,
      avatar: avatar != null ? avatar() : this.avatar,
      status: status ?? this.status,
      dateOfBirth: dateOfBirth != null ? dateOfBirth() : this.dateOfBirth,
    );
  }

  @override
  List<Object?> get props => [
    id,
    email,
    phone,
    fullName,
    role,
    avatar,
    status,
    dateOfBirth,
  ];
}
