import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:board_oi/src/core/error/failure.dart';
import 'package:board_oi/src/domain/entities/home/greeting.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default(false) bool isRefreshing,
    Greeting? greeting,
    Failure? failure,
  }) = _HomeState;
}
