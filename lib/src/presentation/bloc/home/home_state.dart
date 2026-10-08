import 'package:equatable/equatable.dart';
import '../../../domain/entities/favorite/favorite_store_entity.dart';
import '../../../domain/entities/home/greeting.dart';
import '../../../domain/entities/location/city_entity.dart';
import '../../../domain/entities/store/store_entity.dart';

enum HomeStatus { initial, loading, loaded, refreshing, failure }

class HomeState extends Equatable {
  final HomeStatus status;
  final Greeting? greeting;
  final List<StoreEntity> stores;
  final List<StoreEntity> nearbyStores;
  final List<StoreEntity> recentlyBookedStores;
  final List<FavoriteStoreEntity> favoriteStores;
  final Set<String> favoriteStoreIds;
  final List<CityEntity> cities;
  final String selectedCity;
  final String? errorMessage;

  const HomeState({
    this.status = HomeStatus.initial,
    this.greeting,
    this.stores = const [],
    this.nearbyStores = const [],
    this.recentlyBookedStores = const [],
    this.favoriteStores = const [],
    this.favoriteStoreIds = const {},
    this.cities = const [],
    this.selectedCity = 'Hồ Chí Minh',
    this.errorMessage,
  });

  bool get isInitial => status == HomeStatus.initial;
  bool get isLoading => status == HomeStatus.loading;
  bool get isLoaded => status == HomeStatus.loaded;
  bool get isRefreshing => status == HomeStatus.refreshing;
  bool get isFailure => status == HomeStatus.failure;
  bool get hasGreeting => greeting != null;
  bool get hasStores => stores.isNotEmpty;
  bool get hasNearbyStores => nearbyStores.isNotEmpty;
  bool get hasRecentlyBookedStores => recentlyBookedStores.isNotEmpty;
  bool get hasFavoriteStores => favoriteStores.isNotEmpty;

  HomeState copyWith({
    HomeStatus? status,
    Greeting? Function()? greeting,
    List<StoreEntity>? stores,
    List<StoreEntity>? nearbyStores,
    List<StoreEntity>? recentlyBookedStores,
    List<FavoriteStoreEntity>? favoriteStores,
    Set<String>? favoriteStoreIds,
    List<CityEntity>? cities,
    String? selectedCity,
    String? Function()? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      greeting: greeting != null ? greeting() : this.greeting,
      stores: stores ?? this.stores,
      nearbyStores: nearbyStores ?? this.nearbyStores,
      recentlyBookedStores: recentlyBookedStores ?? this.recentlyBookedStores,
      favoriteStores: favoriteStores ?? this.favoriteStores,
      favoriteStoreIds: favoriteStoreIds ?? this.favoriteStoreIds,
      cities: cities ?? this.cities,
      selectedCity: selectedCity ?? this.selectedCity,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    greeting,
    stores,
    nearbyStores,
    recentlyBookedStores,
    favoriteStores,
    favoriteStoreIds,
    cities,
    selectedCity,
    errorMessage,
  ];
}
