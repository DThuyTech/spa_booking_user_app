import 'package:equatable/equatable.dart';

class RequestOtpResponseModel extends Equatable {
  final bool success;
  final String message;
  final String? otp;
  final String? destination;
  final int expiresInSeconds;

  const RequestOtpResponseModel({
    this.success = true,
    required this.message,
    this.otp,
    this.destination,
    required this.expiresInSeconds,
  });

  factory RequestOtpResponseModel.fromJson(Map<String, dynamic> json) {
    return RequestOtpResponseModel(
      success: json['success'] as bool? ?? true,
      message: json['message'] as String? ?? 'OTP sent successfully',
      otp: json['otp']?.toString(),
      destination:
          (json['destination'] ??
                  json['phone'] ??
                  json['email'] ??
                  json['newEmail'] ??
                  json['newPhone'])
              ?.toString(),
      expiresInSeconds: (json['expiresInSeconds'] as num?)?.toInt() ?? 300,
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'otp': otp,
    'destination': destination,
    'expiresInSeconds': expiresInSeconds,
  };

  @override
  List<Object?> get props => [
    success,
    message,
    otp,
    destination,
    expiresInSeconds,
  ];
}
