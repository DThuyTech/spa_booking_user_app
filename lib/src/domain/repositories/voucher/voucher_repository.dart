import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/voucher/voucher_entity.dart';

abstract interface class VoucherRepository {
  Future<Either<Failure, List<VoucherEntity>>> getStoreVouchers(String storeId);

  Future<Either<Failure, List<VoucherEntity>>> getCustomerVouchers({
    String? storeId,
  });

  Future<Either<Failure, AppliedVoucherEntity>> applyVoucher({
    required String code,
    required String storeId,
    required int orderAmount,
  });
}
