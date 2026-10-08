import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';

class HomeHeaderCurvePainter extends CustomPainter {
  final Color baseColor;
  final Color waveColor;

  const HomeHeaderCurvePainter({
    this.baseColor = const Color(0xFFFFECE7),
    this.waveColor = const Color(0xFFFFF6F3),
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Back secondary wave (softer peach layer for depth)
    final backPaint = Paint()
      ..color = waveColor
      ..style = PaintingStyle.fill;

    final backPath = Path()
      ..lineTo(0, size.height - 32)
      ..quadraticBezierTo(
        size.width * 0.35,
        size.height + 4,
        size.width * 0.72,
        size.height - 36,
      )
      ..quadraticBezierTo(
        size.width * 0.88,
        size.height - 52,
        size.width,
        size.height - 24,
      )
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(backPath, backPaint);

    // 2. Front primary wave with smooth peach/coral gradient
    final frontPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [const Color(0xFFFFF3F0), baseColor],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final frontPath = Path()
      ..lineTo(0, size.height - 20)
      ..quadraticBezierTo(
        size.width * 0.28,
        size.height - 42,
        size.width * 0.62,
        size.height - 8,
      )
      ..quadraticBezierTo(
        size.width * 0.82,
        size.height + 8,
        size.width,
        size.height - 28,
      )
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(frontPath, frontPaint);
  }

  @override
  bool shouldRepaint(covariant HomeHeaderCurvePainter oldDelegate) => false;
}

class HomeHeaderSection extends StatelessWidget {
  final String greetingText;
  final String locationText;
  final String userAvatarSeed;
  final int notificationCount;
  final VoidCallback? onLocationTap;
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
    this.userAvatarSeed = 'KH',
    this.notificationCount = 3,
    this.onLocationTap,
    this.onNotificationTap,
    this.onAvatarTap,
    this.onSearchTap,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return CustomPaint(
      painter: const HomeHeaderCurvePainter(),
      child: Padding(
        padding: EdgeInsets.only(
          top: topPadding + 10,
          left: 20,
          right: 20,
          bottom: 38,
        ),
        child: Column(
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
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                        color: _textDark,
                        letterSpacing: -0.4,
                      ),
                    ),
                    const SizedBox(height: 4),
                    GestureDetector(
                      onTap: onLocationTap,
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.65),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.9),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              LucideIcons.map_pin,
                              size: 13,
                              color: _coralColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              locationText,
                              style: const TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF374151),
                              ),
                            ),
                            const SizedBox(width: 3),
                            const Icon(
                              LucideIcons.chevron_down,
                              size: 13,
                              color: Color(0xFF6B7280),
                            ),
                          ],
                        ),
                      ),
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
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0xFFF3D9D3),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.04),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: IconButton(
                            icon: const Icon(LucideIcons.bell, size: 20),
                            color: _textDark,
                            onPressed: onNotificationTap,
                            padding: const EdgeInsets.all(8),
                            constraints: const BoxConstraints(
                              minWidth: 40,
                              minHeight: 40,
                            ),
                          ),
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

                    // Avatar / Profile Initials (Matching user's coral circle badge)
                    GestureDetector(
                      onTap: onAvatarTap,
                      child: Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: _coralColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2.2),
                          boxShadow: [
                            BoxShadow(
                              color: _coralColor.withValues(alpha: 0.32),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            AvatarHelper.getInitials(userAvatarSeed),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 18),

            // Search Bar Row: Search Input + Coral Filter Button
            Row(
              children: [
                // Search Input Box
                Expanded(
                  child: GestureDetector(
                    onTap: onSearchTap,
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFFF3D9D3).withValues(alpha: 0.8),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            LucideIcons.search,
                            color: Color(0xFF9CA3AF),
                            size: 19,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            context.l10n.searchSalonsPlaceholder,
                            style: const TextStyle(
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
                  dimension: 48,
                  borderRadius: BorderRadius.circular(16),
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
        ),
      ),
    );
  }
}
