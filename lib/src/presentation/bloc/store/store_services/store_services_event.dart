import 'package:equatable/equatable.dart';

sealed class StoreServicesEvent extends Equatable {
  const StoreServicesEvent();

  @override
  List<Object?> get props => [];
}

class LoadCategoriesAndServicesEvent extends StoreServicesEvent {
  final String storeId;
  final String? categoryId;
  final String? search;

  const LoadCategoriesAndServicesEvent({
    required this.storeId,
    this.categoryId,
    this.search,
  });

  @override
  List<Object?> get props => [storeId, categoryId, search];
}

class SelectCategoryEvent extends StoreServicesEvent {
  final String? categoryId;

  const SelectCategoryEvent(this.categoryId);

  @override
  List<Object?> get props => [categoryId];
}

class SearchServicesEvent extends StoreServicesEvent {
  final String search;

  const SearchServicesEvent(this.search);

  @override
  List<Object?> get props => [search];
}
