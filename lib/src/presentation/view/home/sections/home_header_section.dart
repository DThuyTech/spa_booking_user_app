import 'package:board_oi/src/presentation/bloc/auth_session/auth_session_bloc.dart';
import 'package:board_oi/src/shared/design_system/tokens/app_colors.dart';
import 'package:board_oi/src/shared/design_system/tokens/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../widgets/home_greeting.dart';

/// Top header section displaying customer greeting, avatar, and notification trigger.
class HomeHeaderSection extends StatelessWidget {
  final String? subtitle;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onAvatarTap;

  const HomeHeaderSection({
    super.key,
    this.subtitle,
    this.onNotificationTap,
    this.onAvatarTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthSessionBloc, AuthSessionState, String?>(
      selector: (state) => state.user?.fullName,
      builder: (context, fullName) {
        final user = context.read<AuthSessionBloc>().state.user;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left: Greeting with name and subtitle
            Expanded(
              child: HomeGreeting(
                user: user,
                subtitle: subtitle,
              ),
            ),
            const SizedBox(width: 12),

            // Notification Bell
            InkWell(
              onTap: onNotificationTap,
              borderRadius: BorderRadius.circular(22),
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.border, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.darkBrown.withValues(alpha: 0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    LucideIcons.bell,
                    size: 20,
                    color: AppColors.darkBrown,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),

            // Customer Avatar
            InkWell(
              onTap: onAvatarTap,
              borderRadius: BorderRadius.circular(22),
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.primary50,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.border.withValues(alpha: 0.8),
                    width: 1.2,
                  ),
                ),
                child: Center(
                  child: user?.avatar != null
                      ? ClipOval(
                          child: Image.network(
                            user!.avatar!,
                            width: 44,
                            height: 44,
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => _buildInitial(user.fullName),
                          ),
                        )
                      : _buildInitial(user?.fullName),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInitial(String? name) {
    final initial = (name != null && name.trim().isNotEmpty)
        ? name.trim()[0].toUpperCase()
        : null;

    if (initial != null) {
      return Text(
        initial,
        style: AppTypography.titleMedium.copyWith(
          color: AppColors.primaryBrown,
          fontWeight: FontWeight.w700,
        ),
      );
    }

    return const Icon(
      LucideIcons.user,
      size: 20,
      color: AppColors.primaryBrown,
    );
  }
}
