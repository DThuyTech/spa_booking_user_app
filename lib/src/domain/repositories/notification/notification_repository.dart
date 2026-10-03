import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/notification/notification_entity.dart';

abstract interface class NotificationRepository {
  Future<Either<Failure, int>> getUnreadCount();

  Future<Either<Failure, NotificationListEntity>> getNotifications({
    int page = 1,
    int limit = 20,
    String? status,
    String? type,
  });

  Future<Either<Failure, bool>> markAsRead(String notificationId);

  Future<Either<Failure, int>> markAllAsRead();
}
