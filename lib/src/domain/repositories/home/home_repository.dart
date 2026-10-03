import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/domain/entities/home/greeting.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, Greeting>> getGreeting();
}
