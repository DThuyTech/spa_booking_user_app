import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/store/store_gallery_entity.dart';
import '../../repositories/store/store_repository.dart';

class GetStoreGalleryUseCase {
  final StoreRepository repository;

  const GetStoreGalleryUseCase(this.repository);

  Future<Either<Failure, StoreGalleryEntity>> call(
    String storeId, {
    String category = 'ALL',
  }) {
    return repository.getStoreGallery(storeId, category: category);
  }
}
