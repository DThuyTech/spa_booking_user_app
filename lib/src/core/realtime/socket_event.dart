import 'package:equatable/equatable.dart';

class SocketEvent extends Equatable {
  final String event;
  final dynamic data;
  final DateTime timestamp;

  SocketEvent({required this.event, this.data, DateTime? timestamp})
    : timestamp = timestamp ?? DateTime.now();

  @override
  List<Object?> get props => [event, data, timestamp];
}
