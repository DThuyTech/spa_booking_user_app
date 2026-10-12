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
  final _fullNameController = TextEditingController();
  final _identifierController = TextEditingController();

  final _fullNameFocus = FocusNode();
  final _identifierFocus = FocusNode();

  bool _isAgreedToTerms = false;

  @override
  void initState() {
    super.initState();

    _fullNameController.addListener(() {
      context.read<RegisterBloc>().add(
        RegisterFullNameChanged(_fullNameController.text),
      );
    });

    _identifierController.addListener(() {
      context.read<RegisterBloc>().add(
        RegisterIdentifierChanged(_identifierController.text),
      );
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _identifierController.dispose();
    _fullNameFocus.dispose();
    _identifierFocus.dispose();
    super.dispose();
  }

  void _handleRegister() {
    _fullNameFocus.unfocus();
    _identifierFocus.unfocus();

    final isVi = Localizations.localeOf(context).languageCode == 'vi';

    if (_fullNameController.text.trim().isEmpty) {
      AppToast.error(
        context,
        message: isVi
            ? 'Vui lòng nhập Họ và tên'
            : 'Please enter your full name',
      );
      return;
    }

    if (_identifierController.text.trim().isEmpty) {
      AppToast.error(
        context,
        message: isVi
            ? 'Vui lòng nhập Email hoặc Số điện thoại'
            : 'Please enter your email or phone number',
      );
      return;
    }

    if (!_isAgreedToTerms) {
      AppToast.error(
        context,
        message: isVi
            ? 'Vui lòng đồng ý với Điều khoản dịch vụ để tiếp tục.'
            : 'Please agree to the Terms of Service to continue.',
      );
      return;
    }

    context.read<RegisterBloc>().add(const RegisterSubmitted());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isVi = Localizations.localeOf(context).languageCode == 'vi';

    return FrostedGlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Full Name
          GlassmorphicTextField(
            textFieldKey: const Key('register_name_field'),
            controller: _fullNameController,
            focusNode: _fullNameFocus,
            hintText: isVi ? 'Họ và tên của bạn' : 'Full name',
            prefixIcon: LucideIcons.user,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            onSubmitted: (_) => _identifierFocus.requestFocus(),
          ),
          const SizedBox(height: 14),

          // 2. Email or Phone
          GlassmorphicTextField(
            textFieldKey: const Key('register_identifier_field'),
            controller: _identifierController,
            focusNode: _identifierFocus,
            hintText: l10n.enterEmailOrPhone,
            prefixIcon: LucideIcons.mail,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _handleRegister(),
          ),
          const SizedBox(height: 14),

          // Helper note
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.35),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
            ),
            child: Row(
              children: [
                const Icon(
                  LucideIcons.shield_check,
                  size: 16,
                  color: Color(0xFFFA7762),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    isVi
                        ? 'Mã OTP bảo mật sẽ được gửi về Email hoặc SĐT để hoàn tất tạo tài khoản.'
                        : 'A secure OTP code will be sent to your Email or Phone to complete registration.',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF5A4E46),
                      fontWeight: FontWeight.w500,
                      height: 1.35,
                    ),
                  ),
                ),
              ],
            ),
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
                      text: isVi ? 'Tôi đồng ý với ' : 'I agree to the ',
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
                              isVi ? 'Đăng ký bằng OTP' : 'Register with OTP',
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
