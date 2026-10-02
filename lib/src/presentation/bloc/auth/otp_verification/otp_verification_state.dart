import 'package:spa_booking/src/domain/entities/auth/auth_session_entity.dart';
import 'package:equatable/equatable.dart';

enum OtpStatus { initial, entering, verifying, verified, resending, failure }

class OtpVerificationState extends Equatable {
  final String phone;
  final String code;
  final int remainingSeconds;
  final OtpStatus status;
  final String? errorMessage;
  final AuthSessionEntity? authSession;

  const OtpVerificationState({
    this.phone = '',
    this.code = '',
    this.remainingSeconds = 300,
    this.status = OtpStatus.initial,
    this.errorMessage,
    this.authSession,
  });

  bool get isVerifying => status == OtpStatus.verifying;
  bool get isVerified => status == OtpStatus.verified;
  bool get isResending => status == OtpStatus.resending;
  bool get isFailure => status == OtpStatus.failure;
  bool get isExpired => remainingSeconds <= 0;
  bool get canResend => remainingSeconds <= 0 && !isResending && !isVerifying;
  bool get canSubmit => code.length == 6 && !isVerifying;

  String get formattedCountdown {
    final minutes = (remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (remainingSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  String get maskedPhone {
    if (phone.isEmpty) return '';
    final clean = phone.startsWith('0') ? '+84 ${phone.substring(1)}' : phone;
    if (clean.length >= 7) {
      final suffix = clean.substring(clean.length - 3);
      return '+84 *** *** $suffix';
    }
    return clean;
  }

  OtpVerificationState copyWith({
    String? phone,
    String? code,
    int? remainingSeconds,
    OtpStatus? status,
    String? Function()? errorMessage,
    AuthSessionEntity? Function()? authSession,
  }) {
    return OtpVerificationState(
      phone: phone ?? this.phone,
      code: code ?? this.code,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      status: status ?? this.status,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
      authSession: authSession != null ? authSession() : this.authSession,
    );
  }

  @override
  List<Object?> get props => [
    phone,
    code,
    remainingSeconds,
    status,
    errorMessage,
    authSession,
  ];
}
