import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/booking/booking_availability_entity.dart';
import '../../entities/booking/booking_entity.dart';
import '../../entities/booking/booking_list_entity.dart';
import '../../../data/model/analytics/customer_spending_analytics_model.dart';

abstract interface class BookingRepository {
  Future<Either<Failure, BookingAvailabilityEntity>> getAvailability({
    required String storeId,
    required String date,
    required List<String> serviceIds,
    String? staffProfileId,
  });

  Future<Either<Failure, BookingEntity>> createBooking({
    required String storeId,
    required List<String> serviceIds,
    required String startAt,
    String? staffProfileId,
    String? note,
  });

  Future<Either<Failure, BookingListResponseEntity>> getCustomerBookings({
    String? tab,
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
