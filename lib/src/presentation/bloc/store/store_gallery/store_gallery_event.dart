import 'package:equatable/equatable.dart';

sealed class StoreGalleryEvent extends Equatable {
  const StoreGalleryEvent();

  @override
  List<Object?> get props => [];
}

class FetchStoreGalleryEvent extends StoreGalleryEvent {
  final String storeId;
  final String category;

  const FetchStoreGalleryEvent({required this.storeId, this.category = 'ALL'});

  @override
  List<Object?> get props => [storeId, category];
}

class FilterGalleryCategoryEvent extends StoreGalleryEvent {
  final String category;

  const FilterGalleryCategoryEvent(this.category);

  @override
  List<Object?> get props => [category];
}
