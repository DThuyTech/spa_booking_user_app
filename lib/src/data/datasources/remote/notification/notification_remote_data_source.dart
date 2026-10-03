import 'package:spa_booking/src/core/network/network_client.dart';
import 'package:spa_booking/src/data/model/notification/notification_model.dart';

abstract interface class NotificationRemoteDataSource {
  Future<int> getUnreadCount();

  Future<NotificationListResponseModel> getNotifications({
    int page = 1,
    int limit = 20,
    String? status,
    String? type,
  });

  Future<bool> markAsRead(String notificationId);

  Future<int> markAllAsRead();
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final NetworkClient _client;

  const NotificationRemoteDataSourceImpl(this._client);

  @override
  Future<int> getUnreadCount() async {
    final response = await _client.get<Map<String, dynamic>>(
      '/customer/notifications/unread-count',
    );
    final data = response.data;
    if (data != null) {
      final payload = (data['data'] as Map<String, dynamic>?) ?? data;
      return (payload['unreadCount'] as num?)?.toInt() ?? 0;
    }
    return 0;
  }

  @override
  Future<NotificationListResponseModel> getNotifications({
    int page = 1,
    int limit = 20,
    String? status,
    String? type,
  }) async {
    final queryParams = <String, dynamic>{
      'page': page,
      'limit': limit,
    };
    if (status != null && status.isNotEmpty && status != 'ALL') {
      queryParams['status'] = status;
    }
    if (type != null && type.isNotEmpty && type != 'ALL') {
      queryParams['type'] = type;
    }

    final response = await _client.get<Map<String, dynamic>>(
      '/customer/notifications',
      queryParameters: queryParams,
    );

    final data = response.data;
    if (data != null) {
      final payload = (data['data'] as Map<String, dynamic>?) ?? data;
      return NotificationListResponseModel.fromJson(payload);
    }
    return const NotificationListResponseModel();
  }

  @override
  Future<bool> markAsRead(String notificationId) async {
    final response = await _client.patch<Map<String, dynamic>>(
      '/customer/notifications/$notificationId/read',
    );
    final data = response.data;
    if (data != null) {
      final payload = (data['data'] as Map<String, dynamic>?) ?? data;
      return payload['isRead'] as bool? ?? true;
    }
    return true;
  }

  @override
  Future<int> markAllAsRead() async {
    final response = await _client.patch<Map<String, dynamic>>(
      '/customer/notifications/read-all',
    );
    final data = response.data;
    if (data != null) {
      final payload = (data['data'] as Map<String, dynamic>?) ?? data;
      return (payload['updatedCount'] as num?)?.toInt() ?? 0;
    }
    return 0;
  }
}
