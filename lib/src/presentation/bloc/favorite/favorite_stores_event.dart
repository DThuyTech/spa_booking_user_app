import 'package:equatable/equatable.dart';

sealed class FavoriteStoresEvent extends Equatable {
  const FavoriteStoresEvent();

  @override
  List<Object?> get props => [];
}

class FetchFavoriteStoresEvent extends FavoriteStoresEvent {
  final bool isRefresh;

  const FetchFavoriteStoresEvent({this.isRefresh = false});

  @override
  List<Object?> get props => [isRefresh];
}

class ToggleFavoriteStoreEvent extends FavoriteStoresEvent {
  final String storeId;
  final bool isFavorite;

  const ToggleFavoriteStoreEvent({
    required this.storeId,
    required this.isFavorite,
  });

  @override
  List<Object?> get props => [storeId, isFavorite];
}
