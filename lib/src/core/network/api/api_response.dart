class ApiResponse<T> {
  final int statusCode;
  final String? message;
  final T data;

  const ApiResponse({
    required this.statusCode,
    required this.data,
    this.message,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return ApiResponse<T>(
      statusCode: json['statusCode'] as int? ?? json['status'] as int? ?? 200,
      message: json['message'] as String?,
      data: fromJsonT(json['data']),
    );
  }
}
