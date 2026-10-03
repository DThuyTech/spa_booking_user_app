import 'package:flutter/material.dart';
import '../../../../../shared/shared.dart';

class ProfileEditActionSection extends StatelessWidget {
  final bool isSubmitting;
  final VoidCallback onSubmit;

  static const Color _coralColor = Color(0xFFFC6E58);

  const ProfileEditActionSection({
    super.key,
    required this.isSubmitting,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 36),
        const Divider(height: 1, color: Color(0xFFF0F1F3)),
        const SizedBox(height: 32),
        AppButton(
          text: 'Save Changes',
          onPressed: onSubmit,
          isLoading: isSubmitting,
          backgroundColor: _coralColor,
          textColor: Colors.white,
          borderRadius: BorderRadius.circular(27),
          height: 54,
          fullWidth: true,
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
