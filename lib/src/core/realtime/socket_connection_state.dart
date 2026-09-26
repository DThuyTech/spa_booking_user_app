enum SocketConnectionState {
  disconnected,
  connecting,
  connected,
  reconnecting,
  error;

  bool get isConnected => this == SocketConnectionState.connected;
  bool get isDisconnected => this == SocketConnectionState.disconnected;
}
