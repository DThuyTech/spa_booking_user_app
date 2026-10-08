import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_booking/src/app/di/dependency_injection.dart';
import 'package:spa_booking/src/shared/design_system/components/navigation/app_app_bar.dart';
import 'package:spa_booking/src/shared/widgets/toast/app_toast.dart';
import 'package:spa_booking/src/presentation/bloc/auth/forgot_password/forgot_password_cubit.dart';
import '../../reset_password/view/reset_password_view.dart';
import '../body_view/forgot_password_otp_body_view.dart';

@RoutePage()
class ForgotPasswordOtpPage extends StatelessWidget {
  final String contact;
  final String? initialOtp;

  const ForgotPasswordOtpPage({
    super.key,
    required this.contact,
    this.initialOtp,
  });

  @override
  Widget build(BuildContext context) {
    return ForgotPasswordOtpView(contact: contact, initialOtp: initialOtp);
  }
}

class ForgotPasswordOtpView extends StatefulWidget {
  final String contact;
  final String? initialOtp;

  const ForgotPasswordOtpView({
    super.key,
    required this.contact,
    this.initialOtp,
  });

  @override
  State<ForgotPasswordOtpView> createState() => _ForgotPasswordOtpViewState();
}

class _ForgotPasswordOtpViewState extends State<ForgotPasswordOtpView> {
  late final ForgotPasswordCubit _cubit;
  String _otpCode = '';
  int _countdownSeconds = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _cubit = sl<ForgotPasswordCubit>();
    if (widget.initialOtp != null && widget.initialOtp!.isNotEmpty) {
      _otpCode = widget.initialOtp!;
    }
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() {
      _countdownSeconds = 60;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdownSeconds > 0) {
        setState(() {
          _countdownSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _cubit.close();
    super.dispose();
  }

  void _onVerify() {
    if (_otpCode.length != 6) {
      AppToast.warning(
        context,
        message: 'Vui lòng nhập đầy đủ 6 chữ số mã OTP',
      );
      return;
    }

    _cubit.verifyOtp(phone: widget.contact, otp: _otpCode);
  }

  void _onResend() {
    _startTimer();
    _cubit.sendOtp(widget.contact);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state.isFailure) {
            AppToast.error(
              context,
              message: state.errorMessage ?? 'Xác thực OTP thất bại',
            );
          } else if (state.isOtpVerified) {
            AppToast.success(
              context,
              message: state.successMessage ?? 'Xác thực OTP thành công!',
            );
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) =>
                    ResetPasswordView(contact: widget.contact, otp: _otpCode),
              ),
            );
          } else if (state.isOtpSent) {
            final otpInfo = state.otp != null ? ' (Mã OTP: ${state.otp})' : '';
            AppToast.info(
              context,
              message:
                  '${state.successMessage ?? "Mã OTP mới đã được gửi"}$otpInfo',
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: const AppAppBar(backgroundColor: Colors.white),
            body: SafeArea(
              child: ForgotPasswordOtpBodyView(
                contact: widget.contact,
                otpCode: _otpCode,
                isLoading: state.isLoading,
                onOtpChanged: (code) {
                  setState(() {
                    _otpCode = code;
                  });
                },
                onVerify: _onVerify,
                countdownSeconds: _countdownSeconds,
                onResend: _onResend,
              ),
            ),
          );
        },
      ),
    );
  }
}
