import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/core/error/failure_mapper.dart';
import '../../../data/datasources/remote/voucher/voucher_remote_data_source.dart';
import '../../../domain/entities/voucher/voucher_entity.dart';
import '../../../domain/repositories/voucher/voucher_repository.dart';

class VoucherRepositoryImpl implements VoucherRepository {
  final VoucherRemoteDataSource remoteDataSource;

  const VoucherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<VoucherEntity>>> getStoreVouchers(String storeId) async {
    try {
      final models = await remoteDataSource.getStoreVouchers(storeId);
      final entities = models.map((m) => m.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, List<VoucherEntity>>> getCustomerVouchers({String? storeId}) async {
    try {
      final models = await remoteDataSource.getCustomerVouchers(storeId: storeId);
      final entities = models.map((m) => m.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }

  @override
  Future<Either<Failure, AppliedVoucherEntity>> applyVoucher({
    required String code,
    required String storeId,
    required int orderAmount,
  }) async {
    try {
      final model = await remoteDataSource.applyVoucher(
        code: code,
        storeId: storeId,
        orderAmount: orderAmount,
      );
      return Right(model.toEntity());
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }
}
