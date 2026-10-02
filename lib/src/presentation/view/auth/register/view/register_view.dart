import 'package:auto_route/auto_route.dart';
import 'package:spa_booking/src/app/di/dependency_injection.dart';
import 'package:spa_booking/src/app/router/app_router.gr.dart';
import 'package:spa_booking/src/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../../login/widgets/aura_logo_badge.dart';
import '../../login/widgets/frosted_glass_card.dart';
import '../../login/widgets/glassmorphic_text_field.dart';
import 'package:spa_booking/src/presentation/view/terms/view/terms_of_use_view.dart';
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
  final _fullNameController = TextEditingController();
  final _identifierController = TextEditingController();
  final _passwordController = TextEditingController();

  final _fullNameFocus = FocusNode();
  final _identifierFocus = FocusNode();
  final _passwordFocus = FocusNode();

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
    _passwordController.addListener(() {
      context.read<RegisterBloc>().add(
        RegisterPasswordChanged(_passwordController.text),
      );
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _identifierController.dispose();
    _passwordController.dispose();
    _fullNameFocus.dispose();
    _identifierFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _handleRegister() {
    _fullNameFocus.unfocus();
    _identifierFocus.unfocus();
    _passwordFocus.unfocus();

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
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return BlocConsumer<RegisterBloc, RegisterState>(
      listenWhen: (previous, current) =>
          previous.status != current.status ||
          previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
          AppToast.error(context, message: state.errorMessage!);
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
        final isLoading = state.isLoading;

        return SizedBox.expand(
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
                              // Top back button
                              Align(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                  icon: const Icon(
                                    LucideIcons.arrow_left,
                                    color: Color(0xFF2C241F),
                                    size: 22,
                                  ),
                                  onPressed: () => context.router.maybePop(),
                                ),
                              ),
                              const SizedBox(height: 4),

                              // Header Section
                              const AuraLogoBadge(),
                              const SizedBox(height: 18),
                              Text(
                                l10n.createAccount,
                                style: const TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -0.6,
                                  color: Color(0xFF1E1713),
                                  height: 1.2,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                l10n.registerSubtitle,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF6E625A),
                                  height: 1.4,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 24),

                              // Glassmorphic Card
                              FrostedGlassCard(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 24,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    // Full Name
                                    GlassmorphicTextField(
                                      controller: _fullNameController,
                                      focusNode: _fullNameFocus,
                                      hintText: l10n.enterFullName,
                                      prefixIcon: LucideIcons.user,
                                      keyboardType: TextInputType.name,
                                      textInputAction: TextInputAction.next,
                                      onSubmitted: (_) =>
                                          _identifierFocus.requestFocus(),
                                    ),
                                    const SizedBox(height: 14),

                                    // Email or Phone
                                    GlassmorphicTextField(
                                      controller: _identifierController,
                                      focusNode: _identifierFocus,
                                      hintText: l10n.enterEmailOrPhone,
                                      prefixIcon: LucideIcons.mail,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      onSubmitted: (_) =>
                                          _passwordFocus.requestFocus(),
                                    ),
                                    const SizedBox(height: 14),

                                    // Password
                                    GlassmorphicTextField(
                                      controller: _passwordController,
                                      focusNode: _passwordFocus,
                                      hintText: l10n.enterPassword,
                                      prefixIcon: LucideIcons.key,
                                      obscureText: true,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      textInputAction: TextInputAction.done,
                                      onSubmitted: (_) => _handleRegister(),
                                    ),
                                    const SizedBox(height: 16),

                                    // Agree to Terms & Service Checkbox
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: Checkbox(
                                            value: _isAgreedToTerms,
                                            activeColor: const Color(
                                              0xFFFA7762,
                                            ),
                                            checkColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
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
                                                _isAgreedToTerms =
                                                    !_isAgreedToTerms;
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
                                                    alignment:
                                                        PlaceholderAlignment
                                                            .middle,
                                                    child: GestureDetector(
                                                      onTap: () async {
                                                        final accepted =
                                                            await Navigator.of(
                                                              context,
                                                            ).push<bool>(
                                                              MaterialPageRoute(
                                                                builder: (_) =>
                                                                    const TermsOfUseView(),
                                                              ),
                                                            );
                                                        if (accepted == true) {
                                                          setState(() {
                                                            _isAgreedToTerms =
                                                                true;
                                                          });
                                                        }
                                                      },
                                                      child: const Text(
                                                        'Terms & Service',
                                                        style: TextStyle(
                                                          fontSize: 12.5,
                                                          color: Color(
                                                            0xFFF26242,
                                                          ),
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          decorationColor:
                                                              Color(0xFFF26242),
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
                                    AnimatedContainer(
                                      duration: const Duration(
                                        milliseconds: 200,
                                      ),
                                      height: 52,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFFFA7762),
                                            Color(0xFFF7664D),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(
                                              0xFFF7664D,
                                            ).withValues(alpha: 0.30),
                                            blurRadius: 16,
                                            offset: const Offset(0, 5),
                                          ),
                                        ],
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                          onTap: isLoading
                                              ? null
                                              : _handleRegister,
                                          child: Center(
                                            child: isLoading
                                                ? const SizedBox(
                                                    width: 22,
                                                    height: 22,
                                                    child: CircularProgressIndicator(
                                                      strokeWidth: 2.4,
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                            Color
                                                          >(Colors.white),
                                                    ),
                                                  )
                                                : Text(
                                                    l10n.register,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white,
                                                      letterSpacing: 0.3,
                                                    ),
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 24),

                              // Back to Sign In
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    l10n.alreadyHaveAccount,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF6E625A),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () => context.router.maybePop(),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                        vertical: 4,
                                      ),
                                      child: Text(
                                        l10n.signIn,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFFF26242),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 24),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => const TermsOfUseView(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    l10n.termsNotice,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 11.5,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(
                                        0xFF8A7D75,
                                      ).withValues(alpha: 0.9),
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
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
        );
      },
    );
  }
}
