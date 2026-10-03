import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/domain/entities/notification/notification_entity.dart';

part 'notification_state.freezed.dart';

enum NotificationStatus { initial, loading, loaded, failure }

@freezed
abstract class NotificationState with _$NotificationState {
  const NotificationState._();

  const factory NotificationState({
    @Default(NotificationStatus.initial) NotificationStatus status,
    @Default([]) List<NotificationEntity> items,
    @Default(0) int unreadCount,
    @Default(1) int page,
    @Default(1) int totalPages,
    @Default(0) int total,
    @Default('ALL') String currentFilter,
    Failure? failure,
  }) = _NotificationState;

  bool get isInitial => status == NotificationStatus.initial;
  bool get isLoading => status == NotificationStatus.loading;
  bool get isLoaded => status == NotificationStatus.loaded;
  bool get isFailure => status == NotificationStatus.failure;
}
