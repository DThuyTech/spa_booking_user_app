import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_booking/src/app/session/session_manager.dart';
import 'package:spa_booking/src/core/network/auth/token_pair.dart';
import 'package:spa_booking/src/domain/usecases/auth/login_usecase.dart';
import 'package:spa_booking/src/domain/usecases/auth/send_login_otp_usecase.dart';
import 'package:spa_booking/src/presentation/bloc/auth_session/auth_session_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final SendLoginOtpUseCase? sendLoginOtpUseCase;
  final SessionManager sessionManager;
  final AuthSessionBloc? authSessionBloc;

  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  LoginBloc({
    required this.loginUseCase,
    this.sendLoginOtpUseCase,
    required this.sessionManager,
    this.authSessionBloc,
  }) : super(const LoginState()) {
    on<LoginMethodChanged>(_onMethodChanged);
    on<LoginIdentifierChanged>(_onIdentifierChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
    on<LoginErrorDismissed>(_onErrorDismissed);
  }

  void _onMethodChanged(
    LoginMethodChanged event,
    Emitter<LoginState> emit,
  ) {
    if (state.loginMethod == event.method) return;
    emit(
      state.copyWith(
        loginMethod: event.method,
        identifierError: () => null,
        passwordError: () => null,
        errorMessage: () => null,
        status: LoginStatus.initial,
      ),
    );
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

    if (identifier.isEmpty) {
      emit(
        state.copyWith(
          identifierError: () => 'Vui lòng nhập Email hoặc Số điện thoại.',
          status: LoginStatus.failure,
        ),
      );
      return;
    }

    final isEmail = _emailRegex.hasMatch(identifier);
    final isPhone = RegExp(
      r'^\+?[0-9]{8,15}$',
    ).hasMatch(identifier.replaceAll(RegExp(r'[\s-]'), ''));

    if (!isEmail && !isPhone) {
      emit(
        state.copyWith(
          identifierError: () => 'Email hoặc Số điện thoại không hợp lệ.',
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

    // Branch 1: Login with OTP
    if (state.loginMethod == LoginMethod.otp) {
      if (sendLoginOtpUseCase != null) {
        final result = await sendLoginOtpUseCase!(identifier: identifier);
        result.fold(
          (failure) {
            emit(
              state.copyWith(
                status: LoginStatus.failure,
                errorMessage: () => failure.message,
              ),
            );
          },
          (otpResult) {
            emit(
              state.copyWith(
                status: LoginStatus.success,
                otpResult: () => otpResult,
                authSession: () => null,
              ),
            );
          },
        );
        return;
      }
    }

    // Branch 2: Login with Password
    final password = state.password;
    if (password.isEmpty) {
      emit(
        state.copyWith(
          passwordError: () => 'Vui lòng nhập mật khẩu.',
          status: LoginStatus.failure,
        ),
      );
      return;
    }

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
            status: LoginStatus.success,
            authSession: () => session,
            otpResult: () => null,
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
