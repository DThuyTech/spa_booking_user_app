import 'package:auto_route/auto_route.dart';
import 'package:spa_booking/src/app/di/dependency_injection.dart';
import 'package:spa_booking/src/app/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_booking/src/presentation/view/auth/register/session/session.dart';
import 'package:spa_booking/src/shared/widgets/toast/app_toast.dart';
import '../../../../bloc/auth/register/register_bloc.dart';

@RoutePage()
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<RegisterBloc>(),
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
          body: RegisterView(),
        ),
      ),
    );
  }
}

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return BlocConsumer<RegisterBloc, RegisterState>(
      listenWhen: (previous, current) {
        return previous.status != current.status ||
            previous.errorMessage != current.errorMessage;
      },
      listener: (context, state) {
        if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
          AppToast.error(context, message: state.errorMessage!);
          context.read<RegisterBloc>().add(const ErrorCleared());
        }
        if (state.isSuccess) {
          AppToast.success(
            context,
            title: 'Welcome!',
            message: 'Your account has been registered successfully.',
          );
          context.router.replaceAll([const RootRoute()]);
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SizedBox.expand(
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Full screen fluid background image
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/auth_background.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.center,
                    errorBuilder: (context, error, stackTrace) => Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFFE8DC),
                            Color(0xFFFFF0E8),
                            Color(0xFFFFD8C7),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                ),

                // Scrollable content
                SafeArea(
                  top: true,
                  bottom: true,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        physics: const ClampingScrollPhysics(),
                        padding: EdgeInsets.fromLTRB(
                          24,
                          8,
                          24,
                          bottomInset > 0 ? bottomInset + 16 : 24,
                        ),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 460),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                RegisterHeaderSession(),
                                RegisterFormSession(),
                                RegisterBottomSession(),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
