import 'dart:async';
import 'package:socket_io_client/socket_io_client.dart' as io;
import '../config/app_config.dart';
import '../logging/app_logger.dart';
import 'socket_client.dart';
import 'socket_connection_state.dart';
import 'socket_event.dart';

class SocketManager implements SocketClient {
  final AppConfig appConfig;
  final Logger logger;

  io.Socket? _socket;
  final _stateController = StreamController<SocketConnectionState>.broadcast();
  final _allEventsController = StreamController<SocketEvent>.broadcast();
  final Map<String, StreamController<dynamic>> _eventControllers = {};

  SocketConnectionState _currentState = SocketConnectionState.disconnected;

  SocketManager({required this.appConfig, required this.logger});

  @override
  Stream<SocketConnectionState> get connectionStateStream =>
      _stateController.stream;

  @override
  SocketConnectionState get currentState => _currentState;

  @override
  Stream<SocketEvent> get allEventsStream => _allEventsController.stream;

  @override
  Future<void> connect({String? authToken}) async {
    if (_currentState == SocketConnectionState.connected ||
        _currentState == SocketConnectionState.connecting) {
      return;
    }

    _updateState(SocketConnectionState.connecting);

    try {
      final optionsBuilder = io.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .enableReconnection()
          .setReconnectionAttempts(5)
          .setReconnectionDelay(1000);

      if (authToken != null && authToken.isNotEmpty) {
        optionsBuilder.setAuth({'token': authToken});
        optionsBuilder.setExtraHeaders({'Authorization': 'Bearer $authToken'});
      }

      _socket = io.io(appConfig.socketUrl, optionsBuilder.build());

      _socket?.onConnect((_) {
        logger.info('Socket connected to ${appConfig.socketUrl}');
        _updateState(SocketConnectionState.connected);
      });

      _socket?.onDisconnect((reason) {
        logger.info('Socket disconnected: $reason');
        _updateState(SocketConnectionState.disconnected);
      });

      _socket?.onConnectError((err) {
        logger.error('Socket connect error: $err');
        _updateState(SocketConnectionState.error);
      });

      _socket?.onError((err) {
        logger.error('Socket error: $err');
        _updateState(SocketConnectionState.error);
      });

      _socket?.onReconnect((_) {
        logger.info('Socket reconnected');
        _updateState(SocketConnectionState.connected);
      });

      _socket?.onReconnectAttempt((_) {
        logger.debug('Socket reconnect attempt...');
        _updateState(SocketConnectionState.reconnecting);
      });

      _socket?.onAny((event, data) {
        final socketEvent = SocketEvent(event: event, data: data);
        _allEventsController.add(socketEvent);
        if (_eventControllers.containsKey(event)) {
          _eventControllers[event]?.add(data);
        }
      });

      _socket?.connect();
    } catch (e, st) {
      logger.error('Failed to initialize socket: $e', e, st);
      _updateState(SocketConnectionState.error);
    }
  }

  @override
  Future<void> disconnect() async {
    if (_socket != null) {
      _socket?.disconnect();
      _socket?.dispose();
      _socket = null;
    }
    _updateState(SocketConnectionState.disconnected);
  }

  @override
  void emit(String event, [dynamic data]) {
    if (_currentState != SocketConnectionState.connected) {
      logger.warning(
        'Attempted to emit "$event" while socket is not connected',
      );
      return;
    }
    _socket?.emit(event, data);
  }

  @override
  Stream<dynamic> on(String event) {
    if (!_eventControllers.containsKey(event)) {
      _eventControllers[event] = StreamController<dynamic>.broadcast();
    }
    return _eventControllers[event]!.stream;
  }

  void _updateState(SocketConnectionState newState) {
    _currentState = newState;
    if (!_stateController.isClosed) {
      _stateController.add(newState);
    }
  }

  @override
  void dispose() {
    disconnect();
    _stateController.close();
    _allEventsController.close();
    for (final controller in _eventControllers.values) {
      controller.close();
    }
    _eventControllers.clear();
  }
}
