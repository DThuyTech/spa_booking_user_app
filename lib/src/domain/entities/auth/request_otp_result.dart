import 'package:equatable/equatable.dart';

class RequestOtpResult extends Equatable {
  final String message;
  final int expiresInSeconds;

  const RequestOtpResult({
    required this.message,
    required this.expiresInSeconds,
  });

  @override
  List<Object?> get props => [message, expiresInSeconds];
}
