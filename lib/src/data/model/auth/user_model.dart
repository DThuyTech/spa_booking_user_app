import 'package:spa_booking/src/domain/entities/auth/customer_booking_stats.dart';
import 'package:spa_booking/src/domain/entities/auth/user.dart';
import 'package:spa_booking/src/domain/entities/auth/user_role_enum.dart';
import 'package:spa_booking/src/domain/entities/auth/user_status_enum.dart';
import 'package:equatable/equatable.dart';

class CustomerBookingStatsModel extends Equatable {
  final int totalBookings;
  final int upcomingBookings;
  final int completedBookings;
  final int cancelledBookings;
  final int totalSpent;
  final String? lastBookingDate;
  final String? lastBookingStoreName;
  final String? updatedAt;

  const CustomerBookingStatsModel({
    this.totalBookings = 0,
    this.upcomingBookings = 0,
    this.completedBookings = 0,
    this.cancelledBookings = 0,
    this.totalSpent = 0,
    this.lastBookingDate,
    this.lastBookingStoreName,
    this.updatedAt,
  });

  factory CustomerBookingStatsModel.fromJson(Map<String, dynamic> json) {
    return CustomerBookingStatsModel(
      totalBookings: (json['totalBookings'] as num?)?.toInt() ?? 0,
      upcomingBookings: (json['upcomingBookings'] as num?)?.toInt() ?? 0,
      completedBookings: (json['completedBookings'] as num?)?.toInt() ?? 0,
      cancelledBookings: (json['cancelledBookings'] as num?)?.toInt() ?? 0,
      totalSpent: (json['totalSpent'] as num?)?.toInt() ?? 0,
      lastBookingDate: json['lastBookingDate']?.toString(),
      lastBookingStoreName: json['lastBookingStoreName']?.toString(),
      updatedAt: json['updatedAt']?.toString(),
    );
  }

  CustomerBookingStats toEntity() => CustomerBookingStats(
    totalBookings: totalBookings,
    upcomingBookings: upcomingBookings,
    completedBookings: completedBookings,
    cancelledBookings: cancelledBookings,
    totalSpent: totalSpent,
    lastBookingDate: lastBookingDate,
    lastBookingStoreName: lastBookingStoreName,
  );

  @override
  List<Object?> get props => [
    totalBookings,
    upcomingBookings,
    completedBookings,
    cancelledBookings,
    totalSpent,
    lastBookingDate,
    lastBookingStoreName,
    updatedAt,
  ];
}

class UserModel extends Equatable {
  final String id;
  final String email;
  final String phone;
  final UserRoleEnum role;
  final String fullName;
  final String? avatar;
  final UserStatusEnum status;
  final String? dateOfBirth;
  final CustomerBookingStatsModel? bookingStats;

  const UserModel({
    required this.id,
    this.email = '',
    this.phone = '',
    this.role = UserRoleEnum.customer,
    this.fullName = '',
    this.avatar,
    this.status = UserStatusEnum.active,
    this.dateOfBirth,
    this.bookingStats,
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

    final rawStats = json['bookingStats'];
    CustomerBookingStatsModel? stats;
    if (rawStats is Map<String, dynamic>) {
      stats = CustomerBookingStatsModel.fromJson(rawStats);
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
      bookingStats: stats,
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
    CustomerBookingStatsModel? Function()? bookingStats,
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
      bookingStats: bookingStats != null ? bookingStats() : this.bookingStats,
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
    bookingStats,
  ];
}

extension UserModelX on UserModel {
  User toEntity() => User(
    id: id,
    email: email,
    phone: phone,
    fullName: fullName,
    role: role,
    avatar: avatar,
    status: status,
    dateOfBirth: dateOfBirth,
    bookingStats: bookingStats?.toEntity(),
  );
}
