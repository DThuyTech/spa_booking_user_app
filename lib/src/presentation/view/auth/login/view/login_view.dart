import 'package:auto_route/auto_route.dart';
import 'package:spa_booking/src/app/di/dependency_injection.dart';
import 'package:spa_booking/src/app/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/auth/login/login_bloc.dart';
import '../../../../bloc/auth/login/login_state.dart';
import '../../../../bloc/auth/otp_verification/otp_verification_state.dart';
import '../../otp_verification/view/otp_verification_view.dart';
import '../body_view/login_body_view.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginBloc>(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          previous.status != current.status && current.isSuccess,
      listener: (context, state) {
        if (state.otpResult != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => OtpVerificationPage(
                identifier: state.identifier,
                flowType: OtpFlowType.login,
                mockOtp: state.otpResult?.otp,
                expiresInSeconds: state.otpResult?.expiresInSeconds ?? 300,
              ),
            ),
          );
        } else {
          context.router.replaceAll([const RootRoute()]);
        }
      },
      child: const AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarContrastEnforced: false,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          body: LoginBodyView(),
        ),
      ),
    );
  }
}
