import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/location/city_entity.dart';
import '../../repositories/location/location_repository.dart';

class GetCitiesUseCase {
  final LocationRepository repository;

  const GetCitiesUseCase(this.repository);

  Future<Either<Failure, List<CityEntity>>> call({
    String? search,
    bool forceRefresh = false,
  }) {
    return repository.getCities(search: search, forceRefresh: forceRefresh);
  }

  Future<String?> getSelectedCity() => repository.getSelectedCity();

  Future<void> saveSelectedCity(String cityName) =>
      repository.saveSelectedCity(cityName);
}
