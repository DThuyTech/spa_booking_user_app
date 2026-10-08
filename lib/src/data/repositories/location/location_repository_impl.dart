import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/core/error/failure_mapper.dart';
import '../../../domain/entities/location/city_entity.dart';
import '../../../domain/repositories/location/location_repository.dart';
import '../../datasources/local/location/location_local_data_source.dart';
import '../../datasources/remote/location/location_remote_data_source.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource remoteDataSource;
  final LocationLocalDataSource localDataSource;

  const LocationRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<CityEntity>>> getCities({
    String? search,
    bool forceRefresh = false,
  }) async {
    // 1. Kiểm tra cache cục bộ (nếu không ép làm mới và không có tìm kiếm riêng)
    if (!forceRefresh && (search == null || search.trim().isEmpty)) {
      try {
        final cached = await localDataSource.getCachedCities();
        if (cached != null && cached.isNotEmpty) {
          return Right(cached.map((c) => c.toEntity()).toList());
        }
      } catch (_) {}
    }

    // 2. Gọi remote API nếu chưa có cache
    try {
      final remoteList = await remoteDataSource.getCities(search: search);
      // Lưu vào cache nếu lấy danh sách tổng quát
      if (search == null || search.trim().isEmpty) {
        await localDataSource.cacheCities(remoteList);
      }
      return Right(remoteList.map((c) => c.toEntity()).toList());
    } catch (e) {
      // Nếu API lỗi, fallback về cache nếu có
      try {
        final fallback = await localDataSource.getCachedCities();
        if (fallback != null && fallback.isNotEmpty) {
          return Right(fallback.map((c) => c.toEntity()).toList());
        }
      } catch (_) {}
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<String?> getSelectedCity() => localDataSource.getSelectedCity();

  @override
  Future<void> saveSelectedCity(String cityName) =>
      localDataSource.saveSelectedCity(cityName);
}
