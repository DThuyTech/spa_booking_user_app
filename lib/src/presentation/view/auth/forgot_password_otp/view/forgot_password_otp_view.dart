import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:spa_booking/src/shared/design_system/components/navigation/app_app_bar.dart';
import 'package:spa_booking/src/shared/widgets/toast/app_toast.dart';
import 'package:flutter/material.dart';
import '../../reset_password/view/reset_password_view.dart';
import '../body_view/forgot_password_otp_body_view.dart';

@RoutePage()
class ForgotPasswordOtpPage extends StatelessWidget {
  final String contact;

  const ForgotPasswordOtpPage({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return ForgotPasswordOtpView(contact: contact);
  }
}

class ForgotPasswordOtpView extends StatefulWidget {
  final String contact;

  const ForgotPasswordOtpView({super.key, required this.contact});

  @override
  State<ForgotPasswordOtpView> createState() => _ForgotPasswordOtpViewState();
}

class _ForgotPasswordOtpViewState extends State<ForgotPasswordOtpView> {
  String _otpCode = '';
  int _countdownSeconds = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
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
    super.dispose();
  }

  void _onVerify() {
    if (_otpCode.length != 6) {
      AppToast.warning(context, message: 'Please enter the full 6-digit code');
      return;
    }

    AppToast.success(context, message: 'OTP verified successfully!');
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ResetPasswordView(contact: widget.contact),
      ),
    );
  }

  void _onResend() {
    _startTimer();
    AppToast.info(
      context,
      message: 'A new OTP has been sent to ${widget.contact} (Demo: 123456)',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppAppBar(backgroundColor: Colors.white),
      body: SafeArea(
        child: ForgotPasswordOtpBodyView(
          contact: widget.contact,
          otpCode: _otpCode,
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
  }
}
