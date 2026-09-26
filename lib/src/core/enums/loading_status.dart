/// Standard status enum for UI loading workflows.
enum LoadingStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == LoadingStatus.initial;
  bool get isLoading => this == LoadingStatus.loading;
  bool get isSuccess => this == LoadingStatus.success;
  bool get isFailure => this == LoadingStatus.failure;
}
