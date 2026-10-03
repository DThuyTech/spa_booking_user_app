import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_entity.freezed.dart';

@freezed
abstract class BookingServiceItemEntity with _$BookingServiceItemEntity {
  const factory BookingServiceItemEntity({
    required String serviceId,
    required String name,
    required int price,
    @Default(60) int duration,
  }) = _BookingServiceItemEntity;
}

@freezed
abstract class BookingStaffSnapshotEntity with _$BookingStaffSnapshotEntity {
  const factory BookingStaffSnapshotEntity({
    required String staffId,
    required String name,
  }) = _BookingStaffSnapshotEntity;
}

@freezed
abstract class BookingCustomerSnapshotEntity with _$BookingCustomerSnapshotEntity {
  const factory BookingCustomerSnapshotEntity({
    required String name,
    required String phoneNumber,
  }) = _BookingCustomerSnapshotEntity;
}

@freezed
abstract class BookingStoreSnapshotEntity with _$BookingStoreSnapshotEntity {
  const factory BookingStoreSnapshotEntity({
    required String id,
    required String name,
    String? slug,
    String? logoUrl,
    String? address,
    String? phoneNumber,
  }) = _BookingStoreSnapshotEntity;
}

@freezed
abstract class BookingActionsEntity with _$BookingActionsEntity {
  const factory BookingActionsEntity({
    @Default(false) bool canCancel,
    @Default(false) bool canReschedule,
    @Default(false) bool canBookAgain,
    @Default(false) bool canReview,
  }) = _BookingActionsEntity;
}

@freezed
abstract class BookingEntity with _$BookingEntity {
  const factory BookingEntity({
    required String id,
    required String bookingCode,
    String? storeId,
    String? customerId,
    required String status,
    @Default('UNPAID') String paymentStatus,
    required DateTime startAt,
    required DateTime endAt,
    @Default(0) int totalDuration,
    @Default(0) int totalAmount,
    @Default([]) List<BookingServiceItemEntity> services,
    BookingStaffSnapshotEntity? staffSnapshot,
    BookingCustomerSnapshotEntity? customerSnapshot,
    BookingStoreSnapshotEntity? store,
    BookingActionsEntity? actions,
    String? note,
    String? cancellationReason,
    DateTime? cancelledAt,
    DateTime? createdAt,
  }) = _BookingEntity;
}
