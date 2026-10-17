import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:spa_booking/src/app/di/dependency_injection.dart';
import 'package:spa_booking/src/app/router/app_router.gr.dart';
import 'package:spa_booking/src/core/localization/app_localizations.dart';
import 'package:spa_booking/src/core/storage/secure_storage.dart';
import 'package:spa_booking/src/shared/widgets/toast/app_toast.dart';
import '../../../../bloc/auth/login/login_bloc.dart';
import '../../../../bloc/auth/login/login_event.dart';
import '../../../../bloc/auth/login/login_state.dart';
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

  bool _rememberCredentials = true;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    final currentState = context.read<LoginBloc>().state;
    _identifierController = TextEditingController(text: currentState.identifier);
    _passwordController = TextEditingController(text: currentState.password);
    _loadRememberedCredentials();
  }

  Future<void> _loadRememberedCredentials() async {
    try {
      if (sl.isRegistered<SecureStorage>()) {
        final storage = sl<SecureStorage>();
        final isRemembered = await storage.read('auth_remember_me');
        if (isRemembered != 'false') {
          final savedId = await storage.read('auth_saved_identifier');
          if (mounted && savedId != null && savedId.isNotEmpty) {
            _identifierController.text = savedId;
            context.read<LoginBloc>().add(LoginIdentifierChanged(savedId));
          }
          if (mounted) {
            setState(() => _rememberCredentials = true);
          }
        } else {
          if (mounted) {
            setState(() => _rememberCredentials = false);
          }
        }
      }
    } catch (_) {}
  }

  @override
  void dispose() {
    _identifierController.dispose();
    _passwordController.dispose();
    _identifierFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _saveOrClearCredentials() async {
    try {
      if (sl.isRegistered<SecureStorage>()) {
        final storage = sl<SecureStorage>();
        if (_rememberCredentials) {
          await storage.write('auth_remember_me', 'true');
          await storage.write(
            'auth_saved_identifier',
            _identifierController.text.trim(),
          );
        } else {
          await storage.write('auth_remember_me', 'false');
          await storage.delete('auth_saved_identifier');
        }
      }
    } catch (_) {}
  }

  void _handleSubmit() {
    _identifierFocusNode.unfocus();
    _passwordFocusNode.unfocus();
    _saveOrClearCredentials();
    context.read<LoginBloc>().add(const LoginSubmitted());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isVi = Localizations.localeOf(context).languageCode == 'vi';

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
        final hasIdentifierError = state.identifierError != null;
        final hasPasswordError = state.passwordError != null;

        return FrostedGlassCard(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Selector 2 lựa chọn (Mật khẩu vs Nhận mã OTP) với Checkbox
              _buildMethodSelectionRow(context, state, isVi),

              const SizedBox(height: 18),

              // 2. Identifier Field (Email hoặc Số điện thoại)
              GlassmorphicTextField(
                textFieldKey: const Key('login_identifier_field'),
                controller: _identifierController,
                focusNode: _identifierFocusNode,
                hintText: l10n.enterEmailOrPhone,
                prefixIcon: LucideIcons.user,
                keyboardType: TextInputType.emailAddress,
                textInputAction: state.isPasswordMethod
                    ? TextInputAction.next
                    : TextInputAction.done,
                hasError: hasIdentifierError,
                onChanged: (value) {
                  context.read<LoginBloc>().add(LoginIdentifierChanged(value));
                },
                onSubmitted: (_) {
                  if (state.isPasswordMethod) {
                    _passwordFocusNode.requestFocus();
                  } else {
                    _handleSubmit();
                  }
                },
              ),

              // Inline Identifier Error
              if (hasIdentifierError) ...[
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

              // 3. Password Field (chỉ hiển thị khi chọn Đăng nhập Mật khẩu)
              if (state.isPasswordMethod) ...[
                const SizedBox(height: 12),
                GlassmorphicTextField(
                  textFieldKey: const Key('login_password_field'),
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  hintText: isVi ? 'Mật khẩu' : 'Password',
                  prefixIcon: LucideIcons.lock,
                  obscureText: _obscurePassword,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  hasError: hasPasswordError,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? LucideIcons.eye_off
                          : LucideIcons.eye,
                      size: 19,
                      color: const Color(0xFF8A7D75),
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  onChanged: (value) {
                    context.read<LoginBloc>().add(LoginPasswordChanged(value));
                  },
                  onSubmitted: (_) => _handleSubmit(),
                ),

                // Inline Password Error
                if (hasPasswordError) ...[
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
              ],

              const SizedBox(height: 12),

              // 4. Remember me & Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _rememberCredentials = !_rememberCredentials;
                      });
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 22,
                          height: 22,
                          child: Checkbox(
                            value: _rememberCredentials,
                            activeColor: const Color(0xFFFA7762),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            side: const BorderSide(
                              color: Color(0xFF8A7D75),
                              width: 1.5,
                            ),
                            onChanged: (val) {
                              setState(() {
                                _rememberCredentials = val ?? false;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          isVi ? 'Nhớ tài khoản' : 'Remember me',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF5A4E46),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (state.isPasswordMethod)
                    GestureDetector(
                      onTap: () {
                        context.router.push(const ForgotPasswordRoute());
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Text(
                        isVi ? 'Quên mật khẩu?' : 'Forgot password?',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFF26242),
                        ),
                      ),
                    ),
                ],
              ),

              // 5. Ghi chú khi chọn hình thức OTP
              if (state.isOtpMethod) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.35),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.5),
                    ),
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
                              ? 'Mã OTP bảo mật sẽ được gửi về Email hoặc Số điện thoại của bạn.'
                              : 'A secure OTP code will be sent to your Email or Phone.',
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
              ],

              const SizedBox(height: 18),

              // 6. Action Button (Đăng nhập / Nhận mã OTP)
              _buildSubmitButton(context, state, isVi),

              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  /// Khối lựa chọn 2 phương thức: Mật khẩu hoặc Nhận mã OTP với Checkbox tùy chọn
  Widget _buildMethodSelectionRow(
    BuildContext context,
    LoginState state,
    bool isVi,
  ) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.32),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Lựa chọn 1: Mật khẩu
          Expanded(
            child: _buildCheckboxOption(
              context: context,
              isSelected: state.isPasswordMethod,
              label: isVi ? 'Mật khẩu' : 'Password',
              icon: LucideIcons.key_round,
              onTap: () {
                context
                    .read<LoginBloc>()
                    .add(const LoginMethodChanged(LoginMethod.password));
              },
            ),
          ),
          const SizedBox(width: 6),
          // Lựa chọn 2: Nhận mã OTP
          Expanded(
            child: _buildCheckboxOption(
              context: context,
              isSelected: state.isOtpMethod,
              label: isVi ? 'Nhận mã OTP' : 'OTP Code',
              icon: LucideIcons.smartphone,
              onTap: () {
                context
                    .read<LoginBloc>()
                    .add(const LoginMethodChanged(LoginMethod.otp));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxOption({
    required BuildContext context,
    required bool isSelected,
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withValues(alpha: 0.90)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFFFA7762).withValues(alpha: 0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Checkbox indicator tròn/bo mềm sang trọng
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: isSelected
                    ? const LinearGradient(
                        colors: [Color(0xFFFA7762), Color(0xFFF7664D)],
                      )
                    : null,
                color: isSelected ? null : Colors.white.withValues(alpha: 0.5),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFFFA7762)
                      : const Color(0xFF9E8E84),
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      size: 12,
                      color: Colors.white,
                    )
                  : null,
            ),
            const SizedBox(width: 8),
            // Text label
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected
                      ? const Color(0xFF2C241F)
                      : const Color(0xFF70635A),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton(
    BuildContext context,
    LoginState state,
    bool isVi,
  ) {
    final isEnabled = state.canSubmit;
    final isLoading = state.isLoading;

    final buttonLabel = state.isPasswordMethod
        ? (isVi ? 'Đăng nhập' : 'Sign In')
        : (isVi ? 'Nhận mã OTP' : 'Send OTP');

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
                    buttonLabel,
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
