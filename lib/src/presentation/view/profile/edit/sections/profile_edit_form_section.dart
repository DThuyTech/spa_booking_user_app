import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../shared/shared.dart';

class ProfileEditFormSection extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController dobController;
  final TextEditingController genderController;
  final VoidCallback onPickDob;
  final VoidCallback onSelectGender;
  final ValueChanged<String> onFullNameChanged;
  final ValueChanged<String> onPhoneNumberChanged;

  static const Color _coralColor = Color(0xFFFC6E58);
  static const Color _inputFillColor = Color(0xFFF4F6F8);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _labelColor = Color(0xFF2C2420);
  static const Color _hintColor = Color(0xFFB0B7C3);

  const ProfileEditFormSection({
    super.key,
    required this.fullNameController,
    required this.phoneNumberController,
    required this.dobController,
    required this.genderController,
    required this.onPickDob,
    required this.onSelectGender,
    required this.onFullNameChanged,
    required this.onPhoneNumberChanged,
  });

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    );

    const labelStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: _labelColor,
    );

    const inputStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: _textDark,
    );

    const hintStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: _hintColor,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name Field
        AppTextField(
          controller: fullNameController,
          label: context.l10n.name,
          labelStyle: labelStyle,
          hint: context.l10n.name,
          hintStyle: hintStyle,
          style: inputStyle,
          fillColor: _inputFillColor,
          border: inputBorder,
          enabledBorder: inputBorder,
          focusedBorder: inputBorder,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 15,
          ),
          onChanged: onFullNameChanged,
        ),

        const SizedBox(height: 20),

        // Name Field
        AppTextField(
          controller: phoneNumberController,
          label: context.l10n.phone,
          labelStyle: labelStyle,
          hint: context.l10n.enterPhone,
          hintStyle: hintStyle,
          style: inputStyle,
          fillColor: _inputFillColor,
          border: inputBorder,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(15),
          ],
          keyboardType: TextInputType.phone,
          enabledBorder: inputBorder,
          focusedBorder: inputBorder,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 15,
          ),
          onChanged: onPhoneNumberChanged,
        ),

        const SizedBox(height: 20),
        // Date of Birth Field
        AppTextField(
          controller: dobController,
          label: context.l10n.dateOfBirth,
          labelStyle: labelStyle,
          hint: '10/02/2002',
          hintStyle: hintStyle,
          style: inputStyle,
          fillColor: _inputFillColor,
          border: inputBorder,
          enabledBorder: inputBorder,
          focusedBorder: inputBorder,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 15,
          ),
          readOnly: true,
          onTap: onPickDob,
          suffixIcon: IconButton(
            icon: const Icon(
              LucideIcons.circle_alert,
              size: 20,
              color: _coralColor,
            ),
            onPressed: onPickDob,
          ),
        ),

        const SizedBox(height: 20),

        // Gender Field
        AppTextField(
          controller: genderController,
          label: context.l10n.gender,
          labelStyle: labelStyle,
          hint: context.l10n.selectGender,
          hintStyle: hintStyle,
          style: inputStyle,
          fillColor: _inputFillColor,
          border: inputBorder,
          enabledBorder: inputBorder,
          focusedBorder: inputBorder,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 15,
          ),
          readOnly: true,
          onTap: onSelectGender,
          suffixIcon: IconButton(
            icon: const Icon(
              LucideIcons.chevron_down,
              size: 20,
              color: _textDark,
            ),
            onPressed: onSelectGender,
          ),
        ),
      ],
    );
  }
}
