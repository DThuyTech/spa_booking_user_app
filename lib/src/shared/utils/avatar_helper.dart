class AvatarHelper {
  const AvatarHelper._();

  /// Returns the first 2 characters of [name] in uppercase (initials for customer avatar).
  /// Falls back to 'KH' (Khách hàng) if [name] is null or empty.
  static String getInitials(String? name) {
    if (name == null) return 'KH';
    final clean = name.trim().replaceAll(RegExp(r'\s+'), '');
    if (clean.isEmpty) return 'KH';
    if (clean.length <= 2) return clean.toUpperCase();
    return clean.substring(0, 2).toUpperCase();
  }
}
