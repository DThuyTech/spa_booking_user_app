import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String phone;
  final String role;
  final String fullName;
  final String? avatar;

  const UserModel({
    required this.id,
    required this.phone,
    required this.role,
    required this.fullName,
    this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: (json['_id'] ?? json['id'] ?? '') as String,
      phone: json['phone'] as String? ?? '',
      role: json['role'] as String? ?? 'CUSTOMER',
      fullName: (json['fullName'] ?? json['name'] ?? '') as String,
      avatar: json['avatar'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'phone': phone,
    'role': role,
    'fullName': fullName,
    if (avatar != null) 'avatar': avatar,
  };

  @override
  List<Object?> get props => [id, phone, role, fullName, avatar];
}
