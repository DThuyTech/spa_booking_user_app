import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:random_avatar/random_avatar.dart';
import '../../../../shared/design_system/components/buttons/app_icon_button.dart';

class HomeHeaderSection extends StatelessWidget {
  final String greetingText;
  final String locationText;
  final String userAvatarSeed;
  final int notificationCount;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onAvatarTap;
  final VoidCallback? onSearchTap;
  final VoidCallback? onFilterTap;

  static const Color _coralColor = Color(0xFFFC6E58);
  static const Color _textDark = Color(0xFF1E2022);

  const HomeHeaderSection({
    super.key,
    this.greetingText = 'Good morning',
    this.locationText = 'Ho Chi Minh City',
    this.userAvatarSeed = 'JA',
    this.notificationCount = 3,
    this.onNotificationTap,
    this.onAvatarTap,
    this.onSearchTap,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Row: Greeting & Sub-location, Notification Bell & Avatar
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left: Greeting & Location
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  greetingText,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: _textDark,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    const Icon(
                      LucideIcons.map_pin,
                      size: 13,
                      color: Color(0xFF6B7280),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      locationText,
                      style: const TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            // Right: Notification Bell with Badge & Avatar
            Row(
              children: [
                // Notification Bell
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    AppIconButton(
                      icon: LucideIcons.bell,
                      size: AppIconButtonSize.md,
                      onPressed: onNotificationTap,
                      backgroundColor: const Color(0xFFF4F6F8),
                      iconColor: _textDark,
                    ),
                    if (notificationCount > 0)
                      Positioned(
                        top: -2,
                        right: -2,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: _coralColor,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 17,
                            minHeight: 17,
                          ),
                          child: Text(
                            '$notificationCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),

                const SizedBox(width: 10),

                // Avatar / Profile Initials
                GestureDetector(
                  onTap: onAvatarTap,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF8B1D38),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: userAvatarSeed.length <= 2
                          ? Center(
                              child: Text(
                                userAvatarSeed,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          : RandomAvatar(userAvatarSeed, width: 40, height: 40),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Search Bar Row: Search Input + Coral Filter Button
        Row(
          children: [
            // Search Input Box
            Expanded(
              child: GestureDetector(
                onTap: onSearchTap,
                child: Container(
                  height: 46,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F6F8),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        LucideIcons.search,
                        color: Color(0xFF9CA3AF),
                        size: 19,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Search salons, services...',
                        style: TextStyle(
                          fontSize: 13.5,
                          color: Color(0xFF9CA3AF),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(width: 10),

            // Coral Filter Button
            AppIconButton(
              icon: LucideIcons.sliders_horizontal,
              onPressed: onFilterTap,
              dimension: 46,
              borderRadius: BorderRadius.circular(14),
              backgroundColor: _coralColor,
              iconColor: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: _coralColor.withValues(alpha: 0.35),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
