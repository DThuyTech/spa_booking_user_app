import 'package:equatable/equatable.dart';
import '../../../domain/entities/home/greeting.dart';
import '../../../domain/entities/store/store_entity.dart';

enum HomeStatus { initial, loading, loaded, refreshing, failure }

class HomeState extends Equatable {
  final HomeStatus status;
  final Greeting? greeting;
  final List<StoreEntity> stores;
  final String? errorMessage;

  const HomeState({
    this.status = HomeStatus.initial,
    this.greeting,
    this.stores = const [],
    this.errorMessage,
  });

  bool get isInitial => status == HomeStatus.initial;
  bool get isLoading => status == HomeStatus.loading;
  bool get isLoaded => status == HomeStatus.loaded;
  bool get isRefreshing => status == HomeStatus.refreshing;
  bool get isFailure => status == HomeStatus.failure;
  bool get hasGreeting => greeting != null;
  bool get hasStores => stores.isNotEmpty;

  HomeState copyWith({
    HomeStatus? status,
    Greeting? Function()? greeting,
    List<StoreEntity>? stores,
    String? Function()? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      greeting: greeting != null ? greeting() : this.greeting,
      stores: stores ?? this.stores,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, greeting, stores, errorMessage];
}
