import '../../../app/session/session_manager.dart';
import '../../../core/error/failure.dart';
import '../../../domain/usecases/auth/get_current_user.dart';
import '../../../domain/usecases/auth/logout_usecase.dart';
import '../../../domain/usecases/booking/get_customer_bookings_usecase.dart';
import '../auth_session/auth_session_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';

export 'profile_event.dart';
export 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetCurrentUser getCurrentUserUseCase;
  final LogoutUseCase logoutUseCase;
  final SessionManager sessionManager;
  final AuthSessionBloc? authSessionBloc;
  final GetCustomerBookingsUseCase? getCustomerBookingsUseCase;

  ProfileBloc({
    required this.getCurrentUserUseCase,
    required this.logoutUseCase,
    required this.sessionManager,
    this.authSessionBloc,
    this.getCustomerBookingsUseCase,
  }) : super(ProfileState(user: authSessionBloc?.state.user)) {
    on<ProfileStarted>(_onStarted);
    on<ProfileRefreshed>(_onRefreshed);
    on<ProfileLogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onStarted(
    ProfileStarted event,
    Emitter<ProfileState> emit,
  ) async {
    // If we already have a user in state/authSessionBloc, display it while fetching fresh data
    final cachedUser = authSessionBloc?.state.user ?? state.user;
    if (cachedUser != null) {
      emit(state.copyWith(user: () => cachedUser));
    } else {
      emit(state.copyWith(status: ProfileStatus.loading));
    }

    await _fetchUser(emit);
  }

  Future<void> _onRefreshed(
    ProfileRefreshed event,
    Emitter<ProfileState> emit,
  ) async {
    await _fetchUser(emit);
  }

  Future<void> _fetchUser(Emitter<ProfileState> emit) async {
    final result = await getCurrentUserUseCase();
    result.fold(
      (failure) {
        final isNotFound =
            failure is NotFoundFailure ||
            failure.message.contains('CUSTOMER_PROFILE_NOT_FOUND') ||
            failure.message.toLowerCase().contains(
              'customer_profile_not_found',
            ) ||
            failure.message.toLowerCase().contains('profile not found');

        if (isNotFound) {
          emit(
            state.copyWith(
              status: ProfileStatus.needsProfileSetup,
              errorMessage: () => failure.message,
            ),
          );
          return;
        }

        // If we already have user cached, keep displaying it gracefully
        if (state.user != null) {
          emit(state.copyWith(status: ProfileStatus.success));
        } else {
          emit(
            state.copyWith(
              status: ProfileStatus.failure,
              errorMessage: () => failure.message,
            ),
          );
        }
      },
      (user) {
        final existing = state.user;
        final mergedUser = user.copyWith(
          email: user.email.isNotEmpty ? user.email : existing?.email,
          phone: user.phone.isNotEmpty ? user.phone : existing?.phone,
        );
        final stats = mergedUser.bookingStats;
        emit(
          state.copyWith(
            status: ProfileStatus.success,
            user: () => mergedUser,
            errorMessage: () => null,
            upcomingCount: stats != null
                ? stats.upcomingBookings
                : state.upcomingCount,
            completedCount: stats != null
                ? stats.completedBookings
                : state.completedCount,
            cancelledCount: stats != null
                ? stats.cancelledBookings
                : state.cancelledCount,
          ),
        );
      },
    );

    if (getCustomerBookingsUseCase != null) {
      final bookingsResult = await getCustomerBookingsUseCase!();
      bookingsResult.fold((_) {}, (bookingData) {
        emit(
          state.copyWith(
            upcomingCount: bookingData.summary.upcoming,
            completedCount: bookingData.summary.past,
            cancelledCount: bookingData.summary.cancelled,
          ),
        );
      });
    }
  }

  Future<void> _onLogoutRequested(
    ProfileLogoutRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(status: ProfileStatus.loggingOut));
    try {
      await logoutUseCase();
    } catch (_) {
      // Ignore remote logout errors and continue clearing local credentials
    }

    await sessionManager.logout();
    authSessionBloc?.add(const LogoutRequested());
    emit(state.copyWith(status: ProfileStatus.loggedOut));
  }
}
