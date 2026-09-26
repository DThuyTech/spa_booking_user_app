import 'dart:async';
import 'socket_connection_state.dart';
import 'socket_event.dart';

abstract interface class SocketClient {
  Stream<SocketConnectionState> get connectionStateStream;
  SocketConnectionState get currentState;

  Future<void> connect({String? authToken});
  Future<void> disconnect();
  void emit(String event, [dynamic data]);
  Stream<dynamic> on(String event);
  Stream<SocketEvent> get allEventsStream;
  void dispose();
}
