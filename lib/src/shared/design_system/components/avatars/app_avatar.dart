import 'package:flutter/material.dart';
import '../../tokens/app_colors.dart';

enum AppAvatarSize { xs, sm, md, lg, xl }

class AppAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final IconData? icon;
  final AppAvatarSize size;
  final bool? isOnline;
  final VoidCallback? onTap;

  const AppAvatar({
    super.key,
    this.imageUrl,
    this.name,
    this.icon,
    this.size = AppAvatarSize.md,
    this.isOnline,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double dimension = switch (size) {
      AppAvatarSize.xs => 24.0,
      AppAvatarSize.sm => 32.0,
      AppAvatarSize.md => 40.0,
      AppAvatarSize.lg => 56.0,
      AppAvatarSize.xl => 72.0,
    };

    final double fontSize = dimension * 0.38;
    final double statusSize = dimension * 0.28;

    Widget avatarChild;

    if (imageUrl != null && imageUrl!.isNotEmpty) {
      avatarChild = ClipOval(
        child: Image.network(
          imageUrl!,
          width: dimension,
          height: dimension,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              _buildFallback(fontSize),
        ),
      );
    } else {
      avatarChild = _buildFallback(fontSize);
    }

    final avatar = Container(
      width: dimension,
      height: dimension,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: avatarChild,
    );

    if (isOnline == null) {
      return _wrapTap(avatar);
    }

    return _wrapTap(
      Stack(
        clipBehavior: Clip.none,
        children: [
          avatar,
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: statusSize,
              height: statusSize,
              decoration: BoxDecoration(
                color: isOnline! ? AppColors.success : AppColors.neutral400,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFallback(double fontSize) {
    final initials = _extractInitials(name);

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primary100,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: initials != null
            ? Text(
                initials,
                style: TextStyle(
                  color: AppColors.primary700,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Icon(
                icon ?? Icons.person_rounded,
                color: AppColors.primary600,
                size: fontSize * 1.5,
              ),
      ),
    );
  }

  Widget _wrapTap(Widget child) {
    if (onTap == null) return child;
    return GestureDetector(onTap: onTap, child: child);
  }

  static String? _extractInitials(String? text) {
    if (text == null || text.trim().isEmpty) return null;
    final parts = text.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return null;
    if (parts.length == 1) {
      return parts.first
          .substring(0, parts.first.length.clamp(1, 2))
          .toUpperCase();
    }
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }
}
