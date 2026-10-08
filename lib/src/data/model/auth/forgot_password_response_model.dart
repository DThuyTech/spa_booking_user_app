import 'package:equatable/equatable.dart';

class ForgotPasswordResponseModel extends Equatable {
  final bool success;
  final String message;
  final String phone;
  final String? otp;

  const ForgotPasswordResponseModel({
    required this.success,
    required this.message,
    required this.phone,
    this.otp,
  });

  factory ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponseModel(
      success: json['success'] as bool? ?? true,
      message: json['message'] as String? ?? 'OTP sent successfully',
      phone: json['phone'] as String? ?? '',
      otp: json['otp'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'phone': phone,
    if (otp != null) 'otp': otp,
  };

  @override
  List<Object?> get props => [success, message, phone, otp];
}
