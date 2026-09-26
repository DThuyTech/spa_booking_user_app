import 'package:equatable/equatable.dart';

class RequestOtpRequestModel extends Equatable {
  final String phone;

  const RequestOtpRequestModel({required this.phone});

  Map<String, dynamic> toJson() => {'phone': phone};

  @override
  List<Object?> get props => [phone];
}
