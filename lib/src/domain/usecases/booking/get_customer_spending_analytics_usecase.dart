import 'package:fpdart/fpdart.dart';
import '../../../core/error/failure.dart';
import '../../../data/model/analytics/customer_spending_analytics_model.dart';
import '../../repositories/booking/booking_repository.dart';

class GetCustomerSpendingAnalyticsUseCase {
  final BookingRepository _repository;

  const GetCustomerSpendingAnalyticsUseCase(this._repository);

  Future<Either<Failure, CustomerSpendingAnalyticsModel>> call({
    String? from,
    String? to,
    String? period,
    String? storeId,
  }) {
    return _repository.getSpendingAnalytics(
      from: from,
      to: to,
      period: period,
      storeId: storeId,
    );
  }
}
