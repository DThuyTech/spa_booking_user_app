import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:spa_booking/src/domain/entities/favorite/favorite_store_entity.dart';
import 'package:spa_booking/src/domain/entities/location/city_entity.dart';
import 'package:spa_booking/src/domain/usecases/favorite/get_favorites_usecase.dart';
import 'package:spa_booking/src/domain/usecases/location/get_cities_usecase.dart';
import '../../../core/error/failure.dart';
import '../../../domain/entities/home/greeting.dart';
import '../../../domain/entities/store/store_entity.dart';
import '../../../domain/usecases/home/get_greeting_usecase.dart';
import '../../../domain/usecases/store/get_recently_booked_stores_usecase.dart';
import '../../../domain/usecases/store/get_nearby_stores_usecase.dart';
import '../../../domain/usecases/store/get_stores_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetGreetingUseCase getGreetingUseCase;
  final GetStoresUseCase? getStoresUseCase;
  final GetFavoritesUseCase getFavoritesUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;
  final GetCitiesUseCase? getCitiesUseCase;
  final GetRecentlyBookedStoresUseCase? getRecentlyBookedStoresUseCase;
  final GetNearbyStoresUseCase? getNearbyStoresUseCase;

  HomeBloc({
    required this.getGreetingUseCase,
    this.getStoresUseCase,
    required this.getFavoritesUseCase,
    required this.toggleFavoriteUseCase,
    this.getCitiesUseCase,
    this.getRecentlyBookedStoresUseCase,
    this.getNearbyStoresUseCase,
  }) : super(const HomeState()) {
    on<HomeStarted>(_onStarted);
    on<HomeRefreshed>(_onRefreshed);
    on<HomeRetried>(_onRetried);
    on<AddFavoriteStore>(_onAddFavoriteStore);
    on<RemoveFavoriteStore>(_onRemoveFavoriteStore);
    on<HomeCityChanged>(_onCityChanged);
  }

  Future<void> _onStarted(HomeStarted event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading, errorMessage: () => null));

    // 1. Lấy danh sách thành phố (Ưu tiên từ Cache cục bộ)
    List<CityEntity> cities = state.cities;
    String selectedCity = state.selectedCity;
    if (getCitiesUseCase != null) {
      final citiesResult = await getCitiesUseCase!();
      citiesResult.fold((_) {}, (cList) => cities = cList);
      final savedCity = await getCitiesUseCase!.getSelectedCity();
      if (savedCity != null && savedCity.isNotEmpty) {
        selectedCity = savedCity;
      } else if (cities.isNotEmpty) {
        selectedCity = cities.first.name;
      }
    }

    final greetingFuture = getGreetingUseCase();
    final storesFuture = getStoresUseCase != null
        ? getStoresUseCase!(city: selectedCity)
        : Future.value(const Right<Failure, List<StoreEntity>>([]));
    final favoritesFuture = getFavoritesUseCase(page: 1, limit: 50);
    final bookedFuture = getRecentlyBookedStoresUseCase != null
        ? getRecentlyBookedStoresUseCase!()
        : Future.value(const Right<Failure, List<StoreEntity>>([]));
    final nearbyFuture = getNearbyStoresUseCase != null
        ? getNearbyStoresUseCase!(lat: 10.7769, lng: 106.7009, limit: 10)
        : Future.value(const Right<Failure, List<StoreEntity>>([]));

    final results = await Future.wait([
      greetingFuture,
      storesFuture,
      favoritesFuture,
      bookedFuture,
      nearbyFuture,
    ]);
    final greetingResult = results[0] as Either<Failure, Greeting>;
    final storesResult = results[1] as Either<Failure, List<StoreEntity>>;
    final favoritesResult =
        results[2] as Either<Failure, List<FavoriteStoreEntity>>;
    final bookedResult = results[3] as Either<Failure, List<StoreEntity>>;
    final nearbyResult = results[4] as Either<Failure, List<StoreEntity>>;

    _handleResults(
      greetingResult: greetingResult,
      storesResult: storesResult,
      favoritesResult: favoritesResult,
      bookedResult: bookedResult,
      nearbyResult: nearbyResult,
      cities: cities,
      selectedCity: selectedCity,
      emit: emit,
    );
  }

  Future<void> _onCityChanged(
    HomeCityChanged event,
    Emitter<HomeState> emit,
  ) async {
    if (state.selectedCity == event.city) return;

    emit(state.copyWith(selectedCity: event.city, status: HomeStatus.loading));

    // Lưu vào cache cục bộ
    if (getCitiesUseCase != null) {
      await getCitiesUseCase!.saveSelectedCity(event.city);
    }

    // Tải danh sách cửa hàng theo thành phố mới
    if (getStoresUseCase != null) {
      final result = await getStoresUseCase!(city: event.city);
      result.fold(
        (failure) => emit(
          state.copyWith(
            status: HomeStatus.failure,
            errorMessage: () => failure.message,
          ),
        ),
        (newStores) {
          final mergedFavIds = <String>{...state.favoriteStoreIds};
          for (final s in newStores) {
            if (s.isFavorite) {
              mergedFavIds.add(s.id);
            }
          }
          emit(
            state.copyWith(
              status: HomeStatus.loaded,
              stores: newStores,
              favoriteStoreIds: mergedFavIds,
            ),
          );
        },
      );
    }
  }

  Future<void> _onRefreshed(
    HomeRefreshed event,
    Emitter<HomeState> emit,
  ) async {
    // Avoid double refresh
    if (state.isRefreshing) return;

    emit(
      state.copyWith(status: HomeStatus.refreshing, errorMessage: () => null),
    );

    final greetingFuture = getGreetingUseCase();
    final storesFuture = getStoresUseCase != null
        ? getStoresUseCase!(city: state.selectedCity)
        : Future.value(const Right<Failure, List<StoreEntity>>([]));
    final favoritesFuture = getFavoritesUseCase(page: 1, limit: 50);
    final bookedFuture = getRecentlyBookedStoresUseCase != null
        ? getRecentlyBookedStoresUseCase!()
        : Future.value(const Right<Failure, List<StoreEntity>>([]));
    final nearbyFuture = getNearbyStoresUseCase != null
        ? getNearbyStoresUseCase!(lat: 10.7769, lng: 106.7009, limit: 10)
        : Future.value(const Right<Failure, List<StoreEntity>>([]));

    final results = await Future.wait([
      greetingFuture,
      storesFuture,
      favoritesFuture,
      bookedFuture,
      nearbyFuture,
    ]);
    final greetingResult = results[0] as Either<Failure, Greeting>;
    final storesResult = results[1] as Either<Failure, List<StoreEntity>>;
    final favoritesResult =
        results[2] as Either<Failure, List<FavoriteStoreEntity>>;
    final bookedResult = results[3] as Either<Failure, List<StoreEntity>>;
    final nearbyResult = results[4] as Either<Failure, List<StoreEntity>>;

    _handleResults(
      greetingResult: greetingResult,
      storesResult: storesResult,
      favoritesResult: favoritesResult,
      bookedResult: bookedResult,
      nearbyResult: nearbyResult,
      cities: state.cities,
      selectedCity: state.selectedCity,
      emit: emit,
    );
  }

  void _handleResults({
    required Either<Failure, Greeting> greetingResult,
    required Either<Failure, List<StoreEntity>> storesResult,
    required Either<Failure, List<FavoriteStoreEntity>> favoritesResult,
    required Either<Failure, List<StoreEntity>> bookedResult,
    required Either<Failure, List<StoreEntity>> nearbyResult,
    required List<CityEntity> cities,
    required String selectedCity,
    required Emitter<HomeState> emit,
  }) {
    Greeting? greeting = state.greeting;
    List<StoreEntity> stores = state.stores;
    List<StoreEntity> nearbyStores = state.nearbyStores;
    List<StoreEntity> recentlyBookedStores = state.recentlyBookedStores;
    Set<String> favoriteStoreIds = state.favoriteStoreIds;
    String? errorMessage;

    greetingResult.fold(
      (failure) => errorMessage = failure.message,
      (g) => greeting = g,
    );

    storesResult.fold((failure) {
      if (errorMessage == null && greeting == null) {
        errorMessage = failure.message;
      }
    }, (s) => stores = s);

    nearbyResult.fold((_) {}, (nStores) => nearbyStores = nStores);

    List<FavoriteStoreEntity> favoriteStores = state.favoriteStores;
    favoritesResult.fold((_) {}, (favs) {
      favoriteStores = favs;
      favoriteStoreIds = favs.map((e) => e.id).toSet();
    });

    bookedResult.fold((_) {}, (bStores) => recentlyBookedStores = bStores);

    // Merge store.isFavorite from GET /api/v1/public/stores & nearby
    final mergedFavIds = <String>{...favoriteStoreIds};
    for (final s in stores) {
      if (s.isFavorite) {
        mergedFavIds.add(s.id);
      }
    }
    for (final s in nearbyStores) {
      if (s.isFavorite) {
        mergedFavIds.add(s.id);
      }
    }
    for (final s in recentlyBookedStores) {
      if (s.isFavorite) {
        mergedFavIds.add(s.id);
      }
    }
    favoriteStoreIds = mergedFavIds;

    if (errorMessage != null && greeting == null && stores.isEmpty) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: () => errorMessage,
          cities: cities,
          selectedCity: selectedCity,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: HomeStatus.loaded,
          greeting: () => greeting,
          stores: stores,
          nearbyStores: nearbyStores,
          recentlyBookedStores: recentlyBookedStores,
          favoriteStores: favoriteStores,
          favoriteStoreIds: favoriteStoreIds,
          cities: cities,
          selectedCity: selectedCity,
          errorMessage: () => null,
        ),
      );
    }
  }

  Future<void> _onRetried(HomeRetried event, Emitter<HomeState> emit) async {
    await _onStarted(const HomeStarted(), emit);
  }

  Future<void> _onAddFavoriteStore(
    AddFavoriteStore event,
    Emitter<HomeState> emit,
  ) async {
    final updatedFavorites = Set<String>.from(state.favoriteStoreIds)
      ..add(event.storeId);
    final updatedStores = state.stores.map((s) {
      if (s.id == event.storeId) return s.copyWith(isFavorite: true);
      return s;
    }).toList();
    final updatedNearby = state.nearbyStores.map((s) {
      if (s.id == event.storeId) return s.copyWith(isFavorite: true);
      return s;
    }).toList();

    List<FavoriteStoreEntity> updatedFavStores = List.from(
      state.favoriteStores,
    );
    if (!updatedFavStores.any((s) => s.id == event.storeId)) {
      final foundStore = state.stores.cast<StoreEntity?>().firstWhere(
        (s) => s?.id == event.storeId,
        orElse: () => state.nearbyStores.cast<StoreEntity?>().firstWhere(
          (s) => s?.id == event.storeId,
          orElse: () => null,
        ),
      );
      if (foundStore != null) {
        updatedFavStores.insert(
          0,
          FavoriteStoreEntity(
            id: foundStore.id,
            name: foundStore.name,
            slug: foundStore.slug,
            averageRating: foundStore.rating,
            logoUrl: foundStore.logoUrl,
            coverImageUrl: foundStore.coverUrl,
            address: foundStore.address,
            phoneNumber: foundStore.phoneNumber,
            isFavorite: true,
          ),
        );
      }
    }

    emit(
      state.copyWith(
        favoriteStoreIds: updatedFavorites,
        stores: updatedStores,
        nearbyStores: updatedNearby,
        favoriteStores: updatedFavStores,
      ),
    );

    final result = await toggleFavoriteUseCase(
      storeId: event.storeId,
      isFavorite: true,
    );
    result.fold(
      (failure) {
        final rollbackFavorites = Set<String>.from(state.favoriteStoreIds)
          ..remove(event.storeId);
        final rollbackStores = state.stores.map((s) {
          if (s.id == event.storeId) return s.copyWith(isFavorite: false);
          return s;
        }).toList();
        final rollbackNearby = state.nearbyStores.map((s) {
          if (s.id == event.storeId) return s.copyWith(isFavorite: false);
          return s;
        }).toList();
        final rollbackFavStores = state.favoriteStores
            .where((s) => s.id != event.storeId)
            .toList();
        emit(
          state.copyWith(
            favoriteStoreIds: rollbackFavorites,
            stores: rollbackStores,
            nearbyStores: rollbackNearby,
            favoriteStores: rollbackFavStores,
          ),
        );
      },
      (isFav) {
        if (!isFav) {
          final rollbackFavorites = Set<String>.from(state.favoriteStoreIds)
            ..remove(event.storeId);
          final rollbackStores = state.stores.map((s) {
            if (s.id == event.storeId) return s.copyWith(isFavorite: false);
            return s;
          }).toList();
          final rollbackNearby = state.nearbyStores.map((s) {
            if (s.id == event.storeId) return s.copyWith(isFavorite: false);
            return s;
          }).toList();
          final rollbackFavStores = state.favoriteStores
              .where((s) => s.id != event.storeId)
              .toList();
          emit(
            state.copyWith(
              favoriteStoreIds: rollbackFavorites,
              stores: rollbackStores,
              nearbyStores: rollbackNearby,
              favoriteStores: rollbackFavStores,
            ),
          );
        }
      },
    );
  }

  Future<void> _onRemoveFavoriteStore(
    RemoveFavoriteStore event,
    Emitter<HomeState> emit,
  ) async {
    final updatedFavorites = Set<String>.from(state.favoriteStoreIds)
      ..remove(event.storeId);
    final updatedStores = state.stores.map((s) {
      if (s.id == event.storeId) return s.copyWith(isFavorite: false);
      return s;
    }).toList();
    final updatedNearby = state.nearbyStores.map((s) {
      if (s.id == event.storeId) return s.copyWith(isFavorite: false);
      return s;
    }).toList();
    final removedFav = state.favoriteStores
        .cast<FavoriteStoreEntity?>()
        .firstWhere((s) => s?.id == event.storeId, orElse: () => null);
    final updatedFavStores = state.favoriteStores
        .where((s) => s.id != event.storeId)
        .toList();

    emit(
      state.copyWith(
        favoriteStoreIds: updatedFavorites,
        stores: updatedStores,
        nearbyStores: updatedNearby,
        favoriteStores: updatedFavStores,
      ),
    );

    final result = await toggleFavoriteUseCase(
      storeId: event.storeId,
      isFavorite: false,
    );
    result.fold(
      (failure) {
        final rollbackFavorites = Set<String>.from(state.favoriteStoreIds)
          ..add(event.storeId);
        final rollbackStores = state.stores.map((s) {
          if (s.id == event.storeId) return s.copyWith(isFavorite: true);
          return s;
        }).toList();
        final rollbackNearby = state.nearbyStores.map((s) {
          if (s.id == event.storeId) return s.copyWith(isFavorite: true);
          return s;
        }).toList();
        final rollbackFavStores = removedFav != null
            ? [removedFav, ...state.favoriteStores]
            : state.favoriteStores;
        emit(
          state.copyWith(
            favoriteStoreIds: rollbackFavorites,
            stores: rollbackStores,
            nearbyStores: rollbackNearby,
            favoriteStores: rollbackFavStores,
          ),
        );
      },
      (isFav) {
        if (isFav) {
          final rollbackFavorites = Set<String>.from(state.favoriteStoreIds)
            ..add(event.storeId);
          final rollbackStores = state.stores.map((s) {
            if (s.id == event.storeId) return s.copyWith(isFavorite: true);
            return s;
          }).toList();
          final rollbackNearby = state.nearbyStores.map((s) {
            if (s.id == event.storeId) return s.copyWith(isFavorite: true);
            return s;
          }).toList();
          final rollbackFavStores = removedFav != null
              ? [removedFav, ...state.favoriteStores]
              : state.favoriteStores;
          emit(
            state.copyWith(
              favoriteStoreIds: rollbackFavorites,
              stores: rollbackStores,
              nearbyStores: rollbackNearby,
              favoriteStores: rollbackFavStores,
            ),
          );
        }
      },
    );
  }
}
