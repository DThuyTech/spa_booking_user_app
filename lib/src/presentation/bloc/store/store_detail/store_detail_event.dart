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
