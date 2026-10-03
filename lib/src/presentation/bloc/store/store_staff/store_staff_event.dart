import 'package:equatable/equatable.dart';

sealed class StoreStaffEvent extends Equatable {
  const StoreStaffEvent();

  @override
  List<Object?> get props => [];
}

class FetchStaffEvent extends StoreStaffEvent {
  final String storeId;
  final String? serviceId;

  const FetchStaffEvent({required this.storeId, this.serviceId});

  @override
  List<Object?> get props => [storeId, serviceId];
}
