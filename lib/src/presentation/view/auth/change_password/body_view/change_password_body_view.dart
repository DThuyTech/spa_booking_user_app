import 'package:flutter/material.dart';
import '../../../../../shared/shared.dart';
import '../widgets/change_password_field.dart';

class ChangePasswordBodyView extends StatelessWidget {
  final TextEditingController currentPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;
  final VoidCallback onUpdatePassword;
  final bool isLoading;

  const ChangePasswordBodyView({
    super.key,
    required this.currentPasswordController,
    required this.newPasswordController,
    required this.confirmPasswordController,
    required this.onUpdatePassword,
    this.isLoading = false,
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
                      'Change Password',
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
                      'Enter your new password below to update your account security.',
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w400,
                        color: _textMuted,
                        height: 1.45,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // 1. Current Password Field
                    ChangePasswordField(
                      controller: currentPasswordController,
                      hintText: 'Enter current password',
                      textInputAction: TextInputAction.next,
                    ),

                    const SizedBox(height: 16),

                    // 2. New Password Field
                    ChangePasswordField(
                      controller: newPasswordController,
                      hintText: 'Enter new password',
                      textInputAction: TextInputAction.next,
                    ),

                    const SizedBox(height: 16),

                    // 3. Confirm Password Field
                    ChangePasswordField(
                      controller: confirmPasswordController,
                      hintText: 'Confirm new password',
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => onUpdatePassword(),
                    ),
                  ],
                ),

                // Bottom Action Button
                Padding(
                  padding: const EdgeInsets.only(top: 36, bottom: 20),
                  child: AppButton(
                    text: 'Update Password',
                    isLoading: isLoading,
                    onPressed: isLoading ? null : onUpdatePassword,
                    backgroundColor: _coralColor,
                    textColor: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    height: 54,
                    fullWidth: true,
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
