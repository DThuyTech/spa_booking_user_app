import 'dart:async';
import 'package:board_oi/src/domain/usecases/auth/request_otp_usecase.dart';
import 'package:board_oi/src/domain/usecases/auth/verify_otp_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'otp_verification_event.dart';
import 'otp_verification_state.dart';

class OtpVerificationBloc
    extends Bloc<OtpVerificationEvent, OtpVerificationState> {
  final VerifyOtpUseCase verifyOtpUseCase;
  final RequestOtpUseCase requestOtpUseCase;
  Timer? _timer;

  OtpVerificationBloc({
    required this.verifyOtpUseCase,
    required this.requestOtpUseCase,
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
        phone: event.phone,
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
              'Verification code has expired. Please request a new one.',
        ),
      );
      return;
    }

    emit(state.copyWith(status: OtpStatus.verifying, errorMessage: () => null));

    final result = await verifyOtpUseCase(phone: state.phone, code: state.code);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: OtpStatus.failure,
            errorMessage: () => 'Invalid verification code. Please try again.',
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

    final result = await requestOtpUseCase(state.phone);

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
