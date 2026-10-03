import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/core/error/failure_mapper.dart';
import 'package:spa_booking/src/data/datasources/remote/store/store_remote_data_source.dart';
import 'package:spa_booking/src/data/model/store/service_category_model.dart';
import 'package:spa_booking/src/data/model/store/service_model.dart';
import 'package:spa_booking/src/data/model/store/staff_model.dart';
import 'package:spa_booking/src/data/model/store/store_detail_model.dart';
import 'package:spa_booking/src/data/model/store/store_schedule_grid_model.dart';
import 'package:spa_booking/src/domain/entities/store/schedule_grid_entity.dart';
import 'package:spa_booking/src/data/model/store/store_model.dart';
import 'package:spa_booking/src/domain/entities/store/service_category_entity.dart';
import 'package:spa_booking/src/domain/entities/store/service_entity.dart';
import 'package:spa_booking/src/domain/entities/store/staff_entity.dart';
import 'package:spa_booking/src/domain/entities/store/store_detail_entity.dart';
import 'package:spa_booking/src/domain/entities/store/store_entity.dart';
import 'package:spa_booking/src/domain/entities/store/store_gallery_entity.dart';
import 'package:spa_booking/src/domain/repositories/store/store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreRemoteDataSource remoteDataSource;

  const StoreRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<StoreEntity>>> getStores({
    String? search,
    String? province,
    String? district,
    int page = 1,
    int limit = 10,
  }) async {
    try {
      final response = await remoteDataSource.getStores(
        search: search,
        province: province,
        district: district,
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
