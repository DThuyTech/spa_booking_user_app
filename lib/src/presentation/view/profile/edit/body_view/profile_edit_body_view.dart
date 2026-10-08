import 'package:flutter/material.dart';
import '../sections/profile_edit_action_section.dart';
import '../sections/profile_edit_avatar_section.dart';
import '../sections/profile_edit_form_section.dart';

class ProfileEditBodyView extends StatelessWidget {
  final String avatarSeed;
  final TextEditingController fullNameController;
  final TextEditingController dobController;
  final TextEditingController genderController;
  final TextEditingController phoneNumberController;

  final VoidCallback onPickDob;
  final VoidCallback onSelectGender;
  final ValueChanged<String> onFullNameChanged;
  final ValueChanged<String> onPhoneNumberChanged;

  final bool isSubmitting;
  final VoidCallback onSubmit;

  const ProfileEditBodyView({
    super.key,
    required this.avatarSeed,
    required this.fullNameController,
    required this.dobController,
    required this.genderController,
    required this.onPickDob,
    required this.onSelectGender,
    required this.onFullNameChanged,
    required this.isSubmitting,
    required this.onSubmit,
    required this.phoneNumberController,
    required this.onPhoneNumberChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileEditAvatarSection(avatarSeed: avatarSeed),
          ProfileEditFormSection(
            fullNameController: fullNameController,
            dobController: dobController,
            genderController: genderController,
            onPickDob: onPickDob,
            onSelectGender: onSelectGender,
            onFullNameChanged: onFullNameChanged,
            phoneNumberController: phoneNumberController,
            onPhoneNumberChanged: onPhoneNumberChanged,
          ),
          ProfileEditActionSection(
            isSubmitting: isSubmitting,
            onSubmit: onSubmit,
          ),
        ],
      ),
    );
  }
}
