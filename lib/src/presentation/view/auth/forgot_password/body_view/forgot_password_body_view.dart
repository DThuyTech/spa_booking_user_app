import 'package:flutter/material.dart';
import '../../../../../shared/shared.dart';

class ForgotPasswordBodyView extends StatelessWidget {
  final TextEditingController emailOrPhoneController;
  final VoidCallback onSendResetLink;
  final VoidCallback onNeedHelp;

  const ForgotPasswordBodyView({
    super.key,
    required this.emailOrPhoneController,
    required this.onSendResetLink,
    required this.onNeedHelp,
  });

  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF64748B);
  static const Color _coralColor = Color(0xFFFF6F59);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight - 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top Content Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),

                    // Title
                    const Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: _textDark,
                        letterSpacing: -0.5,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Subtitle
                    const Text(
                      'Enter your email or phone number to reset your password.',
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w400,
                        color: _textMuted,
                        height: 1.45,
                      ),
                    ),

                    const SizedBox(height: 36),

                    // Input Field (matching Image 1)
                    AppTextField(
                      controller: emailOrPhoneController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => onSendResetLink(),
                      hint: 'Email or Phone',
                      hintStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF94A3B8),
                      ),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: _textDark,
                      ),
                      prefixIcon: const Icon(
                        LucideIcons.mail,
                        color: Color(0xFF94A3B8),
                        size: 20,
                      ),
                      fillColor: const Color(0xFFF1F5F9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide: BorderSide.none,
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Send Reset Link Button
                    AppButton(
                      text: 'Send Reset Link',
                      onPressed: onSendResetLink,
                      backgroundColor: _coralColor,
                      textColor: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      height: 54,
                      fullWidth: true,
                    ),
                  ],
                ),

                // Bottom "? Need help?" Footer
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Center(
                    child: InkWell(
                      onTap: onNeedHelp,
                      borderRadius: BorderRadius.circular(16),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.help_outline_rounded,
                              size: 16,
                              color: Color(0xFF64748B),
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Need help?',
                              style: TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF475569),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
