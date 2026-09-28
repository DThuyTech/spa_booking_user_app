import 'package:auto_route/auto_route.dart';
import 'package:board_oi/src/app/di/dependency_injection.dart';
import 'package:board_oi/src/app/router/app_router.gr.dart';
import 'package:board_oi/src/app/session/session_manager.dart';
import 'package:board_oi/src/core/network/auth/token_pair.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/auth/otp_verification/otp_verification_bloc.dart';
import '../../../../bloc/auth/otp_verification/otp_verification_event.dart';
import '../../../../bloc/auth/otp_verification/otp_verification_state.dart';
import 'package:board_oi/src/presentation/bloc/auth_session/auth_session_bloc.dart';
import '../body_view/otp_verification_body_view.dart';

@RoutePage()
class OtpVerificationPage extends StatelessWidget {
  final String phone;
  final int expiresInSeconds;

  const OtpVerificationPage({
    super.key,
    required this.phone,
    this.expiresInSeconds = 300,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<OtpVerificationBloc>()
        ..add(
          OtpStarted(phone: phone, initialCountdownSeconds: expiresInSeconds),
        ),
      child: const OtpVerificationView(),
    );
  }
}

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpVerificationBloc, OtpVerificationState>(
      listenWhen: (previous, current) =>
          previous.status != current.status && current.isVerified,
      listener: (context, state) async {
        final session = state.authSession;
        if (session != null) {
          // Persist authenticated session into central SessionManager & AuthSessionBloc
          await sl<SessionManager>().login(
            tokens: TokenPair(
              accessToken: session.accessToken,
              refreshToken: session.refreshToken,
            ),
            userId: session.user.id,
            role: session.user.role.value,
          );

          if (sl.isRegistered<AuthSessionBloc>()) {
            sl<AuthSessionBloc>().add(
              AuthSessionLoggedIn(
                user: session.user,
                tokens: TokenPair(
                  accessToken: session.accessToken,
                  refreshToken: session.refreshToken,
                ),
              ),
            );
          }

          if (context.mounted) {
            // Navigate to root / authenticated app
            context.router.replaceAll([const RootRoute()]);
          }
        }
      },
      child: const Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: OtpVerificationBodyView(),
      ),
    );
  }
}
