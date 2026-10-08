import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_booking/src/presentation/bloc/auth/register/register_bloc.dart';
import 'package:spa_booking/src/presentation/view/auth/login/widgets/frosted_glass_card.dart';
import 'package:spa_booking/src/presentation/view/auth/login/widgets/glassmorphic_text_field.dart';
import 'package:spa_booking/src/presentation/view/terms/view/terms_of_use_view.dart';
import 'package:spa_booking/src/shared/shared.dart';

class RegisterFormSession extends StatefulWidget {
  const RegisterFormSession({super.key});

  @override
  State<RegisterFormSession> createState() => _RegisterFormSessionState();
}

class _RegisterFormSessionState extends State<RegisterFormSession> {
  final _identifierController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _identifierFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isAgreedToTerms = false;

  @override
  void initState() {
    super.initState();

    _identifierController.addListener(() {
      context.read<RegisterBloc>().add(
        RegisterIdentifierChanged(_identifierController.text),
      );
    });
    _passwordController.addListener(() {
      context.read<RegisterBloc>().add(
        RegisterPasswordChanged(_passwordController.text),
      );
    });
    _confirmPasswordController.addListener(() {
      context.read<RegisterBloc>().add(
        RegisterConfirmPasswordChanged(_confirmPasswordController.text),
      );
    });
  }

  @override
  void dispose() {
    _identifierController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _identifierFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
    super.dispose();
  }

  void _handleRegister() {
    _identifierFocus.unfocus();
    _passwordFocus.unfocus();
    _confirmPasswordFocus.unfocus();

    if (_passwordController.text != _confirmPasswordController.text) {
      AppToast.error(
        context,
        message: 'Passwords do not match. Please verify your password.',
      );
      return;
    }

    if (!_isAgreedToTerms) {
      AppToast.error(
        context,
        message: 'Please agree to the Terms of Service to continue.',
      );
      return;
    }

    context.read<RegisterBloc>().add(const RegisterSubmitted());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return // Glassmorphic Card
    FrostedGlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Email or Phone
          GlassmorphicTextField(
            controller: _identifierController,
            focusNode: _identifierFocus,
            hintText: l10n.enterEmailOrPhone,
            prefixIcon: LucideIcons.mail,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onSubmitted: (_) => _passwordFocus.requestFocus(),
          ),
          const SizedBox(height: 14),

          // Password
          GlassmorphicTextField(
            textFieldKey: const Key('register_password_field'),
            controller: _passwordController,
            focusNode: _passwordFocus,
            hintText: l10n.enterPassword,
            prefixIcon: LucideIcons.key,
            obscureText: _obscurePassword,
            suffixIcon: IconButton(
              padding: EdgeInsets.zero,
              splashRadius: 18,
              icon: Icon(
                _obscurePassword ? LucideIcons.eye_off : LucideIcons.eye,
                size: 19,
                color: const Color(0xFF8A7D75),
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            onSubmitted: (_) => _confirmPasswordFocus.requestFocus(),
          ),
          const SizedBox(height: 14),

          // Confirm Password
          GlassmorphicTextField(
            textFieldKey: const Key('register_confirm_password_field'),
            controller: _confirmPasswordController,
            focusNode: _confirmPasswordFocus,
            hintText: 'Confirm password',
            prefixIcon: LucideIcons.shield_check,
            obscureText: _obscureConfirmPassword,
            suffixIcon: IconButton(
              padding: EdgeInsets.zero,
              splashRadius: 18,
              icon: Icon(
                _obscureConfirmPassword ? LucideIcons.eye_off : LucideIcons.eye,
                size: 19,
                color: const Color(0xFF8A7D75),
              ),
              onPressed: () {
                setState(() {
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                });
              },
            ),
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _handleRegister(),
          ),
          const SizedBox(height: 16),

          // Agree to Terms & Service Checkbox
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: _isAgreedToTerms,
                  activeColor: const Color(0xFFFA7762),
                  checkColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _isAgreedToTerms = val ?? false;
                    });
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isAgreedToTerms = !_isAgreedToTerms;
                    });
                  },
                  child: Text.rich(
                    TextSpan(
                      text: 'I agree to the ',
                      style: const TextStyle(
                        fontSize: 12.5,
                        color: Color(0xFF4A3E39),
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: GestureDetector(
                            onTap: () async {
                              final accepted = await Navigator.of(context)
                                  .push<bool>(
                                    MaterialPageRoute(
                                      builder: (_) => const TermsOfUseView(),
                                    ),
                                  );
                              if (accepted == true) {
                                setState(() {
                                  _isAgreedToTerms = true;
                                });
                              }
                            },
                            child: Text(
                              context.l10n.termsAndService,
                              style: const TextStyle(
                                fontSize: 12.5,
                                color: Color(0xFFF26242),
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFFF26242),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Register Button
          BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              final isLoading = state.status == RegisterStatus.loading;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFA7762), Color(0xFFF7664D)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFF7664D).withValues(alpha: 0.30),
                      blurRadius: 16,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: isLoading ? null : _handleRegister,
                    child: Center(
                      child: isLoading
                          ? const SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.4,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            )
                          : Text(
                              l10n.register,
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
            },
          ),
        ],
      ),
    );
  }
}
