import 'package:board_oi/src/app/session/session_manager.dart';
import 'package:board_oi/src/core/network/auth/token_pair.dart';
import 'package:board_oi/src/domain/usecases/auth/login_usecase.dart';
import 'package:board_oi/src/presentation/bloc/auth_session/auth_session_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final SessionManager sessionManager;
  final AuthSessionBloc? authSessionBloc;

  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  LoginBloc({
    required this.loginUseCase,
    required this.sessionManager,
    this.authSessionBloc,
  }) : super(const LoginState()) {
    on<LoginIdentifierChanged>(_onIdentifierChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
    on<LoginErrorDismissed>(_onErrorDismissed);
  }

  void _onIdentifierChanged(
    LoginIdentifierChanged event,
    Emitter<LoginState> emit,
  ) {
    final cleaned = event.identifier.trim();
    emit(
      state.copyWith(
        identifier: cleaned,
        identifierError: () => null,
        status: LoginStatus.validating,
        errorMessage: () => null,
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        password: event.password,
        passwordError: () => null,
        status: LoginStatus.validating,
        errorMessage: () => null,
      ),
    );
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.isLoading) return;

    final identifier = state.identifier.trim();
    final password = state.password;

    if (identifier.isEmpty) {
      emit(
        state.copyWith(
          identifierError: () => 'Email cannot be empty.',
          status: LoginStatus.failure,
        ),
      );
      return;
    }

    if (!_emailRegex.hasMatch(identifier)) {
      emit(
        state.copyWith(
          identifierError: () => 'Please enter a valid email address.',
          status: LoginStatus.failure,
        ),
      );
      return;
    }

    if (password.isEmpty) {
      emit(
        state.copyWith(
          passwordError: () => 'Password cannot be empty.',
          status: LoginStatus.failure,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: LoginStatus.loading,
        errorMessage: () => null,
        identifierError: () => null,
        passwordError: () => null,
      ),
    );

    final result = await loginUseCase(email: identifier, password: password);

    await result.fold(
      (failure) async {
        emit(
          state.copyWith(
            status: LoginStatus.failure,
            errorMessage: () => failure.message,
          ),
        );
      },
      (session) async {
        // Persist session into central SessionManager
        await sessionManager.login(
          tokens: TokenPair(
            accessToken: session.accessToken,
            refreshToken: session.refreshToken,
          ),
          userId: session.user.id,
          role: session.user.role.value,
        );

        // Notify AuthSessionBloc of logged in state
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
            status: LoginStatus.success,
            authSession: () => session,
          ),
        );
      },
    );
  }

  void _onErrorDismissed(LoginErrorDismissed event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        errorMessage: () => null,
        identifierError: () => null,
        passwordError: () => null,
        status: LoginStatus.initial,
      ),
    );
  }
}
