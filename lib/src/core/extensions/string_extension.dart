extension StringX on String {
  bool get isValidPhoneNumber {
    final clean = replaceAll(RegExp(r'\s+'), '');
    return RegExp(r'^(0|\+84)[3|5|7|8|9][0-9]{8}$').hasMatch(clean);
  }

  bool get isValidEmail {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }

  String get capitalizeFirst {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
