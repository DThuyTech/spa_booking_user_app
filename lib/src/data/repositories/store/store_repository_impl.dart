import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/core/error/failure_mapper.dart';
import 'package:spa_booking/src/data/datasources/remote/store/store_remote_data_source.dart';
import 'package:spa_booking/src/data/model/store/service_category_model.dart';
import 'package:spa_booking/src/data/model/store/service_model.dart';
import 'package:spa_booking/src/data/model/store/staff_model.dart';
import 'package:spa_booking/src/data/model/store/store_schedule_grid_model.dart';
import 'package:spa_booking/src/domain/entities/store/schedule_grid_entity.dart';
import 'package:spa_booking/src/data/model/store/store_model.dart';
import 'package:spa_booking/src/domain/entities/store/service_category_entity.dart';
import 'package:spa_booking/src/domain/entities/store/service_entity.dart';
import 'package:spa_booking/src/domain/entities/store/staff_entity.dart';
import 'package:spa_booking/src/domain/entities/store/store_detail_entity.dart';
import 'package:spa_booking/src/domain/entities/store/store_entity.dart';
import 'package:spa_booking/src/domain/entities/store/store_full_detail_entity.dart';
import 'package:spa_booking/src/domain/entities/store/store_gallery_entity.dart';
import 'package:spa_booking/src/domain/repositories/store/store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreRemoteDataSource remoteDataSource;

  const StoreRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<StoreEntity>>> getStores({
    String? search,
    String? city,
    String? province,
    String? district,
    bool? isFavorite,
    int? minPrice,
    int? maxPrice,
    double? minRating,
    double? lat,
    double? lng,
    String? sortBy,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await remoteDataSource.getStores(
        search: search,
        city: city,
        province: province,
        district: district,
        isFavorite: isFavorite,
        minPrice: minPrice,
        maxPrice: maxPrice,
        minRating: minRating,
        lat: lat,
        lng: lng,
        sortBy: sortBy,
        page: page,
        limit: limit,
      );
      final entities = response.items.map((m) => m.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, List<StoreEntity>>> getRecentlyBookedStores({
    int limit = 10,
  }) async {
    try {
      final models = await remoteDataSource.getRecentlyBookedStores(
        limit: limit,
      );
      final entities = models.map((m) => m.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, List<StoreEntity>>> getNearbyStores({
    required double lat,
    required double lng,
    double? distanceKm,
    double? radius,
    int? page,
    int limit = 10,
    String? search,
    String? city,
    String? district,
    bool? isFavorite,
  }) async {
    try {
      final response = await remoteDataSource.getNearbyStores(
        lat: lat,
        lng: lng,
        distanceKm: distanceKm,
        radius: radius,
        page: page,
        limit: limit,
        search: search,
        city: city,
        district: district,
        isFavorite: isFavorite,
      );
      final entities = response.items.map((m) => m.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, StoreDetailEntity>> getStoreDetail(
    String storeId,
  ) async {
    try {
      final model = await remoteDataSource.getStoreDetail(storeId);
      return Right(model.toEntity());
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, StoreFullDetailEntity>> getStoreFullDetail({
    required String storeId,
  }) async {
    try {
      final model = await remoteDataSource.getStoreFullDetail(storeId);
      return Right(model.toEntity());
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, List<ServiceCategoryEntity>>> getStoreCategories(
    String storeId,
  ) async {
    try {
      final models = await remoteDataSource.getStoreCategories(storeId);
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, List<ServiceEntity>>> getStoreServices(
    String storeId, {
    String? categoryId,
    String? search,
  }) async {
    try {
      final models = await remoteDataSource.getStoreServices(
        storeId,
        categoryId: categoryId,
        search: search,
      );
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, List<StaffEntity>>> getStoreStaff(
    String storeId, {
    String? serviceId,
  }) async {
    try {
      final models = await remoteDataSource.getStoreStaff(
        storeId,
        serviceId: serviceId,
      );
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, StoreGalleryEntity>> getStoreGallery(
    String storeId, {
    String category = 'ALL',
  }) async {
    try {
      final model = await remoteDataSource.getStoreGallery(
        storeId,
        category: category,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, ScheduleGridEntity>> getStoreScheduleGrid({
    required String storeId,
    required String date,
    String? staffProfileId,
  }) async {
    try {
      final model = await remoteDataSource.getStoreScheduleGrid(
        storeId: storeId,
        date: date,
        staffProfileId: staffProfileId,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }
}
