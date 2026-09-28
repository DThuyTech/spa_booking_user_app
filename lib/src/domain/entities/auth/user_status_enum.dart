enum UserStatusEnum {
  active('ACTIVE'),
  inactive('INACTIVE'),
  suspended('SUSPENDED'),
  pending('PENDING'),
  unknown('UNKNOWN');

  final String value;
  const UserStatusEnum(this.value);

  static UserStatusEnum fromString(String? status) {
    if (status == null || status.isEmpty) return UserStatusEnum.active;
    final upper = status.trim().toUpperCase();
    return UserStatusEnum.values.firstWhere(
      (e) => e.value == upper || e.name.toUpperCase() == upper,
      orElse: () => UserStatusEnum.active,
    );
  }

  String toJson() => value;

  bool get isActive => this == UserStatusEnum.active;
  bool get isInactive => this == UserStatusEnum.inactive;
  bool get isSuspended => this == UserStatusEnum.suspended;
  bool get isPending => this == UserStatusEnum.pending;
}

/// Backward compatibility alias
typedef UserStatus = UserStatusEnum;
