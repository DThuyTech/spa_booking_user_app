import 'package:equatable/equatable.dart';

class BookingItemParam extends Equatable {
  final String serviceId;
  final String? staffProfileId;

  const BookingItemParam({required this.serviceId, this.staffProfileId});

  Map<String, dynamic> toJson() => {
    'serviceId': serviceId,
    'staffProfileId': staffProfileId,
  };

  factory BookingItemParam.fromJson(Map<String, dynamic> json) {
    return BookingItemParam(
      serviceId: json['serviceId'] as String,
      staffProfileId: json['staffProfileId'] as String?,
    );
  }

  @override
  List<Object?> get props => [serviceId, staffProfileId];
}
