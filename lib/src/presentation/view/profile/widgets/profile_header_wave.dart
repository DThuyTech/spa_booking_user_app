import 'package:spa_booking/src/domain/entities/auth/user.dart';
import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';

class ProfileHeaderWaveClipper extends CustomClipper<Path> {
  const ProfileHeaderWaveClipper();

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.74);

    // Deep smooth valley in the center-left
    path.cubicTo(
      size.width * 0.18,
      size.height * 0.94,
      size.width * 0.38,
      size.height * 0.96,
      size.width * 0.55,
      size.height * 0.80,
    );

    // Smooth crest curve towards the right
    path.cubicTo(
      size.width * 0.70,
      size.height * 0.66,
      size.width * 0.85,
      size.height * 0.66,
      size.width,
      size.height * 0.72,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class ProfileHeaderWave extends StatelessWidget {
  final User? user;
  final VoidCallback? onEditAvatar;

  const ProfileHeaderWave({super.key, required this.user, this.onEditAvatar});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final displayName = (user?.fullName != null && user!.fullName.isNotEmpty)
        ? user!.fullName
        : 'Eva Huff';
    final displayContact = (user?.phone != null && user!.phone.isNotEmpty)
        ? user!.phone
        : (user?.email != null && user!.email.isNotEmpty
              ? user!.email
              : '+1 234 567 890');

    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        // Pink/Blush Wavy Background
        ClipPath(
          clipper: const ProfileHeaderWaveClipper(),
          child: Container(
            width: screenWidth,
            height: 240,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFDECE9),
                  Color(0xFFFDE3DF),
                  Color(0xFFFCDED9),
                ],
              ),
            ),
          ),
        ),

        // Avatar + Name + Contact Column
        Padding(
          padding: const EdgeInsets.only(top: 64),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Avatar with white border and edit badge
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 112,
                      height: 112,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width: 4),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(
                              0xFFD4A394,
                            ).withValues(alpha: 0.25),
                            blurRadius: 18,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: user?.avatar != null && user!.avatar!.isNotEmpty
                            ? Image.network(
                                user!.avatar!,
                                width: 104,
                                height: 104,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    _buildInitialsAvatar(),
                              )
                            : _buildInitialsAvatar(),
                      ),
                    ),

                    // Edit button badge
                    if (onEditAvatar != null)
                      Positioned(
                        bottom: 2,
                        right: 2,
                        child: GestureDetector(
                          onTap: onEditAvatar,
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFE55D47),
                              border: Border.all(
                                color: Colors.white,
                                width: 2.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xFFE55D47,
                                  ).withValues(alpha: 0.35),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                LucideIcons.pencil,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // Full Name
              Text(
                displayName,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.4,
                  color: Color(0xFF2C2420),
                ),
              ),

              const SizedBox(height: 4),

              // Phone / Email subtitle
              Text(
                displayContact,
                style: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF8A7D75),
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInitialsAvatar() {
    final initials = AvatarHelper.getInitials(user?.fullName);
    return Container(
      width: 104,
      height: 104,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFC6E58), Color(0xFFD6452E)],
        ),
      ),
      child: Center(
        child: Text(
          initials,
          style: const TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
