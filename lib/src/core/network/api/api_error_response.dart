class ApiErrorResponse {
  final int statusCode;
  final String message;
  final Map<String, dynamic>? errors;

  const ApiErrorResponse({
    required this.statusCode,
    required this.message,
    this.errors,
  });

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) {
    return ApiErrorResponse(
      statusCode: json['statusCode'] as int? ?? json['status'] as int? ?? 500,
      message:
          json['message'] as String? ??
          json['error'] as String? ??
          'An error occurred',
      errors: json['errors'] as Map<String, dynamic>?,
    );
  }
}
