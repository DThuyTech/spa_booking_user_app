import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/core/error/failure_mapper.dart';
import '../../datasources/remote/notification/notification_remote_data_source.dart';
import '../../../domain/entities/notification/notification_entity.dart';
import '../../../domain/repositories/notification/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;

  const NotificationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, int>> getUnreadCount() async {
    try {
      final count = await remoteDataSource.getUnreadCount();
      return Right(count);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, NotificationListEntity>> getNotifications({
    int page = 1,
    int limit = 20,
    String? status,
    String? type,
  }) async {
    try {
      final model = await remoteDataSource.getNotifications(
        page: page,
        limit: limit,
        status: status,
        type: type,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, bool>> markAsRead(String notificationId) async {
    try {
      final success = await remoteDataSource.markAsRead(notificationId);
      return Right(success);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, int>> markAllAsRead() async {
    try {
      final count = await remoteDataSource.markAllAsRead();
      return Right(count);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }
}
