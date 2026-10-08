import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/core/error/failure_mapper.dart';
import 'package:spa_booking/src/data/datasources/remote/booking/booking_remote_data_source.dart';
import 'package:spa_booking/src/data/model/analytics/customer_spending_analytics_model.dart';
import 'package:spa_booking/src/data/model/booking/booking_availability_model.dart';
import 'package:spa_booking/src/data/model/booking/booking_list_response_model.dart';
import 'package:spa_booking/src/data/model/booking/booking_model.dart';
import 'package:spa_booking/src/domain/entities/booking/booking_availability_entity.dart';
import 'package:spa_booking/src/domain/entities/booking/booking_entity.dart';
import 'package:spa_booking/src/domain/entities/booking/booking_list_entity.dart';
import 'package:spa_booking/src/domain/repositories/booking/booking_repository.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingRemoteDataSource remoteDataSource;

  const BookingRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, BookingAvailabilityEntity>> getAvailability({
    required String storeId,
    required String date,
    required List<String> serviceIds,
    String? staffProfileId,
  }) async {
    try {
      final model = await remoteDataSource.getAvailability(
        storeId: storeId,
        date: date,
        serviceIds: serviceIds,
        staffProfileId: staffProfileId,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, BookingEntity>> createBooking({
    required String storeId,
    required List<String> serviceIds,
    required String startAt,
    String? staffProfileId,
    String? note,
  }) async {
    try {
      final model = await remoteDataSource.createBooking(
        storeId: storeId,
        serviceIds: serviceIds,
        startAt: startAt,
        staffProfileId: staffProfileId,
        note: note,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, BookingListResponseEntity>> getCustomerBookings({
    String? tab,
    String? status,
    String? date,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final model = await remoteDataSource.getCustomerBookings(
        tab: tab,
        status: status,
        date: date,
        page: page,
        limit: limit,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, BookingEntity>> getBookingDetail(
    String bookingId,
  ) async {
    try {
      final model = await remoteDataSource.getBookingDetail(bookingId);
      return Right(model.toEntity());
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, BookingEntity>> rescheduleBooking({
    required String bookingId,
    required String startAt,
  }) async {
    try {
      final model = await remoteDataSource.rescheduleBooking(
        bookingId: bookingId,
        startAt: startAt,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, BookingEntity>> cancelBooking({
    required String bookingId,
    String? cancellationReason,
  }) async {
    try {
      final model = await remoteDataSource.cancelBooking(
        bookingId: bookingId,
        cancellationReason: cancellationReason,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, BookingEntity>> updateBookingNotes({
    required String bookingId,
    required String note,
  }) async {
    try {
      final model = await remoteDataSource.updateBookingNotes(
        bookingId: bookingId,
        note: note,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, CustomerSpendingAnalyticsModel>> getSpendingAnalytics({
    String? from,
    String? to,
    String? period,
    String? storeId,
  }) async {
    try {
      final model = await remoteDataSource.getSpendingAnalytics(
        from: from,
        to: to,
        period: period ?? 'MONTH',
        storeId: storeId,
      );
      return Right(model);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }
}
