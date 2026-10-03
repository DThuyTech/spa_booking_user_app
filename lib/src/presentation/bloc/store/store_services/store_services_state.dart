import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/entities/store/service_category_entity.dart';
import '../../../../domain/entities/store/service_entity.dart';

part 'store_services_state.freezed.dart';

enum StoreServicesStatus { initial, loading, loaded, failure }

@freezed
abstract class StoreServicesState with _$StoreServicesState {
  const StoreServicesState._();

  const factory StoreServicesState({
    @Default(StoreServicesStatus.initial) StoreServicesStatus status,
    @Default([]) List<ServiceCategoryEntity> categories,
    @Default([]) List<ServiceEntity> services,
    String? storeId,
    String? selectedCategoryId,
    @Default('') String searchQuery,
    Failure? failure,
  }) = _StoreServicesState;

  bool get isInitial => status == StoreServicesStatus.initial;
  bool get isLoading => status == StoreServicesStatus.loading;
  bool get isLoaded => status == StoreServicesStatus.loaded;
  bool get isFailure => status == StoreServicesStatus.failure;
}
