import 'package:spa_booking/src/app/session/session_manager.dart';
import 'package:spa_booking/src/core/network/auth/token_pair.dart';
import 'package:spa_booking/src/domain/usecases/auth/register_usecase.dart';
import 'package:spa_booking/src/presentation/bloc/auth_session/auth_session_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_event.dart';
import 'register_state.dart';

export 'register_event.dart';
export 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;
  final SessionManager sessionManager;
  final AuthSessionBloc? authSessionBloc;

  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  RegisterBloc({
    required this.registerUseCase,
    required this.sessionManager,
    this.authSessionBloc,
  }) : super(const RegisterState()) {
    on<RegisterFullNameChanged>((event, emit) {
      emit(state.copyWith(fullName: event.fullName));
    });

    on<RegisterIdentifierChanged>((event, emit) {
      emit(state.copyWith(identifier: event.identifier.trim()));
    });

    on<RegisterPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<RegisterConfirmPasswordChanged>((event, emit) {
      emit(state.copyWith(confirmPassword: event.confirmPassword));
    });

    on<RegisterSubmitted>(_onSubmitted);
  }

  Future<void> _onSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    if (state.isLoading) return;

    final email = state.identifier.trim();
    final password = state.password;
    final confirmPassword = state.confirmPassword;

    if (email.isEmpty) {
      emit(
        state.copyWith(
          status: RegisterStatus.failure,
          errorMessage: () => 'Email cannot be empty.',
        ),
      );
      return;
    }

    if (!_emailRegex.hasMatch(email)) {
      emit(
        state.copyWith(
          status: RegisterStatus.failure,
          errorMessage: () => 'Please enter a valid email address.',
        ),
      );
      return;
    }

    if (password.length < 8) {
      emit(
        state.copyWith(
          status: RegisterStatus.failure,
          errorMessage: () => 'Password must be at least 8 characters long.',
        ),
      );
      return;
    }

    if (confirmPassword.isNotEmpty && confirmPassword != password) {
      emit(
        state.copyWith(
          status: RegisterStatus.failure,
          errorMessage: () => 'Passwords do not match.',
        ),
      );
      return;
    }

    emit(
      state.copyWith(status: RegisterStatus.loading, errorMessage: () => null),
    );

    final result = await registerUseCase(
      email: email,
      password: password,
      fullName: state.fullName,
    );

    await result.fold(
      (failure) async {
        emit(
          state.copyWith(
            status: RegisterStatus.failure,
            errorMessage: () => failure.message,
          ),
        );
      },
      (session) async {
        await sessionManager.login(
          tokens: TokenPair(
            accessToken: session.accessToken,
            refreshToken: session.refreshToken,
          ),
          userId: session.user.id,
          role: session.user.role.value,
        );

        authSessionBloc?.add(
          AuthSessionLoggedIn(
            user: session.user,
            tokens: TokenPair(
              accessToken: session.accessToken,
              refreshToken: session.refreshToken,
            ),
          ),
        );

        emit(
          state.copyWith(
            status: RegisterStatus.success,
            authSession: () => session,
          ),
        );
      },
    );
  }
}
