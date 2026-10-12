import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/booking/booking_availability_entity.dart';
import '../../entities/booking/booking_entity.dart';
import '../../entities/booking/booking_item_param.dart';
import '../../entities/booking/booking_list_entity.dart';
import '../../../data/model/analytics/customer_spending_analytics_model.dart';

abstract interface class BookingRepository {
  Future<Either<Failure, BookingAvailabilityEntity>> getAvailability({
    required String storeId,
    required List<BookingItemParam> services,
    String? dateFrom,
    String? dateTo,
    int stepMinutes = 15,
    String mode = 'SLOT_SEARCH',
    String orderMode = 'FLEXIBLE',
  });

  Future<Either<Failure, BookingEntity>> createBooking({
    required String storeId,
    String? startAt,
    List<BookingItemParam>? items,
    List<String>? serviceIds,
    String? staffProfileId,
    String? note,
  });

  Future<Either<Failure, BookingListResponseEntity>> getCustomerBookings({
    String? tab,
    String? status,
    String? date,
    int page = 1,
    int limit = 20,
  });

  Future<Either<Failure, BookingEntity>> getBookingDetail(String bookingId);

  Future<Either<Failure, BookingEntity>> rescheduleBooking({
    required String bookingId,
    required String startAt,
  });

  Future<Either<Failure, BookingEntity>> cancelBooking({
    required String bookingId,
    String? cancellationReason,
  });

  Future<Either<Failure, BookingEntity>> updateBookingNotes({
    required String bookingId,
    required String note,
  });

  Future<Either<Failure, CustomerSpendingAnalyticsModel>> getSpendingAnalytics({
    String? from,
    String? to,
    String? period,
    String? storeId,
  });
}
