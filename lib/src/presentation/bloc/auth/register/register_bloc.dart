import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_booking/src/app/session/session_manager.dart';
import 'package:spa_booking/src/core/network/auth/token_pair.dart';
import 'package:spa_booking/src/domain/usecases/auth/register_usecase.dart';
import 'package:spa_booking/src/domain/usecases/auth/send_register_otp_usecase.dart';
import 'package:spa_booking/src/presentation/bloc/auth_session/auth_session_bloc.dart';
import 'register_event.dart';
import 'register_state.dart';

export 'register_event.dart';
export 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;
  final SendRegisterOtpUseCase? sendRegisterOtpUseCase;
  final SessionManager sessionManager;
  final AuthSessionBloc? authSessionBloc;

  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  RegisterBloc({
    required this.registerUseCase,
    this.sendRegisterOtpUseCase,
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
    on<ErrorCleared>(_onErrorCleared);
  }

  Future<void> _onErrorCleared(
    ErrorCleared event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(errorMessage: () => null));
  }

  Future<void> _onSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    if (state.isLoading) return;

    final fullName = state.fullName.trim();
    if (fullName.isEmpty) {
      emit(
        state.copyWith(
          status: RegisterStatus.failure,
          errorMessage: () => 'Vui lòng nhập Họ và tên.',
        ),
      );
      return;
    }

    final identifier = state.identifier.trim();
    if (identifier.isEmpty) {
      emit(
        state.copyWith(
          status: RegisterStatus.failure,
          errorMessage: () => 'Vui lòng nhập Email hoặc Số điện thoại.',
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
          status: RegisterStatus.failure,
          errorMessage: () => 'Email hoặc Số điện thoại không hợp lệ.',
        ),
      );
      return;
    }

    final password = state.password.trim();
    if (password.isNotEmpty && password.length < 6) {
      emit(
        state.copyWith(
          status: RegisterStatus.failure,
          errorMessage: () => 'Mật khẩu phải có ít nhất 6 ký tự.',
        ),
      );
      return;
    }

    emit(
      state.copyWith(status: RegisterStatus.loading, errorMessage: () => null),
    );

    // Prefer OTP registration flow if sendRegisterOtpUseCase is provided
    if (sendRegisterOtpUseCase != null) {
      final result = await sendRegisterOtpUseCase!(
        email: isEmail ? identifier : null,
        phoneNumber: !isEmail ? identifier : null,
      );

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              status: RegisterStatus.failure,
              errorMessage: () => failure.message,
            ),
          );
        },
        (otpResult) {
          emit(
            state.copyWith(
              status: RegisterStatus.success,
              otpResult: () => otpResult,
            ),
          );
        },
      );
      return;
    }

    // Fallback password registration
    final confirmPassword = state.confirmPassword;

    if (password.length < 8) {
      emit(
        state.copyWith(
          status: RegisterStatus.failure,
          errorMessage: () => 'Mật khẩu phải có ít nhất 8 ký tự.',
        ),
      );
      return;
    }

    if (confirmPassword.isNotEmpty && confirmPassword != password) {
      emit(
        state.copyWith(
          status: RegisterStatus.failure,
          errorMessage: () => 'Mật khẩu xác nhận không khớp.',
        ),
      );
      return;
    }

    final result = await registerUseCase(
      email: identifier,
      password: password,
      fullName: fullName,
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
