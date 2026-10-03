import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/core/error/failure_mapper.dart';
import 'package:spa_booking/src/domain/entities/home/greeting.dart';
import 'package:spa_booking/src/domain/repositories/home/home_repository.dart';
import 'package:spa_booking/src/data/datasources/remote/home/home_remote_data_source.dart';
import 'package:spa_booking/src/data/mapper/home/greeting_mapper.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  const HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, Greeting>> getGreeting() async {
    try {
      final model = await _remoteDataSource.getGreeting();
      return Right(model.toEntity());
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }
}
