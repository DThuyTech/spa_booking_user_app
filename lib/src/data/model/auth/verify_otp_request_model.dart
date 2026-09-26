import 'package:equatable/equatable.dart';

class VerifyOtpRequestModel extends Equatable {
  final String phone;
  final String code;

  const VerifyOtpRequestModel({
    required this.phone,
    required this.code,
  });

  Map<String, dynamic> toJson() => {
    'phone': phone,
    'code': code,
  };

  @override
  List<Object?> get props => [phone, code];
}
