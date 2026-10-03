import 'package:equatable/equatable.dart';

sealed class StoreListEvent extends Equatable {
  const StoreListEvent();

  @override
  List<Object?> get props => [];
}

class FetchStoresEvent extends StoreListEvent {
  final String? search;
  final String? province;
  final String? district;
  final bool isRefresh;

  const FetchStoresEvent({
    this.search,
    this.province,
    this.district,
    this.isRefresh = false,
  });

  @override
  List<Object?> get props => [search, province, district, isRefresh];
}

class LoadMoreStoresEvent extends StoreListEvent {
  const LoadMoreStoresEvent();
}
