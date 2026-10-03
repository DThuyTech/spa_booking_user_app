import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/notification/notification_entity.dart';
import '../../repositories/notification/notification_repository.dart';

class GetNotificationsUseCase {
  final NotificationRepository repository;

  const GetNotificationsUseCase(this.repository);

  Future<Either<Failure, NotificationListEntity>> call({
    int page = 1,
    int limit = 20,
    String? status,
    String? type,
  }) {
    return repository.getNotifications(
      page: page,
      limit: limit,
      status: status,
      type: type,
    );
  }
}

class GetUnreadNotificationCountUseCase {
  final NotificationRepository repository;

  const GetUnreadNotificationCountUseCase(this.repository);

  Future<Either<Failure, int>> call() {
    return repository.getUnreadCount();
  }
}

class MarkNotificationReadUseCase {
  final NotificationRepository repository;

  const MarkNotificationReadUseCase(this.repository);

  Future<Either<Failure, bool>> call(String notificationId) {
    return repository.markAsRead(notificationId);
  }
}

class MarkAllNotificationsReadUseCase {
  final NotificationRepository repository;

  const MarkAllNotificationsReadUseCase(this.repository);

  Future<Either<Failure, int>> call() {
    return repository.markAllAsRead();
  }
}
