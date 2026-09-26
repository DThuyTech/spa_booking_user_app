import 'package:equatable/equatable.dart';
import 'app_session_state.dart';

class AppSession extends Equatable {
  final AppSessionStatus status;
  final String? userId;
  final String? role;
  final bool isOnboardingCompleted;

  const AppSession({
    this.status = AppSessionStatus.unauthenticated,
    this.userId,
    this.role,
    this.isOnboardingCompleted = true,
  });

  const AppSession.unauthenticated()
    : this(status: AppSessionStatus.unauthenticated);

  const AppSession.authenticated({
    required String userId,
    String? role,
    bool isOnboardingCompleted = true,
  }) : this(
         status: AppSessionStatus.authenticated,
         userId: userId,
         role: role,
         isOnboardingCompleted: isOnboardingCompleted,
       );

  AppSession copyWith({
    AppSessionStatus? status,
    String? userId,
    String? role,
    bool? isOnboardingCompleted,
  }) {
    return AppSession(
      status: status ?? this.status,
      userId: userId ?? this.userId,
      role: role ?? this.role,
      isOnboardingCompleted:
          isOnboardingCompleted ?? this.isOnboardingCompleted,
    );
  }

  @override
  List<Object?> get props => [status, userId, role, isOnboardingCompleted];
}
