import 'package:board_oi/src/domain/entities/home/greeting.dart';
import 'package:equatable/equatable.dart';

enum HomeStatus { initial, loading, loaded, refreshing, failure }

class HomeState extends Equatable {
  final HomeStatus status;
  final Greeting? greeting;
  final String? errorMessage;

  const HomeState({
    this.status = HomeStatus.initial,
    this.greeting,
    this.errorMessage,
  });

  bool get isInitial => status == HomeStatus.initial;
  bool get isLoading => status == HomeStatus.loading;
  bool get isLoaded => status == HomeStatus.loaded;
  bool get isRefreshing => status == HomeStatus.refreshing;
  bool get isFailure => status == HomeStatus.failure;
  bool get hasGreeting => greeting != null;

  HomeState copyWith({
    HomeStatus? status,
    Greeting? Function()? greeting,
    String? Function()? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      greeting: greeting != null ? greeting() : this.greeting,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, greeting, errorMessage];
}
