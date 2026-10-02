import 'package:auto_route/auto_route.dart';
import 'package:spa_booking/src/app/di/dependency_injection.dart';
import 'package:spa_booking/src/app/router/app_router.gr.dart';
import 'package:spa_booking/src/presentation/bloc/profile/profile_bloc.dart';
import 'package:spa_booking/src/presentation/view/profile/widgets/profile_header_wave.dart';
import 'package:spa_booking/src/presentation/view/profile/widgets/profile_menu_section.dart';
import 'package:spa_booking/src/presentation/view/profile/widgets/profile_stats_row.dart';
import 'package:spa_booking/src/presentation/view/auth/change_password/view/change_password_view.dart';
import 'package:spa_booking/src/presentation/view/favorite_stores/view/favorite_stores_view.dart';
import 'package:spa_booking/src/presentation/view/insights/view/my_insights_view.dart';
import 'package:spa_booking/src/shared/widgets/toast/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProfileBloc>()..add(const ProfileStarted()),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Logout',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2C2420),
            ),
          ),
          content: const Text(
            'Are you sure you want to log out of your account?',
            style: TextStyle(fontSize: 14, color: Color(0xFF7A6F68)),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Color(0xFF7A6F68),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context.read<ProfileBloc>().add(const ProfileLogoutRequested());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFBA1A1A),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Logout',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F3),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listenWhen: (previous, current) =>
            previous.status != current.status ||
            previous.errorMessage != current.errorMessage,
        listener: (context, state) {
          if (state.needsProfileSetup) {
            context.router
                .push(ProfileEditRoute(user: state.user, isInitialSetup: true))
                .then((_) {
                  if (context.mounted) {
                    context.read<ProfileBloc>().add(const ProfileRefreshed());
                  }
                });
            return;
          }
          if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
            AppToast.error(context, message: state.errorMessage!);
          }
          if (state.isLoggedOut) {
            AppToast.info(context, message: 'Logged out successfully');
            context.router.replaceAll([const LoginRoute()]);
          }
        },
        builder: (context, state) {
          return RefreshIndicator(
            color: const Color(0xFFBA4A32),
            onRefresh: () async {
              context.read<ProfileBloc>().add(const ProfileRefreshed());
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              child: Column(
                children: [
                  // Top Wave with Profile Avatar and Name
                  ProfileHeaderWave(
                    user: state.user,
                    onEditAvatar: () {
                      context.router
                          .push(ProfileEditRoute(user: state.user))
                          .then((_) {
                            if (context.mounted) {
                              context.read<ProfileBloc>().add(
                                const ProfileRefreshed(),
                              );
                            }
                          });
                    },
                  ),

                  // Content Body
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 22),

                        // Stats Row: Upcoming, Completed, Cancelled
                        ProfileStatsRow(
                          upcomingCount: state.upcomingCount,
                          completedCount: state.completedCount,
                          cancelledCount: state.cancelledCount,
                          onUpcomingTap: () {
                            AppToast.info(
                              context,
                              message: '2 Upcoming bookings',
                            );
                          },
                          onCompletedTap: () {
                            AppToast.info(
                              context,
                              message: '12 Completed bookings',
                            );
                          },
                          onCancelledTap: () {
                            AppToast.info(
                              context,
                              message: '1 Cancelled booking',
                            );
                          },
                        ),

                        const SizedBox(height: 24),

                        // Account Section
                        ProfileMenuSection(
                          title: 'ACCOUNT',
                          items: [
                            ProfileMenuItemData(
                              icon: LucideIcons.user,
                              title: 'Personal Info',
                              onTap: () {
                                context.router
                                    .push(ProfileEditRoute(user: state.user))
                                    .then((_) {
                                      if (context.mounted) {
                                        context.read<ProfileBloc>().add(
                                          const ProfileRefreshed(),
                                        );
                                      }
                                    });
                              },
                            ),
                            ProfileMenuItemData(
                              icon: LucideIcons.map_pin,
                              title: 'Saved Addresses',
                              onTap: () {
                                AppToast.info(
                                  context,
                                  message: 'Saved Addresses',
                                );
                              },
                            ),
                            ProfileMenuItemData(
                              icon: LucideIcons.lock,
                              title: 'Change Password',
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const ChangePasswordView(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Engagement Section
                        ProfileMenuSection(
                          title: 'ENGAGEMENT',
                          items: [
                            ProfileMenuItemData(
                              icon: LucideIcons.trending_up,
                              iconColor: const Color(0xFFBA4A32),
                              title: 'Summary & Revenue (Insights)',
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const MyInsightsView(),
                                  ),
                                );
                              },
                            ),
                            ProfileMenuItemData(
                              icon: LucideIcons.heart,
                              iconColor: const Color(0xFFD3523B),
                              title: 'Favorites',
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const FavoriteStoresView(),
                                  ),
                                );
                              },
                            ),
                            ProfileMenuItemData(
                              icon: LucideIcons.star,
                              title: 'Reviews',
                              onTap: () {
                                AppToast.info(context, message: 'Reviews');
                              },
                            ),
                            ProfileMenuItemData(
                              icon: LucideIcons.settings,
                              title: 'Setting',
                              onTap: () {
                                AppToast.info(context, message: 'Settings');
                              },
                            ),
                            ProfileMenuItemData(
                              icon: LucideIcons.tag,
                              title: 'Coupons',
                              onTap: () {
                                AppToast.info(
                                  context,
                                  message: 'Coupons & Vouchers',
                                );
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 28),

                        // Logout Button
                        SizedBox(
                          width: double.infinity,
                          height: 52,
                          child: ElevatedButton(
                            onPressed: state.isLoggingOut
                                ? null
                                : () => _showLogoutDialog(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFBA1A1A),
                              foregroundColor: Colors.white,
                              disabledBackgroundColor: const Color(
                                0xFFBA1A1A,
                              ).withValues(alpha: 0.6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(26),
                              ),
                              elevation: 2,
                              shadowColor: const Color(
                                0xFFBA1A1A,
                              ).withValues(alpha: 0.35),
                            ),
                            child: state.isLoggingOut
                                ? const SizedBox(
                                    width: 22,
                                    height: 22,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2.2,
                                    ),
                                  )
                                : const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        LucideIcons.log_out,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Logout',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 0.2,
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),

                        // Bottom space so content scrolls past floating island nav bar
                        const SizedBox(height: 120),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
