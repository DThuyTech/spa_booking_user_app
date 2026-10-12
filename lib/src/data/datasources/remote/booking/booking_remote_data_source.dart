import 'package:dio/dio.dart';
import 'package:spa_booking/src/core/network/network_client.dart';
import 'package:spa_booking/src/data/model/analytics/customer_spending_analytics_model.dart';
import 'package:spa_booking/src/data/model/booking/booking_availability_model.dart';
import 'package:spa_booking/src/data/model/booking/booking_list_response_model.dart';
import 'package:spa_booking/src/data/model/booking/booking_model.dart';
import '../../../../domain/entities/booking/booking_item_param.dart';

abstract interface class BookingRemoteDataSource {
  Future<BookingAvailabilityModel> getAvailability({
    required String storeId,
    required List<BookingItemParam> services,
    String? dateFrom,
    String? dateTo,
    int stepMinutes = 15,
    String mode = 'SLOT_SEARCH',
    String orderMode = 'FLEXIBLE',
  });

  Future<BookingModel> createBooking({
    required String storeId,
    String? startAt,
    List<BookingItemParam>? items,
    List<String>? serviceIds,
    String? staffProfileId,
    String? note,
  });

  Future<BookingListResponseModel> getCustomerBookings({
    String? tab,
    String? search,
    String? serviceName,
    String? storeName,
    String? date,
    String? from,
    String? to,
    String? status,
    int page = 1,
    int limit = 20,
  });

  Future<BookingModel> getBookingDetail(String bookingId);

  Future<BookingModel> rescheduleBooking({
    required String bookingId,
    required String startAt,
  });

  Future<BookingModel> cancelBooking({
    required String bookingId,
    String? cancellationReason,
  });

  Future<BookingModel> updateBookingNotes({
    required String bookingId,
    required String note,
  });

  Future<CustomerSpendingAnalyticsModel> getSpendingAnalytics({
    String? from,
    String? to,
    String period = 'MONTH',
    String? storeId,
  });
}

class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
  final NetworkClient _client;

  const BookingRemoteDataSourceImpl(this._client);

  @override
  Future<BookingAvailabilityModel> getAvailability({
    required String storeId,
    required List<BookingItemParam> services,
    String? dateFrom,
    String? dateTo,
    int stepMinutes = 15,
    String mode = 'SLOT_SEARCH',
    String orderMode = 'FLEXIBLE',
  }) async {
    final body = <String, dynamic>{
      'services': services.map((s) => s.toJson()).toList(),
      if (dateFrom != null && dateFrom.isNotEmpty) 'dateFrom': dateFrom,
      if (dateTo != null && dateTo.isNotEmpty) 'dateTo': dateTo,
      'stepMinutes': stepMinutes,
      'mode': mode,
      'orderMode': orderMode,
    };

    Response<Map<String, dynamic>> response;
    try {
      response = await _client.post<Map<String, dynamic>>(
        '/customer/stores/$storeId/booking-availability',
        data: body,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
        response = await _client.post<Map<String, dynamic>>(
          '/public/stores/$storeId/booking-availability',
          data: body,
        );
      } else {
        rethrow;
      }
    }

    final data = response.data;
    if (data != null) {
      final payload = (data['data'] as Map<String, dynamic>?) ?? data;
      return BookingAvailabilityModel.fromJson(payload);
    }
    throw const FormatException('Empty response received for availability');
  }

  @override
  Future<BookingModel> createBooking({
    required String storeId,
    String? startAt,
    List<BookingItemParam>? items,
    List<String>? serviceIds,
    String? staffProfileId,
    String? note,
  }) async {
    final List<Map<String, dynamic>> requestItems;
    if (items != null && items.isNotEmpty) {
      requestItems = items.map((i) => i.toJson()).toList();
    } else if (serviceIds != null && serviceIds.isNotEmpty) {
      requestItems = serviceIds
          .map(
            (id) => {
              'serviceId': id,
              'staffProfileId':
                  (staffProfileId != null && staffProfileId.isNotEmpty)
                  ? staffProfileId
                  : null,
            },
          )
          .toList();
    } else {
      requestItems = [];
    }

    final body = <String, dynamic>{
      if (startAt != null && startAt.isNotEmpty) 'startAt': startAt,
      'items': requestItems,
    };
    if (note != null && note.isNotEmpty) {
      body['note'] = note;
    }

    final response = await _client.post<Map<String, dynamic>>(
      '/customer/stores/$storeId/bookings',
      data: body,
    );

    final data = response.data;
    if (data != null) {
      final payload = (data['data'] as Map<String, dynamic>?) ?? data;
      return BookingModel.fromJson(payload);
    }
    throw const FormatException('Empty response received for create booking');
  }

  @override
  Future<BookingListResponseModel> getCustomerBookings({
    String? tab,
    String? search,
    String? serviceName,
    String? storeName,
    String? date,
    String? from,
    String? to,
    String? status,
    int page = 1,
    int limit = 20,
  }) async {
    final queryParams = <String, dynamic>{'page': page, 'limit': limit};
    if (tab != null && tab.isNotEmpty && tab.toUpperCase() != 'ALL') {
      final normalizedTab = tab.toUpperCase() == 'COMPLETED'
          ? 'PAST'
          : tab.toUpperCase();
      queryParams['tab'] = normalizedTab;
    }
    if (search != null && search.trim().isNotEmpty) {
      queryParams['search'] = search.trim();
    }
    if (serviceName != null && serviceName.trim().isNotEmpty) {
      queryParams['serviceName'] = serviceName.trim();
    }
    if (storeName != null && storeName.trim().isNotEmpty) {
      queryParams['storeName'] = storeName.trim();
    }
    if (date != null && date.trim().isNotEmpty) {
      queryParams['date'] = date.trim();
    }
    if (from != null && from.trim().isNotEmpty) {
      queryParams['from'] = from.trim();
    }
    if (to != null && to.trim().isNotEmpty) {
      queryParams['to'] = to.trim();
    }
    if (status != null && status.trim().isNotEmpty) {
      queryParams['status'] = status.trim();
    }

    final response = await _client.get<Map<String, dynamic>>(
      '/customer/bookings',
      queryParameters: queryParams,
    );

    final data = response.data;
    if (data != null) {
      final payload = (data['data'] as Map<String, dynamic>?) ?? data;
      return BookingListResponseModel.fromJson(payload);
    }
    return const BookingListResponseModel();
  }

  @override
  Future<BookingModel> getBookingDetail(String bookingId) async {
    final response = await _client.get<Map<String, dynamic>>(
      '/customer/bookings/$bookingId',
    );

    final data = response.data;
    if (data != null) {
      final payload = (data['data'] as Map<String, dynamic>?) ?? data;
      return BookingModel.fromJson(payload);
    }
    throw const FormatException('Empty response received for booking detail');
  }

  @override
  Future<BookingModel> rescheduleBooking({
    required String bookingId,
    required String startAt,
  }) async {
    final response = await _client.patch<Map<String, dynamic>>(
      '/customer/bookings/$bookingId/reschedule',
      data: {'startAt': startAt},
    );

    final data = response.data;
    if (data != null) {
      final payload = (data['data'] as Map<String, dynamic>?) ?? data;
      return BookingModel.fromJson(payload);
    }
    throw const FormatException(
      'Empty response received for reschedule booking',
    );
  }

  @override
  Future<BookingModel> cancelBooking({
    required String bookingId,
    String? cancellationReason,
  }) async {
    final body = <String, dynamic>{};
    if (cancellationReason != null && cancellationReason.isNotEmpty) {
      body['cancellationReason'] = cancellationReason;
    }

    final response = await _client.patch<Map<String, dynamic>>(
      '/customer/bookings/$bookingId/cancel',
      data: body,
    );

    final data = response.data;
    if (data != null) {
      final payload = (data['data'] as Map<String, dynamic>?) ?? data;
      return BookingModel.fromJson(payload);
    }
    throw const FormatException('Empty response received for cancel booking');
  }

  @override
  Future<BookingModel> updateBookingNotes({
    required String bookingId,
    required String note,
  }) async {
    final response = await _client.patch<Map<String, dynamic>>(
      '/customer/bookings/$bookingId/notes',
      data: {'note': note},
    );

    final data = response.data;
    if (data != null) {
      final payload = (data['data'] as Map<String, dynamic>?) ?? data;
      return BookingModel.fromJson(payload);
    }
    throw const FormatException(
      'Empty response received for update booking notes',
    );
  }

  @override
  Future<CustomerSpendingAnalyticsModel> getSpendingAnalytics({
    String? from,
    String? to,
    String period = 'MONTH',
    String? storeId,
  }) async {
    final queryParams = <String, dynamic>{'period': period};
    if (from != null && from.trim().isNotEmpty) {
      queryParams['from'] = from.trim();
    }
    if (to != null && to.trim().isNotEmpty) {
      queryParams['to'] = to.trim();
    }
    if (storeId != null && storeId.trim().isNotEmpty) {
      queryParams['storeId'] = storeId.trim();
    }

    final response = await _client.get<Map<String, dynamic>>(
      '/customer/analytics/spending',
      queryParameters: queryParams,
    );

    final data = response.data;
    if (data != null) {
      final payload = (data['data'] as Map<String, dynamic>?) ?? data;
      return CustomerSpendingAnalyticsModel.fromJson(payload);
    }
    return const CustomerSpendingAnalyticsModel();
  }
}
