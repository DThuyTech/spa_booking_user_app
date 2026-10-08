import '../../../domain/entities/auth/user.dart';
import 'package:equatable/equatable.dart';

enum ProfileStatus {
  initial,
  loading,
  success,
  failure,
  loggingOut,
  loggedOut,
  needsProfileSetup,
  deletingAccount,
  accountDeleted,
}

typedef ProfileStatusEnum = ProfileStatus;

class ProfileState extends Equatable {
  final ProfileStatus status;
  final User? user;
  final String? errorMessage;
  final int upcomingCount;
  final int completedCount;
  final int cancelledCount;

  const ProfileState({
    this.status = ProfileStatus.initial,
    this.user,
    this.errorMessage,
    this.upcomingCount = 0,
    this.completedCount = 0,
    this.cancelledCount = 0,
  });

  bool get isLoading => status == ProfileStatus.loading;
  bool get isLoggingOut => status == ProfileStatus.loggingOut;
  bool get isLoggedOut => status == ProfileStatus.loggedOut;
  bool get needsProfileSetup => status == ProfileStatus.needsProfileSetup;
  bool get isDeletingAccount => status == ProfileStatus.deletingAccount;
  bool get isAccountDeleted => status == ProfileStatus.accountDeleted;

  ProfileState copyWith({
    ProfileStatus? status,
    User? Function()? user,
    String? Function()? errorMessage,
    int? upcomingCount,
    int? completedCount,
    int? cancelledCount,
  }) {
    return ProfileState(
      status: status ?? this.status,
      user: user != null ? user() : this.user,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
      upcomingCount: upcomingCount ?? this.upcomingCount,
      completedCount: completedCount ?? this.completedCount,
      cancelledCount: cancelledCount ?? this.cancelledCount,
    );
  }

  @override
  List<Object?> get props => [
    status,
    user,
    errorMessage,
    upcomingCount,
    completedCount,
    cancelledCount,
  ];
}
