import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/location/city_entity.dart';

abstract interface class LocationRepository {
  Future<Either<Failure, List<CityEntity>>> getCities({
    String? search,
    bool forceRefresh = false,
  });

  Future<String?> getSelectedCity();
  Future<void> saveSelectedCity(String cityName);
}
