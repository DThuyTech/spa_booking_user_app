import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_booking/src/domain/usecases/auth/change_contact_usecase.dart';
import 'package:spa_booking/src/domain/usecases/auth/login_with_otp_usecase.dart';
import 'package:spa_booking/src/domain/usecases/auth/register_with_otp_usecase.dart';
import 'package:spa_booking/src/domain/usecases/auth/request_otp_usecase.dart';
import 'package:spa_booking/src/domain/usecases/auth/send_login_otp_usecase.dart';
import 'package:spa_booking/src/domain/usecases/auth/send_register_otp_usecase.dart';
import 'package:spa_booking/src/domain/usecases/auth/verify_otp_usecase.dart';
import 'otp_verification_event.dart';
import 'otp_verification_state.dart';

class OtpVerificationBloc
    extends Bloc<OtpVerificationEvent, OtpVerificationState> {
  final VerifyOtpUseCase verifyOtpUseCase;
  final RequestOtpUseCase requestOtpUseCase;
  final LoginWithOtpUseCase? loginWithOtpUseCase;
  final RegisterWithOtpUseCase? registerWithOtpUseCase;
  final SendLoginOtpUseCase? sendLoginOtpUseCase;
  final SendRegisterOtpUseCase? sendRegisterOtpUseCase;
  final ChangeContactUseCase? changeContactUseCase;

  Timer? _timer;

  OtpVerificationBloc({
    required this.verifyOtpUseCase,
    required this.requestOtpUseCase,
    this.loginWithOtpUseCase,
    this.registerWithOtpUseCase,
    this.sendLoginOtpUseCase,
    this.sendRegisterOtpUseCase,
    this.changeContactUseCase,
  }) : super(const OtpVerificationState()) {
    on<OtpStarted>(_onStarted);
    on<OtpDigitChanged>(_onDigitChanged);
    on<OtpSubmitted>(_onSubmitted);
    on<OtpResendRequested>(_onResendRequested);
    on<OtpTimerTicked>(_onTimerTicked);
    on<OtpErrorDismissed>(_onErrorDismissed);
  }

  void _startTimer(int seconds) {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final newRemaining = state.remainingSeconds - 1;
      if (newRemaining <= 0) {
        timer.cancel();
        add(const OtpTimerTicked(0));
      } else {
        add(OtpTimerTicked(newRemaining));
      }
    });
  }

  void _onStarted(OtpStarted event, Emitter<OtpVerificationState> emit) {
    emit(
      state.copyWith(
        identifier: event.identifier,
        name: event.name,
        mockOtp: event.mockOtp,
        flowType: event.flowType,
        remainingSeconds: event.initialCountdownSeconds,
        status: OtpStatus.entering,
        errorMessage: () => null,
      ),
    );
    _startTimer(event.initialCountdownSeconds);
  }

  void _onDigitChanged(
    OtpDigitChanged event,
    Emitter<OtpVerificationState> emit,
  ) {
    final sanitized = event.code.replaceAll(RegExp(r'[^0-9]'), '');
    final trimmed = sanitized.length > 6
        ? sanitized.substring(0, 6)
        : sanitized;

    emit(
      state.copyWith(
        code: trimmed,
        status: OtpStatus.entering,
        errorMessage: () => null,
      ),
    );

    // Auto-submit when all 6 digits are provided
    if (trimmed.length == 6) {
      add(const OtpSubmitted());
    }
  }

  Future<void> _onSubmitted(
    OtpSubmitted event,
    Emitter<OtpVerificationState> emit,
  ) async {
    // Double tap & validity guard
    if (state.isVerifying) return;
    if (state.code.length != 6) return;

    if (state.isExpired) {
      emit(
        state.copyWith(
          status: OtpStatus.failure,
          errorMessage: () =>
              'Mã xác thực OTP đã hết hạn. Vui lòng bấm gửi lại mã mới.',
        ),
      );
      return;
    }

    emit(state.copyWith(status: OtpStatus.verifying, errorMessage: () => null));

    final id = state.identifier.trim();
    final isEmail = id.contains('@');

    switch (state.flowType) {
      case OtpFlowType.login:
        if (loginWithOtpUseCase != null) {
          final result = await loginWithOtpUseCase!(
            identifier: id,
            otp: state.code,
          );
          result.fold(
            (failure) {
              emit(
                state.copyWith(
                  status: OtpStatus.failure,
                  errorMessage: () => failure.message,
                ),
              );
            },
            (session) {
              _timer?.cancel();
              emit(
                state.copyWith(
                  status: OtpStatus.verified,
                  authSession: () => session,
                ),
              );
            },
          );
          return;
        }
        break;

      case OtpFlowType.register:
        if (registerWithOtpUseCase != null) {
          final result = await registerWithOtpUseCase!(
            email: isEmail ? id : null,
            phoneNumber: !isEmail ? id : null,
            name: state.name ?? '',
            otp: state.code,
          );
          result.fold(
            (failure) {
              emit(
                state.copyWith(
                  status: OtpStatus.failure,
                  errorMessage: () => failure.message,
                ),
              );
            },
            (session) {
              _timer?.cancel();
              emit(
                state.copyWith(
                  status: OtpStatus.verified,
                  authSession: () => session,
                ),
              );
            },
          );
          return;
        }
        break;

      case OtpFlowType.changeEmail:
        if (changeContactUseCase != null) {
          final result = await changeContactUseCase!.verifyChangeEmail(
            newEmail: id,
            otp: state.code,
          );
          result.fold(
            (failure) {
              emit(
                state.copyWith(
                  status: OtpStatus.failure,
                  errorMessage: () => failure.message,
                ),
              );
            },
            (user) {
              _timer?.cancel();
              emit(state.copyWith(status: OtpStatus.verified));
            },
          );
          return;
        }
        break;

      case OtpFlowType.changePhone:
        if (changeContactUseCase != null) {
          final result = await changeContactUseCase!.verifyChangePhone(
            newPhone: id,
            otp: state.code,
          );
          result.fold(
            (failure) {
              emit(
                state.copyWith(
                  status: OtpStatus.failure,
                  errorMessage: () => failure.message,
                ),
              );
            },
            (user) {
              _timer?.cancel();
              emit(state.copyWith(status: OtpStatus.verified));
            },
          );
          return;
        }
        break;

      case OtpFlowType.phoneVerify:
        break;
    }

    // Fallback logic
    final result = await verifyOtpUseCase(phone: id, code: state.code);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: OtpStatus.failure,
            errorMessage: () => failure.message,
          ),
        );
      },
      (session) {
        _timer?.cancel();
        emit(
          state.copyWith(
            status: OtpStatus.verified,
            authSession: () => session,
          ),
        );
      },
    );
  }

  Future<void> _onResendRequested(
    OtpResendRequested event,
    Emitter<OtpVerificationState> emit,
  ) async {
    if (!state.canResend) return;

    emit(state.copyWith(status: OtpStatus.resending, errorMessage: () => null));

    final id = state.identifier.trim();
    final isEmail = id.contains('@');

    switch (state.flowType) {
      case OtpFlowType.login:
        if (sendLoginOtpUseCase != null) {
          final result = await sendLoginOtpUseCase!(identifier: id);
          result.fold(
            (failure) {
              emit(
                state.copyWith(
                  status: OtpStatus.failure,
                  errorMessage: () => failure.message,
                ),
              );
            },
            (otpResult) {
              final seconds = otpResult.expiresInSeconds > 0
                  ? otpResult.expiresInSeconds
                  : 300;
              emit(
                state.copyWith(
                  code: '',
                  mockOtp: otpResult.otp,
                  remainingSeconds: seconds,
                  status: OtpStatus.entering,
                  errorMessage: () => null,
                ),
              );
              _startTimer(seconds);
            },
          );
          return;
        }
        break;

      case OtpFlowType.register:
        if (sendRegisterOtpUseCase != null) {
          final result = await sendRegisterOtpUseCase!(
            email: isEmail ? id : null,
            phoneNumber: !isEmail ? id : null,
          );
          result.fold(
            (failure) {
              emit(
                state.copyWith(
                  status: OtpStatus.failure,
                  errorMessage: () => failure.message,
                ),
              );
            },
            (otpResult) {
              final seconds = otpResult.expiresInSeconds > 0
                  ? otpResult.expiresInSeconds
                  : 300;
              emit(
                state.copyWith(
                  code: '',
                  mockOtp: otpResult.otp,
                  remainingSeconds: seconds,
                  status: OtpStatus.entering,
                  errorMessage: () => null,
                ),
              );
              _startTimer(seconds);
            },
          );
          return;
        }
        break;

      case OtpFlowType.changeEmail:
        if (changeContactUseCase != null) {
          final result = await changeContactUseCase!.requestChangeEmail(id);
          result.fold(
            (failure) {
              emit(
                state.copyWith(
                  status: OtpStatus.failure,
                  errorMessage: () => failure.message,
                ),
              );
            },
            (otpResult) {
              final seconds = otpResult.expiresInSeconds > 0
                  ? otpResult.expiresInSeconds
                  : 300;
              emit(
                state.copyWith(
                  code: '',
                  mockOtp: otpResult.otp,
                  remainingSeconds: seconds,
                  status: OtpStatus.entering,
                  errorMessage: () => null,
                ),
              );
              _startTimer(seconds);
            },
          );
          return;
        }
        break;

      case OtpFlowType.changePhone:
        if (changeContactUseCase != null) {
          final result = await changeContactUseCase!.requestChangePhone(id);
          result.fold(
            (failure) {
              emit(
                state.copyWith(
                  status: OtpStatus.failure,
                  errorMessage: () => failure.message,
                ),
              );
            },
            (otpResult) {
              final seconds = otpResult.expiresInSeconds > 0
                  ? otpResult.expiresInSeconds
                  : 300;
              emit(
                state.copyWith(
                  code: '',
                  mockOtp: otpResult.otp,
                  remainingSeconds: seconds,
                  status: OtpStatus.entering,
                  errorMessage: () => null,
                ),
              );
              _startTimer(seconds);
            },
          );
          return;
        }
        break;

      case OtpFlowType.phoneVerify:
        break;
    }

    final result = await requestOtpUseCase(id);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: OtpStatus.failure,
            errorMessage: () => failure.message,
          ),
        );
      },
      (otpResult) {
        final seconds = otpResult.expiresInSeconds > 0
            ? otpResult.expiresInSeconds
            : 300;
        emit(
          state.copyWith(
            code: '',
            mockOtp: otpResult.otp,
            remainingSeconds: seconds,
            status: OtpStatus.entering,
            errorMessage: () => null,
          ),
        );
        _startTimer(seconds);
      },
    );
  }

  void _onTimerTicked(
    OtpTimerTicked event,
    Emitter<OtpVerificationState> emit,
  ) {
    emit(state.copyWith(remainingSeconds: event.remainingSeconds));
  }

  void _onErrorDismissed(
    OtpErrorDismissed event,
    Emitter<OtpVerificationState> emit,
  ) {
    emit(state.copyWith(errorMessage: () => null, status: OtpStatus.entering));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
