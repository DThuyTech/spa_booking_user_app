import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_booking/src/app/di/dependency_injection.dart';
import 'package:spa_booking/src/shared/design_system/components/navigation/app_app_bar.dart';
import 'package:spa_booking/src/shared/widgets/toast/app_toast.dart';
import 'package:spa_booking/src/presentation/bloc/auth/change_password/change_password_cubit.dart';
import '../body_view/change_password_body_view.dart';

@RoutePage()
class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ChangePasswordCubit>(),
      child: const ChangePasswordView(),
    );
  }
}

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  late final TextEditingController _currentPasswordController;
  late final TextEditingController _newPasswordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onUpdatePassword(BuildContext context) {
    final current = _currentPasswordController.text;
    final newPass = _newPasswordController.text;
    final confirm = _confirmPasswordController.text;

    if (current.isEmpty) {
      AppToast.warning(context, message: 'Vui lòng nhập mật khẩu hiện tại');
      return;
    }
    if (newPass.length < 8) {
      AppToast.warning(
        context,
        message: 'Mật khẩu mới phải có ít nhất 8 ký tự',
      );
      return;
    }
    if (newPass == current) {
      AppToast.warning(
        context,
        message: 'Mật khẩu mới không được trùng mật khẩu cũ',
      );
      return;
    }
    if (newPass != confirm) {
      AppToast.error(
        context,
        message: 'Mật khẩu mới và xác nhận mật khẩu không khớp',
      );
      return;
    }

    context.read<ChangePasswordCubit>().changePassword(
      oldPassword: current,
      newPassword: newPass,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state.isFailure) {
          AppToast.error(
            context,
            message: state.errorMessage ?? 'Đổi mật khẩu thất bại',
          );
        } else if (state.isSuccess) {
          AppToast.success(
            context,
            message: state.message ?? 'Đổi mật khẩu thành công!',
          );
          Navigator.of(context).maybePop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: const AppAppBar(backgroundColor: Colors.white),
          body: SafeArea(
            child: ChangePasswordBodyView(
              currentPasswordController: _currentPasswordController,
              newPasswordController: _newPasswordController,
              confirmPasswordController: _confirmPasswordController,
              isLoading: state.isLoading,
              onUpdatePassword: () => _onUpdatePassword(context),
            ),
          ),
        );
      },
    );
  }
}
