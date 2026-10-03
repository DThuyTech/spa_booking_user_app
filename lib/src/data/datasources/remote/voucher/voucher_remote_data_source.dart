import 'package:spa_booking/src/core/network/network_client.dart';
import 'package:spa_booking/src/data/model/voucher/voucher_model.dart';

abstract interface class VoucherRemoteDataSource {
  Future<List<VoucherModel>> getStoreVouchers(String storeId);

  Future<List<VoucherModel>> getCustomerVouchers({String? storeId});

  Future<AppliedVoucherModel> applyVoucher({
    required String code,
    required String storeId,
    required int orderAmount,
  });
}

class VoucherRemoteDataSourceImpl implements VoucherRemoteDataSource {
  final NetworkClient _client;

  const VoucherRemoteDataSourceImpl(this._client);

  @override
  Future<List<VoucherModel>> getStoreVouchers(String storeId) async {
    final response = await _client.get<dynamic>(
      '/public/stores/$storeId/vouchers',
    );
    final data = response.data;
    if (data is List) {
      return data
          .map((e) => VoucherModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else if (data is Map && data['data'] is List) {
      return (data['data'] as List)
          .map((e) => VoucherModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  @override
  Future<List<VoucherModel>> getCustomerVouchers({String? storeId}) async {
    final queryParams = <String, dynamic>{};
    if (storeId != null && storeId.isNotEmpty) {
      queryParams['storeId'] = storeId;
    }

    final response = await _client.get<dynamic>(
      '/customer/vouchers',
      queryParameters: queryParams,
    );
    final data = response.data;
    if (data is List) {
      return data
          .map((e) => VoucherModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } else if (data is Map && data['data'] is List) {
      return (data['data'] as List)
          .map((e) => VoucherModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  @override
  Future<AppliedVoucherModel> applyVoucher({
    required String code,
    required String storeId,
    required int orderAmount,
  }) async {
    final response = await _client.post<Map<String, dynamic>>(
      '/customer/vouchers/apply',
      data: {'code': code, 'storeId': storeId, 'orderAmount': orderAmount},
    );

    final data = response.data;
    if (data != null) {
      final payload = (data['data'] as Map<String, dynamic>?) ?? data;
      return AppliedVoucherModel.fromJson(payload);
    }
    throw const FormatException('Empty response received for apply voucher');
  }
}
