import 'package:spa_booking/src/domain/entities/auth/auth_session_entity.dart';
import 'package:equatable/equatable.dart';

enum OtpStatus { initial, entering, verifying, verified, resending, failure }

enum OtpFlowType { login, register, phoneVerify, changeEmail, changePhone }

class OtpVerificationState extends Equatable {
  final String identifier;
  final String? name;
  final String? mockOtp;
  final OtpFlowType flowType;
  final String code;
  final int remainingSeconds;
  final OtpStatus status;
  final String? errorMessage;
  final AuthSessionEntity? authSession;

  const OtpVerificationState({
    this.identifier = '',
    this.name,
    this.mockOtp,
    this.flowType = OtpFlowType.login,
    this.code = '',
    this.remainingSeconds = 300,
    this.status = OtpStatus.initial,
    this.errorMessage,
    this.authSession,
  });

  // Backward compatibility alias for phone
  String get phone => identifier;

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

  String get maskedIdentifier {
    if (identifier.isEmpty) return '';
    if (identifier.contains('@')) {
      final parts = identifier.split('@');
      final name = parts[0];
      final domain = parts.length > 1 ? parts[1] : '';
      if (name.length <= 2) {
        return '$name***@$domain';
      }
      return '${name.substring(0, 2)}***${name.substring(name.length - 1)}@$domain';
    }
    final clean = identifier.startsWith('0')
        ? '+84 ${identifier.substring(1)}'
        : identifier;
    if (clean.length >= 7) {
      final suffix = clean.substring(clean.length - 3);
      return '+84 *** *** $suffix';
    }
    return clean;
  }

  String get maskedPhone => maskedIdentifier;

  OtpVerificationState copyWith({
    String? identifier,
    String? name,
    String? mockOtp,
    OtpFlowType? flowType,
    String? code,
    int? remainingSeconds,
    OtpStatus? status,
    String? Function()? errorMessage,
    AuthSessionEntity? Function()? authSession,
  }) {
    return OtpVerificationState(
      identifier: identifier ?? this.identifier,
      name: name ?? this.name,
      mockOtp: mockOtp ?? this.mockOtp,
      flowType: flowType ?? this.flowType,
      code: code ?? this.code,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      status: status ?? this.status,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
      authSession: authSession != null ? authSession() : this.authSession,
    );
  }

  @override
  List<Object?> get props => [
    identifier,
    name,
    mockOtp,
    flowType,
    code,
    remainingSeconds,
    status,
    errorMessage,
    authSession,
  ];
}
