enum UserRoleEnum {
  customer('CUSTOMER'),
  owner('OWNER'),
  manager('MANAGER'),
  staff('STAFF'),
  admin('ADMIN'),
  unknown('UNKNOWN');

  final String value;
  const UserRoleEnum(this.value);

  static UserRoleEnum fromString(String? role) {
    if (role == null || role.isEmpty) return UserRoleEnum.customer;
    final upper = role.trim().toUpperCase();
    return UserRoleEnum.values.firstWhere(
      (e) => e.value == upper || e.name.toUpperCase() == upper,
      orElse: () => UserRoleEnum.customer,
    );
  }

  String toJson() => value;

  bool get isCustomer => this == UserRoleEnum.customer;
  bool get isOwner => this == UserRoleEnum.owner;
  bool get isManager => this == UserRoleEnum.manager;
  bool get isStaff => this == UserRoleEnum.staff;
  bool get isAdmin => this == UserRoleEnum.admin;
}

/// Backward compatibility alias
typedef UserRole = UserRoleEnum;
