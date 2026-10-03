import 'package:equatable/equatable.dart';

sealed class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object?> get props => [];
}

class FetchNotificationsEvent extends NotificationEvent {
  final int page;
  final int limit;
  final String? status;
  final String? type;

  const FetchNotificationsEvent({
    this.page = 1,
    this.limit = 20,
    this.status,
    this.type,
  });

  @override
  List<Object?> get props => [page, limit, status, type];
}

class FetchUnreadCountEvent extends NotificationEvent {
  const FetchUnreadCountEvent();
}

class MarkNotificationAsReadEvent extends NotificationEvent {
  final String notificationId;

  const MarkNotificationAsReadEvent(this.notificationId);

  @override
  List<Object?> get props => [notificationId];
}

class MarkAllNotificationsAsReadEvent extends NotificationEvent {
  const MarkAllNotificationsAsReadEvent();
}
