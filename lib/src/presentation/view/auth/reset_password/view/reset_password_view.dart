import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_booking/src/app/di/dependency_injection.dart';
import 'package:spa_booking/src/shared/design_system/components/navigation/app_app_bar.dart';
import 'package:spa_booking/src/shared/widgets/toast/app_toast.dart';
import 'package:spa_booking/src/presentation/bloc/auth/forgot_password/forgot_password_cubit.dart';
import '../body_view/reset_password_body_view.dart';

@RoutePage()
class ResetPasswordPage extends StatelessWidget {
  final String contact;
  final String otp;

  const ResetPasswordPage({
    super.key,
    required this.contact,
    this.otp = '123456',
  });

  @override
  Widget build(BuildContext context) {
    return ResetPasswordView(contact: contact, otp: otp);
  }
}

class ResetPasswordView extends StatefulWidget {
  final String contact;
  final String otp;

  const ResetPasswordView({
    super.key,
    required this.contact,
    this.otp = '123456',
  });

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  late final ForgotPasswordCubit _cubit;
  late final TextEditingController _newPasswordController;
  late final TextEditingController _confirmPasswordController;
  String _newPassword = '';

  @override
  void initState() {
    super.initState();
    _cubit = sl<ForgotPasswordCubit>();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _cubit.close();
    super.dispose();
  }

  void _onUpdatePassword() {
    final pass = _newPasswordController.text;
    final confirm = _confirmPasswordController.text;

    if (pass.length < 8) {
      AppToast.warning(context, message: 'Mật khẩu phải có ít nhất 8 ký tự');
      return;
    }
    if (!pass.contains(RegExp(r'[A-Z]'))) {
      AppToast.warning(
        context,
        message: 'Mật khẩu phải chứa ít nhất một chữ cái in hoa (A-Z)',
      );
      return;
    }
    if (!pass.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      AppToast.warning(
        context,
        message: 'Mật khẩu phải chứa ít nhất một ký tự đặc biệt (!@#\$%^&*)',
      );
      return;
    }
    if (pass != confirm) {
      AppToast.error(
        context,
        message: 'Mật khẩu và xác nhận mật khẩu không khớp',
      );
      return;
    }

    _cubit.resetPassword(
      phone: widget.contact,
      otp: widget.otp,
      newPassword: pass,
    );
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
              message: state.errorMessage ?? 'Đặt lại mật khẩu thất bại',
            );
          } else if (state.isResetSuccess) {
            AppToast.success(
              context,
              message:
                  state.successMessage ??
                  'Đặt lại mật khẩu thành công. Vui lòng đăng nhập với mật khẩu mới.',
            );
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: const AppAppBar(backgroundColor: Colors.white),
            body: SafeArea(
              child: ResetPasswordBodyView(
                newPasswordController: _newPasswordController,
                confirmPasswordController: _confirmPasswordController,
                newPassword: _newPassword,
                isLoading: state.isLoading,
                onPasswordChanged: (val) {
                  setState(() {
                    _newPassword = val;
                  });
                },
                onUpdatePassword: _onUpdatePassword,
              ),
            ),
          );
        },
      ),
    );
  }
}
