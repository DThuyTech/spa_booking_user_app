import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import '../../../../../shared/widgets/toast/app_toast.dart';

class ProfileEditAvatarSection extends StatelessWidget {
  final String avatarSeed;

  static const Color _coralColor = Color(0xFFFC6E58);

  const ProfileEditAvatarSection({super.key, this.avatarSeed = 'Eva Huff'});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Center(
          child: Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFF3F5F7),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
              border: Border.all(color: Colors.white, width: 4),
            ),
            child: ClipOval(
              child: RandomAvatar(
                avatarSeed.isNotEmpty ? avatarSeed : 'Eva Huff',
                height: 102,
                width: 102,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: () {
            AppToast.info(context, message: 'Photo upload feature coming soon');
          },
          borderRadius: BorderRadius.circular(8),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Text(
              'Change Photo',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: _coralColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: 28),
      ],
    );
  }
}
