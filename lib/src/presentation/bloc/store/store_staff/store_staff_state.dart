import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/entities/store/staff_entity.dart';

part 'store_staff_state.freezed.dart';

enum StoreStaffStatus { initial, loading, loaded, failure }

@freezed
abstract class StoreStaffState with _$StoreStaffState {
  const StoreStaffState._();

  const factory StoreStaffState({
    @Default(StoreStaffStatus.initial) StoreStaffStatus status,
    @Default([]) List<StaffEntity> staffList,
    Failure? failure,
  }) = _StoreStaffState;

  bool get isInitial => status == StoreStaffStatus.initial;
  bool get isLoading => status == StoreStaffStatus.loading;
  bool get isLoaded => status == StoreStaffStatus.loaded;
  bool get isFailure => status == StoreStaffStatus.failure;
}
