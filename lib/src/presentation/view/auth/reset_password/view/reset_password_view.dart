import 'package:auto_route/auto_route.dart';
import 'package:spa_booking/src/shared/design_system/components/navigation/app_app_bar.dart';
import 'package:spa_booking/src/shared/widgets/toast/app_toast.dart';
import 'package:flutter/material.dart';
import '../body_view/reset_password_body_view.dart';

@RoutePage()
class ResetPasswordPage extends StatelessWidget {
  final String contact;

  const ResetPasswordPage({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return ResetPasswordView(contact: contact);
  }
}

class ResetPasswordView extends StatefulWidget {
  final String contact;

  const ResetPasswordView({super.key, required this.contact});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  late final TextEditingController _newPasswordController;
  late final TextEditingController _confirmPasswordController;
  String _newPassword = '';

  @override
  void initState() {
    super.initState();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onUpdatePassword() {
    final pass = _newPasswordController.text;
    final confirm = _confirmPasswordController.text;

    if (pass.length < 8) {
      AppToast.warning(
        context,
        message: 'Password must be at least 8 characters long',
      );
      return;
    }
    if (!pass.contains(RegExp(r'[A-Z]'))) {
      AppToast.warning(
        context,
        message: 'Password must include at least one uppercase letter (A-Z)',
      );
      return;
    }
    if (!pass.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      AppToast.warning(
        context,
        message:
            'Password must include at least one special character (!@#\$%^&*)',
      );
      return;
    }
    if (pass != confirm) {
      AppToast.error(
        context,
        message: 'Password and confirmation do not match',
      );
      return;
    }

    AppToast.success(context, message: 'Password reset successfully!');
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppAppBar(backgroundColor: Colors.white),
      body: SafeArea(
        child: ResetPasswordBodyView(
          newPasswordController: _newPasswordController,
          confirmPasswordController: _confirmPasswordController,
          newPassword: _newPassword,
          onPasswordChanged: (val) {
            setState(() {
              _newPassword = val;
            });
          },
          onUpdatePassword: _onUpdatePassword,
        ),
      ),
    );
  }
}
