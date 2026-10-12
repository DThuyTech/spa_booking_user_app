import 'package:equatable/equatable.dart';

class RequestOtpResult extends Equatable {
  final bool success;
  final String message;
  final String? otp;
  final String? destination;
  final int expiresInSeconds;

  const RequestOtpResult({
    this.success = true,
    required this.message,
    this.otp,
    this.destination,
    required this.expiresInSeconds,
  });

  @override
  List<Object?> get props => [
    success,
    message,
    otp,
    destination,
    expiresInSeconds,
  ];
}
