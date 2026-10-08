import 'package:equatable/equatable.dart';

sealed class StoreDetailEvent extends Equatable {
  const StoreDetailEvent();

  @override
  List<Object?> get props => [];
}

class FetchStoreDetailEvent extends StoreDetailEvent {
  final String storeId;

  const FetchStoreDetailEvent(this.storeId);

  @override
  List<Object?> get props => [storeId];
}

class ToggleStoreFavoriteEvent extends StoreDetailEvent {
  final String storeId;
  final bool isFavorite;

  const ToggleStoreFavoriteEvent({
    required this.storeId,
    required this.isFavorite,
  });

  @override
  List<Object?> get props => [storeId, isFavorite];
}
