import 'package:equatable/equatable.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

/// Triggers initial fetch of home data
final class HomeStarted extends HomeEvent {
  const HomeStarted();
}

/// User triggered pull-to-refresh
final class HomeRefreshed extends HomeEvent {
  const HomeRefreshed();
}

/// User triggered error retry
final class HomeRetried extends HomeEvent {
  const HomeRetried();
}

final class AddFavoriteStore extends HomeEvent {
  const AddFavoriteStore({required this.storeId});
  final String storeId;
}

final class RemoveFavoriteStore extends HomeEvent {
  const RemoveFavoriteStore({required this.storeId});
  final String storeId;
}

final class HomeCityChanged extends HomeEvent {
  const HomeCityChanged(this.city);
  final String city;

  @override
  List<Object?> get props => [city];
}
