import 'package:equatable/equatable.dart';

class ForgotPasswordResult extends Equatable {
  final bool success;
  final String message;
  final String phone;
  final String? otp;

  const ForgotPasswordResult({
    required this.success,
    required this.message,
    required this.phone,
    this.otp,
  });

  @override
  List<Object?> get props => [success, message, phone, otp];
}
