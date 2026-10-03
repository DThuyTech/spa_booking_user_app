import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class PasswordStrengthChecklistCard extends StatelessWidget {
  final String password;

  const PasswordStrengthChecklistCard({super.key, required this.password});

  bool get hasMinLength => password.length >= 8;
  bool get hasUppercase => password.contains(RegExp(r'[A-Z]'));
  bool get hasSpecialChar =>
      password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

  int get strengthScore {
    int score = 0;
    if (hasMinLength) score++;
    if (hasUppercase) score++;
    if (hasSpecialChar) score++;
    return score;
  }

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _redColor = Color(0xFFDC2626);
  static const Color _greyBar = Color(0xFFE2E8F0);
  static const Color _textDark = Color(0xFF1E2022);

  @override
  Widget build(BuildContext context) {
    final score = strengthScore;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 3-Segment Progress Bar (matching Image 2)
          Row(
            children: [
              // Segment 1
              Expanded(
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: score >= 1 ? _redColor : _greyBar,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(width: 8),

              // Segment 2
              Expanded(
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: score >= 2 ? _coralColor : _greyBar,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(width: 8),

              // Segment 3
              Expanded(
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: score >= 3 ? const Color(0xFF10B981) : _greyBar,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          // Requirement 1: Be at least 8 characters long
          _buildRequirementItem(
            isSatisfied: hasMinLength,
            label: 'Be at least 8 characters long',
          ),

          const SizedBox(height: 10),

          // Requirement 2: At least one uppercase letter (A-Z)
          _buildRequirementItem(
            isSatisfied: hasUppercase,
            label: 'At least one uppercase letter (A-Z)',
          ),

          const SizedBox(height: 10),

          // Requirement 3: At least one special character (!@#$%^&*)
          _buildRequirementItem(
            isSatisfied: hasSpecialChar,
            label: 'At least one special character (!@#\$%^&*)',
          ),
        ],
      ),
    );
  }

  Widget _buildRequirementItem({
    required bool isSatisfied,
    required String label,
  }) {
    return Row(
      children: [
        Icon(
          isSatisfied ? LucideIcons.circle_check : LucideIcons.circle_x,
          size: 18,
          color: isSatisfied ? _coralColor : const Color(0xFFCBD5E1),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w500,
              color: isSatisfied ? _textDark : const Color(0xFF64748B),
            ),
          ),
        ),
      ],
    );
  }
}
