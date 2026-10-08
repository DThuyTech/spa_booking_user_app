import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_booking/src/app/di/dependency_injection.dart';
import 'package:spa_booking/src/shared/design_system/components/navigation/app_app_bar.dart';
import 'package:spa_booking/src/shared/widgets/toast/app_toast.dart';
import 'package:spa_booking/src/presentation/bloc/auth/forgot_password/forgot_password_cubit.dart';
import '../../forgot_password_otp/view/forgot_password_otp_view.dart';
import '../body_view/forgot_password_body_view.dart';

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
  late final ForgotPasswordCubit _cubit;
  late final TextEditingController _emailOrPhoneController;

  @override
  void initState() {
    super.initState();
    _cubit = sl<ForgotPasswordCubit>();
    _emailOrPhoneController = TextEditingController();
  }

  @override
  void dispose() {
    _emailOrPhoneController.dispose();
    _cubit.close();
    super.dispose();
  }

  void _onSendResetLink() {
    final contact = _emailOrPhoneController.text.trim();
    if (contact.isEmpty) {
      AppToast.warning(context, message: 'Vui lòng nhập số điện thoại của bạn');
      return;
    }

    _cubit.sendOtp(contact);
  }

  void _onNeedHelp() {
    AppToast.info(context, message: 'Hotline hỗ trợ: 1900 1234 (8:00 - 22:00)');
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
              message: state.errorMessage ?? 'Không thể gửi mã OTP',
            );
          } else if (state.isOtpSent) {
            final otpInfo = state.otp != null ? ' (Mã OTP: ${state.otp})' : '';
            AppToast.success(
              context,
              message:
                  '${state.successMessage ?? "Mã OTP đã được gửi đến số điện thoại"}$otpInfo',
            );
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ForgotPasswordOtpView(
                  contact: state.phone,
                  initialOtp: state.otp,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: const AppAppBar(backgroundColor: Colors.white),
            body: SafeArea(
              child: ForgotPasswordBodyView(
                emailOrPhoneController: _emailOrPhoneController,
                isLoading: state.isLoading,
                onSendResetLink: _onSendResetLink,
                onNeedHelp: _onNeedHelp,
              ),
            ),
          );
        },
      ),
    );
  }
}
