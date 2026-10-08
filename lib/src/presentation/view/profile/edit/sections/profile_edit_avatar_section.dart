import 'package:flutter/material.dart';
import '../../../../../shared/shared.dart';

class ProfileEditAvatarSection extends StatelessWidget {
  final String avatarSeed;

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
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFFC6E58), Color(0xFFD6452E)],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFC6E58).withValues(alpha: 0.3),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
              border: Border.all(color: Colors.white, width: 4),
            ),
            child: Center(
              child: Text(
                AvatarHelper.getInitials(avatarSeed),
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
