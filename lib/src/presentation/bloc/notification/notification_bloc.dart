import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/domain/entities/notification/notification_entity.dart';
import 'package:spa_booking/src/domain/usecases/notification/notification_usecases.dart';
import 'notification_event.dart';
import 'notification_state.dart';

export 'notification_event.dart';
export 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final GetNotificationsUseCase getNotificationsUseCase;
  final GetUnreadNotificationCountUseCase getUnreadNotificationCountUseCase;
  final MarkNotificationReadUseCase markNotificationReadUseCase;
  final MarkAllNotificationsReadUseCase markAllNotificationsReadUseCase;

  NotificationBloc({
    required this.getNotificationsUseCase,
    required this.getUnreadNotificationCountUseCase,
    required this.markNotificationReadUseCase,
    required this.markAllNotificationsReadUseCase,
  }) : super(const NotificationState()) {
    on<FetchNotificationsEvent>(_onFetchNotifications);
    on<FetchUnreadCountEvent>(_onFetchUnreadCount);
    on<MarkNotificationAsReadEvent>(_onMarkNotificationAsRead);
    on<MarkAllNotificationsAsReadEvent>(_onMarkAllNotificationsAsRead);
  }

  Future<void> _onFetchNotifications(
    FetchNotificationsEvent event,
    Emitter<NotificationState> emit,
  ) async {
    emit(
      state.copyWith(
        status: NotificationStatus.loading,
        currentFilter: event.type ?? event.status ?? 'ALL',
        failure: null,
      ),
    );

    final result = await getNotificationsUseCase(
      page: event.page,
      limit: event.limit,
      status: event.status,
      type: event.type,
    );

    result.fold(
      (Failure failure) => emit(
        state.copyWith(status: NotificationStatus.failure, failure: failure),
      ),
      (NotificationListEntity entity) => emit(
        state.copyWith(
          status: NotificationStatus.loaded,
          items: entity.items,
          page: entity.page,
          total: entity.total,
          totalPages: entity.totalPages,
          failure: null,
        ),
      ),
    );
  }

  Future<void> _onFetchUnreadCount(
    FetchUnreadCountEvent event,
    Emitter<NotificationState> emit,
  ) async {
    final result = await getUnreadNotificationCountUseCase();
    result.fold(
      (_) => null,
      (count) => emit(state.copyWith(unreadCount: count)),
    );
  }

  Future<void> _onMarkNotificationAsRead(
    MarkNotificationAsReadEvent event,
    Emitter<NotificationState> emit,
  ) async {
    final updatedItems = state.items.map((item) {
      if (item.id == event.notificationId) {
        return item.copyWith(isRead: true);
      }
      return item;
    }).toList();

    final newUnreadCount = state.unreadCount > 0 ? state.unreadCount - 1 : 0;
    emit(state.copyWith(items: updatedItems, unreadCount: newUnreadCount));

    await markNotificationReadUseCase(event.notificationId);
  }

  Future<void> _onMarkAllNotificationsAsRead(
    MarkAllNotificationsAsReadEvent event,
    Emitter<NotificationState> emit,
  ) async {
    final updatedItems = state.items.map((item) {
      return item.copyWith(isRead: true);
    }).toList();

    emit(state.copyWith(items: updatedItems, unreadCount: 0));

    await markAllNotificationsReadUseCase();
  }
}
