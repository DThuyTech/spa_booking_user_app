import 'package:board_oi/src/domain/usecases/auth/request_otp_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RequestOtpUseCase requestOtpUseCase;

  static final RegExp _phoneRegex = RegExp(r'^(0|\+84)[0-9]{9}$');

  LoginBloc({required this.requestOtpUseCase})
    : super(const LoginState()) {
    on<LoginPhoneChanged>(_onPhoneChanged);
    on<LoginSubmitted>(_onSubmitted);
    on<LoginErrorDismissed>(_onErrorDismissed);
  }

  static String normalizePhone(String rawPhone) {
    final cleaned = rawPhone.replaceAll(RegExp(r'[\s\-]'), '');
    if (cleaned.startsWith('+84')) {
      return '0${cleaned.substring(3)}';
    }
    return cleaned;
  }

  static bool isPhoneValid(String rawPhone) {
    final cleaned = rawPhone.replaceAll(RegExp(r'[\s\-]'), '');
    return _phoneRegex.hasMatch(cleaned);
  }

  void _onPhoneChanged(LoginPhoneChanged event, Emitter<LoginState> emit) {
    final cleaned = event.phone.trim();
    final isValid = isPhoneValid(cleaned);

    emit(
      state.copyWith(
        phone: cleaned,
        isValid: isValid,
        phoneError: () => null,
        status: LoginStatus.validating,
        errorMessage: () => null,
      ),
    );
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    // Double-tap protection
    if (state.isLoading) return;

    final cleaned = state.phone.trim();
    if (!isPhoneValid(cleaned)) {
      emit(
        state.copyWith(
          isValid: false,
          phoneError: () => 'Invalid phone number. Must be 10 digits.',
          status: LoginStatus.failure,
        ),
      );
      return;
    }

    final normalized = normalizePhone(cleaned);

    emit(
      state.copyWith(
        status: LoginStatus.loading,
        errorMessage: () => null,
        phoneError: () => null,
      ),
    );

    final result = await requestOtpUseCase(normalized);

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: LoginStatus.failure,
          errorMessage: () => failure.message,
        ),
      ),
      (otpResult) => emit(
        state.copyWith(
          status: LoginStatus.success,
          otpResult: () => otpResult,
        ),
      ),
    );
  }

  void _onErrorDismissed(
    LoginErrorDismissed event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        errorMessage: () => null,
        phoneError: () => null,
        status: LoginStatus.initial,
      ),
    );
  }
}
