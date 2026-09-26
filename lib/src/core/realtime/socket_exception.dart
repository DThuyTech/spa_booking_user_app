import '../error/exceptions.dart';

class RealtimeSocketException extends AppException {
  const RealtimeSocketException([super.message = 'Socket.IO realtime error']);
}
