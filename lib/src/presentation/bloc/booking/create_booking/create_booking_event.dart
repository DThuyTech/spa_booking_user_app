import 'package:equatable/equatable.dart';

sealed class CreateBookingEvent extends Equatable {
  const CreateBookingEvent();

  @override
  List<Object?> get props => [];
}

class SubmitBookingEvent extends CreateBookingEvent {
  final String storeId;
  final List<String> serviceIds;
  final String startAt;
  final String? staffProfileId;
  final String? note;

  const SubmitBookingEvent({
    required this.storeId,
    required this.serviceIds,
    required this.startAt,
    this.staffProfileId,
    this.note,
  });

  @override
  List<Object?> get props => [
        storeId,
        serviceIds,
        startAt,
        staffProfileId,
        note,
      ];
}

class ResetCreateBookingEvent extends CreateBookingEvent {
  const ResetCreateBookingEvent();
}
