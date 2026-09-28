class SpecificRatingDetail {
  final String label;
  final double value; // 0.0 to 1.0
  final String statusText;

  const SpecificRatingDetail({
    required this.label,
    required this.value,
    required this.statusText,
  });

  SpecificRatingDetail copyWith({
    String? label,
    double? value,
    String? statusText,
  }) {
    return SpecificRatingDetail(
      label: label ?? this.label,
      value: value ?? this.value,
      statusText: statusText ?? this.statusText,
    );
  }
}

class WriteReviewMockData {
  const WriteReviewMockData._();

  static const String defaultSalonName = 'Aura Studio';
  static const String defaultSalonSubtitle =
      'What do you think of your experience?';
  static const String defaultLogoUrl =
      'https://images.unsplash.com/photo-1560066984-138dadb4c035?auto=format&fit=crop&w=200&q=80';

  static const List<SpecificRatingDetail> defaultCriteria = [
    SpecificRatingDetail(
      label: 'Cleanliness',
      value: 1.0,
      statusText: 'Exceptional',
    ),
    SpecificRatingDetail(label: 'Staff', value: 0.8, statusText: 'Great'),
    SpecificRatingDetail(label: 'Atmosphere', value: 0.6, statusText: 'Good'),
  ];

  static String getStatusForValue(double value) {
    if (value >= 0.9) return 'Exceptional';
    if (value >= 0.75) return 'Great';
    if (value >= 0.5) return 'Good';
    if (value >= 0.25) return 'Fair';
    return 'Poor';
  }
}
