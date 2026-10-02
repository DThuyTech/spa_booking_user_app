import 'package:spa_booking/src/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:spa_booking/src/shared/widgets/toast/app_toast.dart';
import '../../../../bloc/auth/login/login_bloc.dart';
import '../../../../bloc/auth/login/login_event.dart';
import '../../../../bloc/auth/login/login_state.dart';
import '../../forgot_password/view/forgot_password_view.dart';
import '../widgets/frosted_glass_card.dart';
import '../widgets/glassmorphic_text_field.dart';

class LoginCardSection extends StatefulWidget {
  const LoginCardSection({super.key});

  @override
  State<LoginCardSection> createState() => _LoginCardSectionState();
}

class _LoginCardSectionState extends State<LoginCardSection> {
  late final TextEditingController _identifierController;
  late final TextEditingController _passwordController;
  final FocusNode _identifierFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    final currentPhone = context.read<LoginBloc>().state.phone;
    _identifierController = TextEditingController(text: currentPhone);
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _identifierController.dispose();
    _passwordController.dispose();
    _identifierFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    _identifierFocusNode.unfocus();
    _passwordFocusNode.unfocus();
    context.read<LoginBloc>().add(const LoginSubmitted());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocConsumer<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          previous.errorMessage != current.errorMessage &&
          current.errorMessage != null,
      listener: (context, state) {
        if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
          AppToast.error(context, message: state.errorMessage!);
        }
      },
      builder: (context, state) {
        final hasError = state.identifierError != null;

        return FrostedGlassCard(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Identifier Field (Email or Phone) with translucent white glassmorphism
              GlassmorphicTextField(
                textFieldKey: const Key('login_identifier_field'),
                controller: _identifierController,
                focusNode: _identifierFocusNode,
                hintText: l10n.enterEmailOrPhone,
                prefixIcon: LucideIcons.user,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                hasError: hasError,
                onChanged: (value) {
                  context.read<LoginBloc>().add(LoginIdentifierChanged(value));
                },
                onSubmitted: (_) {
                  _passwordFocusNode.requestFocus();
                },
              ),

              // Inline Validation Error
              if (hasError) ...[
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Text(
                    state.identifierError!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFD32F2F),
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 16),

              // 2. Password Field with translucent white glassmorphism
              GlassmorphicTextField(
                textFieldKey: const Key('login_password_field'),
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                hintText: l10n.enterPassword,
                prefixIcon: LucideIcons.key,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  context.read<LoginBloc>().add(LoginPasswordChanged(value));
                },
                onSubmitted: (_) => _handleSubmit(),
              ),

              if (state.passwordError != null) ...[
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Text(
                    state.passwordError!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFD32F2F),
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 14),

              // 3. "Forgot Password?" Link (matching Image 2 position & color)
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const ForgotPasswordView(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 2,
                    ),
                    child: Text(
                      l10n.forgotPassword,
                      style: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFB85848),
                        letterSpacing: 0.1,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 22),

              // 4. Action Button (Login)
              _buildLoginButton(context, state),

              const SizedBox(height: 14),

              // 5. Quick Fill Demo Account
              Center(
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    _identifierController.text = 'demo@aura.com';
                    _passwordController.text = 'password123';
                    context.read<LoginBloc>().add(
                      const LoginIdentifierChanged('demo@aura.com'),
                    );
                    context.read<LoginBloc>().add(
                      const LoginPasswordChanged('password123'),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFA7762).withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFFFA7762).withValues(alpha: 0.25),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          LucideIcons.sparkles,
                          size: 13,
                          color: Color(0xFFB85848),
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Quick Demo: demo@aura.com',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFB85848),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLoginButton(BuildContext context, LoginState state) {
    final l10n = context.l10n;
    final isEnabled = state.canSubmit;
    final isLoading = state.isLoading;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: isEnabled
              ? const [Color(0xFFFA7762), Color(0xFFF7664D)]
              : [
                  const Color(0xFFFA7762).withValues(alpha: 0.45),
                  const Color(0xFFF7664D).withValues(alpha: 0.45),
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: isEnabled
            ? [
                BoxShadow(
                  color: const Color(0xFFF7664D).withValues(alpha: 0.30),
                  blurRadius: 16,
                  offset: const Offset(0, 5),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: isEnabled ? _handleSubmit : null,
          child: Center(
            child: isLoading
                ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.4,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    l10n.loginButton,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.3,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
