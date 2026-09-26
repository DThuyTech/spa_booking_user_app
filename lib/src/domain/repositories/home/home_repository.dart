import 'package:fpdart/fpdart.dart';
import 'package:board_oi/src/core/error/failure.dart';
import 'package:board_oi/src/domain/entities/home/greeting.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, Greeting>> getGreeting();
}
