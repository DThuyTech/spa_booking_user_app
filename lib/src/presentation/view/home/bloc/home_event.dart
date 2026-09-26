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
