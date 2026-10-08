import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spa_booking/src/core/utils/json_parser.dart';
import '../../../domain/entities/booking/booking_entity.dart';

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

@freezed
abstract class BookingServiceItemModel with _$BookingServiceItemModel {
  const factory BookingServiceItemModel({
    required String serviceId,
    required String name,
    required double price,
    @Default(60) int duration,
  }) = _BookingServiceItemModel;

  factory BookingServiceItemModel.fromJson(Map<String, dynamic> json) {
    return BookingServiceItemModel(
      serviceId: JsonParser.string(
        json['serviceId'],
        defaultValue: json['id'] ?? '',
      ),
      name: JsonParser.string(json['name'], defaultValue: ''),
      price: JsonParser.doubleValue(json['price']),
      duration: JsonParser.intValue(json['duration'], defaultValue: 60),
    );
  }
}

@freezed
abstract class BookingStaffSnapshotModel with _$BookingStaffSnapshotModel {
  const factory BookingStaffSnapshotModel({
    required String staffId,
    required String name,
  }) = _BookingStaffSnapshotModel;

  factory BookingStaffSnapshotModel.fromJson(Map<String, dynamic> json) {
    return BookingStaffSnapshotModel(
      staffId: (json['staffId'] ?? json['id'] ?? '') as String,
      name: (json['name'] ?? json['fullName'] ?? '') as String,
    );
  }
}

@freezed
abstract class BookingCustomerSnapshotModel
    with _$BookingCustomerSnapshotModel {
  const factory BookingCustomerSnapshotModel({
    required String name,
    required String phoneNumber,
  }) = _BookingCustomerSnapshotModel;

  factory BookingCustomerSnapshotModel.fromJson(Map<String, dynamic> json) {
    return BookingCustomerSnapshotModel(
      name: (json['name'] ?? json['fullName'] ?? '') as String,
      phoneNumber: (json['phoneNumber'] ?? json['phone'] ?? '') as String,
    );
  }
}

@freezed
abstract class BookingStoreSnapshotModel with _$BookingStoreSnapshotModel {
  const factory BookingStoreSnapshotModel({
    required String id,
    required String name,
    String? slug,
    String? logoUrl,
    String? address,
    String? phoneNumber,
  }) = _BookingStoreSnapshotModel;

  factory BookingStoreSnapshotModel.fromJson(Map<String, dynamic> json) {
    return BookingStoreSnapshotModel(
      id: (json['id'] ?? json['_id'] ?? '') as String,
      name: (json['name'] ?? '') as String,
      slug: json['slug'] as String?,
      logoUrl: (json['logoUrl'] ?? json['coverImageUrl']) as String?,
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );
  }
}

@freezed
abstract class BookingActionsModel with _$BookingActionsModel {
  const factory BookingActionsModel({
    @Default(false) bool canCancel,
    @Default(false) bool canReschedule,
    @Default(false) bool canBookAgain,
    @Default(false) bool canReview,
  }) = _BookingActionsModel;

  factory BookingActionsModel.fromJson(Map<String, dynamic> json) =>
      _$BookingActionsModelFromJson(json);
}

@freezed
abstract class BookingModel with _$BookingModel {
  const factory BookingModel({
    required String id,
    required String bookingCode,
    String? storeId,
    String? customerId,
    required String status,
    @Default('UNPAID') String paymentStatus,
    required String startAt,
    required String endAt,
    @Default(0) double totalDuration,
    @Default(0) double totalAmount,
    @Default([]) List<BookingServiceItemModel> services,
    BookingStaffSnapshotModel? staffSnapshot,
    BookingCustomerSnapshotModel? customerSnapshot,
    BookingStoreSnapshotModel? store,
    BookingActionsModel? actions,
    String? note,
    String? cancellationReason,
    String? cancelledAt,
    String? createdAt,
  }) = _BookingModel;

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    final rawStaff = json['staffSnapshot'] ?? json['staff'];
    BookingStaffSnapshotModel? staffSnapshot;
    if (rawStaff is Map<String, dynamic>) {
      staffSnapshot = BookingStaffSnapshotModel.fromJson(rawStaff);
    }

    final rawCustomer = json['customerSnapshot'];
    BookingCustomerSnapshotModel? customerSnapshot;
    if (rawCustomer is Map<String, dynamic>) {
      customerSnapshot = BookingCustomerSnapshotModel.fromJson(rawCustomer);
    }

    final rawStore = json['store'];
    BookingStoreSnapshotModel? store;
    if (rawStore is Map<String, dynamic>) {
      store = BookingStoreSnapshotModel.fromJson(rawStore);
    }

    final rawActions = json['actions'];
    BookingActionsModel? actions;
    if (rawActions is Map<String, dynamic>) {
      actions = BookingActionsModel.fromJson(rawActions);
    }

    final rawServices = json['services'];
    List<BookingServiceItemModel> services = [];
    if (rawServices is List) {
      services = rawServices
          .whereType<Map<String, dynamic>>()
          .map(BookingServiceItemModel.fromJson)
          .toList();
    }

    return BookingModel(
      id: (json['id'] ?? json['_id'] ?? '') as String,
      bookingCode: (json['bookingCode'] ?? '') as String,
      storeId: json['storeId'] as String?,
      customerId: json['customerId'] as String?,
      status: (json['status'] ?? 'PENDING') as String,
      paymentStatus: (json['paymentStatus'] ?? 'UNPAID') as String,
      startAt: (json['startAt'] ?? '') as String,
      endAt: (json['endAt'] ?? '') as String,
      totalDuration:
          (json['totalDuration'] ?? json['totalDurationMinutes'] as num?)
              ?.toDouble() ??
          0,
      totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 0,
      services: services,
      staffSnapshot: staffSnapshot,
      customerSnapshot: customerSnapshot,
      store: store,
      actions: actions,
      note: json['note'] as String?,
      cancellationReason: json['cancellationReason'] as String?,
      cancelledAt: json['cancelledAt'] as String?,
      createdAt: json['createdAt'] as String?,
    );
  }
}

extension BookingModelX on BookingModel {
  BookingEntity toEntity() {
    DateTime parseDate(String? raw) {
      if (raw == null || raw.isEmpty) return DateTime.now();
      return DateTime.tryParse(raw) ?? DateTime.now();
    }

    return BookingEntity(
      id: id,
      bookingCode: bookingCode,
      storeId: storeId,
      customerId: customerId,
      status: status,
      paymentStatus: paymentStatus,
      startAt: parseDate(startAt),
      endAt: parseDate(endAt),
      totalDuration: totalDuration,
      totalAmount: totalAmount,
      services: services
          .map(
            (s) => BookingServiceItemEntity(
              serviceId: s.serviceId,
              name: s.name,
              price: s.price,
              duration: s.duration,
            ),
          )
          .toList(),
      staffSnapshot: staffSnapshot != null
          ? BookingStaffSnapshotEntity(
              staffId: staffSnapshot!.staffId,
              name: staffSnapshot!.name,
            )
          : null,
      customerSnapshot: customerSnapshot != null
          ? BookingCustomerSnapshotEntity(
              name: customerSnapshot!.name,
              phoneNumber: customerSnapshot!.phoneNumber,
            )
          : null,
      store: store != null
          ? BookingStoreSnapshotEntity(
              id: store!.id,
              name: store!.name,
              slug: store!.slug,
              logoUrl: store!.logoUrl,
              address: store!.address,
              phoneNumber: store!.phoneNumber,
            )
          : null,
      actions: actions != null
          ? BookingActionsEntity(
              canCancel: actions!.canCancel,
              canReschedule: actions!.canReschedule,
              canBookAgain: actions!.canBookAgain,
              canReview: actions!.canReview,
            )
          : null,
      note: note,
      cancellationReason: cancellationReason,
      cancelledAt: cancelledAt != null ? DateTime.tryParse(cancelledAt!) : null,
      createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
    );
  }
}
