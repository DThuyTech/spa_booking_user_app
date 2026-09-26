import 'package:equatable/equatable.dart';

class RequestOtpResponseModel extends Equatable {
  final String message;
  final int expiresInSeconds;

  const RequestOtpResponseModel({
    required this.message,
    required this.expiresInSeconds,
  });

  factory RequestOtpResponseModel.fromJson(Map<String, dynamic> json) {
    return RequestOtpResponseModel(
      message: json['message'] as String? ?? 'OTP sent successfully',
      expiresInSeconds: (json['expiresInSeconds'] as num?)?.toInt() ?? 300,
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'expiresInSeconds': expiresInSeconds,
  };

  @override
  List<Object?> get props => [message, expiresInSeconds];
}
