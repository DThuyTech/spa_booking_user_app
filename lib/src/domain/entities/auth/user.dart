import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String phone;
  final String fullName;
  final String role;
  final String? avatar;

  const User({
    required this.id,
    required this.phone,
    required this.fullName,
    this.role = 'CUSTOMER',
    this.avatar,
  });

  @override
  List<Object?> get props => [id, phone, fullName, role, avatar];
}
