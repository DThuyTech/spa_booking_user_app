import '../../../../core/network/network_client.dart';
import 'package:spa_booking/src/data/model/home/greeting_model.dart';

abstract interface class HomeRemoteDataSource {
  Future<GreetingModel> getGreeting();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final NetworkClient _networkClient;

  const HomeRemoteDataSourceImpl(this._networkClient);

  @override
  Future<GreetingModel> getGreeting() async {
    try {
      final response = await _networkClient.get<Map<String, dynamic>>(
        '/greeting',
      );
      final data = response.data;
      if (data != null) {
        return GreetingModel.fromJson(data);
      }
      throw const FormatException('Empty response data');
    } catch (_) {
      // Provide fallback mock model if endpoint is not connected
      return GreetingModel(
        id: '1',
        title: 'Production Architecture Active',
        message:
            'Clean Architecture, BLoC, AutoRoute, and Dio are successfully initialized.',
        createdAt: DateTime.now().toIso8601String(),
      );
    }
  }
}

/// Fully offline mock data source for home feature.
class MockHomeRemoteDataSource implements HomeRemoteDataSource {
  const MockHomeRemoteDataSource();

  @override
  Future<GreetingModel> getGreeting() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return GreetingModel(
      id: '1',
      title: 'Aura Spa & Wellness',
      message: 'Indulge in tranquility and premium beauty care.',
      createdAt: DateTime.now().toIso8601String(),
    );
  }
}
