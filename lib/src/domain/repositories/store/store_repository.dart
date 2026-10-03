import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/store/schedule_grid_entity.dart';
import '../../entities/store/service_category_entity.dart';
import '../../entities/store/service_entity.dart';
import '../../entities/store/staff_entity.dart';
import '../../entities/store/store_detail_entity.dart';
import '../../entities/store/store_entity.dart';
import '../../entities/store/store_gallery_entity.dart';

abstract interface class StoreRepository {
  Future<Either<Failure, List<StoreEntity>>> getStores({
    String? search,
    String? province,
    String? district,
    int page = 1,
    int limit = 10,
  });

  Future<Either<Failure, StoreDetailEntity>> getStoreDetail(String storeId);

  Future<Either<Failure, List<ServiceCategoryEntity>>> getStoreCategories(
    String storeId,
  );

  Future<Either<Failure, List<ServiceEntity>>> getStoreServices(
    String storeId, {
    String? categoryId,
    String? search,
  });

  Future<Either<Failure, List<StaffEntity>>> getStoreStaff(
    String storeId, {
    String? serviceId,
  });

  Future<Either<Failure, StoreGalleryEntity>> getStoreGallery(
    String storeId, {
    String category = 'ALL',
  });

  Future<Either<Failure, ScheduleGridEntity>> getStoreScheduleGrid({
    required String storeId,
    required String date,
    String? staffProfileId,
  });
}

