import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import '../../entities/voucher/voucher_entity.dart';
import '../../repositories/voucher/voucher_repository.dart';

class GetStoreVouchersUseCase {
  final VoucherRepository repository;

  const GetStoreVouchersUseCase(this.repository);

  Future<Either<Failure, List<VoucherEntity>>> call(String storeId) {
    return repository.getStoreVouchers(storeId);
  }
}

class GetCustomerVouchersUseCase {
  final VoucherRepository repository;

  const GetCustomerVouchersUseCase(this.repository);

  Future<Either<Failure, List<VoucherEntity>>> call({String? storeId}) {
    return repository.getCustomerVouchers(storeId: storeId);
  }
}

class ApplyVoucherUseCase {
  final VoucherRepository repository;

  const ApplyVoucherUseCase(this.repository);

  Future<Either<Failure, AppliedVoucherEntity>> call({
    required String code,
    required String storeId,
    required int orderAmount,
  }) {
    return repository.applyVoucher(
      code: code,
      storeId: storeId,
      orderAmount: orderAmount,
    );
  }
}
