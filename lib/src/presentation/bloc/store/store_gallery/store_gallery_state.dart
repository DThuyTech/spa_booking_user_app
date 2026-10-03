import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/entities/store/store_gallery_entity.dart';

part 'store_gallery_state.freezed.dart';

enum StoreGalleryStatus { initial, loading, loaded, failure }

@freezed
abstract class StoreGalleryState with _$StoreGalleryState {
  const StoreGalleryState._();

  const factory StoreGalleryState({
    @Default(StoreGalleryStatus.initial) StoreGalleryStatus status,
    StoreGalleryEntity? gallery,
    @Default('ALL') String activeCategory,
    Failure? failure,
  }) = _StoreGalleryState;

  bool get isInitial => status == StoreGalleryStatus.initial;
  bool get isLoading => status == StoreGalleryStatus.loading;
  bool get isLoaded => status == StoreGalleryStatus.loaded;
  bool get isFailure => status == StoreGalleryStatus.failure;
}
