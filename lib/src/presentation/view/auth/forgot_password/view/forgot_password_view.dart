import 'package:auto_route/auto_route.dart';
import 'package:board_oi/src/shared/design_system/components/navigation/app_app_bar.dart';
import 'package:board_oi/src/shared/widgets/toast/app_toast.dart';
import 'package:flutter/material.dart';
import '../body_view/forgot_password_body_view.dart';
import '../../forgot_password_otp/view/forgot_password_otp_view.dart';

@RoutePage()
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ForgotPasswordView();
  }
}

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  late final TextEditingController _emailOrPhoneController;

  @override
  void initState() {
    super.initState();
    _emailOrPhoneController = TextEditingController();
  }

  @override
  void dispose() {
    _emailOrPhoneController.dispose();
    super.dispose();
  }

  void _onSendResetLink() {
    final contact = _emailOrPhoneController.text.trim();
    if (contact.isEmpty) {
      AppToast.warning(
        context,
        message: 'Please enter your email or phone number',
      );
      return;
    }

    AppToast.info(context, message: 'OTP code sent to $contact');
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ForgotPasswordOtpView(contact: contact),
      ),
    );
  }

  void _onNeedHelp() {
    AppToast.info(
      context,
      message: 'Support hotline: 1900 1234 (8:00 AM - 10:00 PM)',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppAppBar(backgroundColor: Colors.white),
      body: SafeArea(
        child: ForgotPasswordBodyView(
          emailOrPhoneController: _emailOrPhoneController,
          onSendResetLink: _onSendResetLink,
          onNeedHelp: _onNeedHelp,
        ),
      ),
    );
  }
}
