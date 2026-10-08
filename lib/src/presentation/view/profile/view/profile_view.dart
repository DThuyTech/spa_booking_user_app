import 'package:auto_route/auto_route.dart';
import '../../../../app/di/dependency_injection.dart';
import '../../../../app/router/app_router.gr.dart';
import '../../../../shared/shared.dart';
import '../../../bloc/profile/profile_bloc.dart';
import '../widgets/profile_header_wave.dart';
import '../widgets/profile_menu_section.dart';
import '../widgets/profile_stats_row.dart';
import '../../../bloc/locale/locale_cubit.dart';
import '../../auth/change_password/view/change_password_view.dart';
import '../../booking_dashboard/view/booking_dashboard_view.dart';
import '../../insights/view/my_insights_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final l10n = context.l10n;
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            l10n.confirmLogout,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2C2420),
            ),
          ),
          content: Text(
            l10n.logoutMessage,
            style: const TextStyle(fontSize: 14, color: Color(0xFF7A6F68)),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(
                l10n.cancel,
                style: const TextStyle(
                  color: Color(0xFF7A6F68),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            AppButton(
              text: l10n.logout,
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context.read<ProfileBloc>().add(const ProfileLogoutRequested());
              },
              variant: AppButtonVariant.destructive,
              borderRadius: BorderRadius.circular(12),
              size: AppButtonSize.sm,
            ),
          ],
        );
      },
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    final l10n = context.l10n;
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEE2E2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.warning_amber_rounded,
                  color: Color(0xFFDC2626),
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  l10n.confirmDeleteAccount,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2C2420),
                  ),
                ),
              ),
            ],
          ),
          content: Text(
            l10n.deleteAccountMessage,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF7A6F68),
              height: 1.4,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(
                l10n.cancel,
                style: const TextStyle(
                  color: Color(0xFF7A6F68),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            AppButton(
              text: l10n.deletePermanently,
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context.read<ProfileBloc>().add(
                  const ProfileDeleteAccountRequested(),
                );
              },
              variant: AppButtonVariant.destructive,
              borderRadius: BorderRadius.circular(12),
              size: AppButtonSize.sm,
            ),
          ],
        );
      },
    );
  }

  void _showLanguageSheet(BuildContext context) {
    final l10n = context.l10n;
    final localeCubit = context.read<LocaleCubit>();
    final currentCode = localeCubit.state.locale.languageCode;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2E8F0),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  l10n.selectLanguage,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2C2420),
                  ),
                ),
                const SizedBox(height: 16),
                _buildLanguageTile(
                  title: 'Tiếng Việt',
                  subtitle: 'Vietnamese',
                  flag: '🇻🇳',
                  isSelected: currentCode == 'vi',
                  onTap: () {
                    localeCubit.setLocale(const Locale('vi'));
                    Navigator.of(sheetContext).pop();
                  },
                ),
                const SizedBox(height: 10),
                _buildLanguageTile(
                  title: 'English',
                  subtitle: 'Tiếng Anh',
                  flag: '🇬🇧',
                  isSelected: currentCode == 'en',
                  onTap: () {
                    localeCubit.setLocale(const Locale('en'));
                    Navigator.of(sheetContext).pop();
                  },
                ),
                const SizedBox(height: 14),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLanguageTile({
    required String title,
    required String subtitle,
    required String flag,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFFFFF0EC)
                : const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFFFA7762)
                  : const Color(0xFFE2E8F0),
              width: 1.2,
            ),
          ),
          child: Row(
            children: [
              Text(flag, style: const TextStyle(fontSize: 22)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: isSelected
                            ? const Color(0xFFBA4A32)
                            : const Color(0xFF1E293B),
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelected)
                const Icon(
                  Icons.check_circle_rounded,
                  color: Color(0xFFFA7762),
                  size: 22,
                )
              else
                Icon(
                  Icons.circle_outlined,
                  color: Colors.grey.shade400,
                  size: 22,
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
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
          if (state.isAccountDeleted) {
            AppToast.success(context, message: l10n.deleteAccountSuccess);
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
                  ProfileHeaderWave(user: state.user),

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
                            Navigator.of(context)
                                .push(
                                  MaterialPageRoute(
                                    builder: (_) => const BookingDashboardView(
                                      showAppBar: true,
                                      initialTab: 'UPCOMING',
                                    ),
                                  ),
                                )
                                .then((_) {
                                  if (context.mounted) {
                                    context.read<ProfileBloc>().add(
                                      const ProfileRefreshed(),
                                    );
                                  }
                                });
                          },
                          onCompletedTap: () {
                            Navigator.of(context)
                                .push(
                                  MaterialPageRoute(
                                    builder: (_) => const BookingDashboardView(
                                      showAppBar: true,
                                      initialTab: 'PAST',
                                    ),
                                  ),
                                )
                                .then((_) {
                                  if (context.mounted) {
                                    context.read<ProfileBloc>().add(
                                      const ProfileRefreshed(),
                                    );
                                  }
                                });
                          },
                          onCancelledTap: () {
                            Navigator.of(context)
                                .push(
                                  MaterialPageRoute(
                                    builder: (_) => const BookingDashboardView(
                                      showAppBar: true,
                                      initialTab: 'CANCELLED',
                                    ),
                                  ),
                                )
                                .then((_) {
                                  if (context.mounted) {
                                    context.read<ProfileBloc>().add(
                                      const ProfileRefreshed(),
                                    );
                                  }
                                });
                          },
                        ),

                        const SizedBox(height: 24),

                        // Account Section
                        ProfileMenuSection(
                          title: l10n.accountSection,
                          items: [
                            ProfileMenuItemData(
                              icon: LucideIcons.user,
                              title: l10n.personalInfo,
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
                              icon: LucideIcons.calendar,
                              title: l10n.myBookings,
                              onTap: () {
                                Navigator.of(context)
                                    .push(
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            const BookingDashboardView(
                                              showAppBar: true,
                                              initialTab: 'UPCOMING',
                                            ),
                                      ),
                                    )
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
                              title: l10n.savedAddresses,
                              onTap: () {
                                AppToast.info(
                                  context,
                                  message: l10n.savedAddresses,
                                );
                              },
                            ),
                            ProfileMenuItemData(
                              icon: LucideIcons.lock,
                              title: l10n.changePassword,
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

                        // Engagement & Settings Section
                        ProfileMenuSection(
                          title: l10n.engagementSection,
                          items: [
                            ProfileMenuItemData(
                              icon: LucideIcons.globe,
                              iconColor: const Color(0xFF2563EB),
                              title: l10n.language,
                              trailingText:
                                  context
                                      .watch<LocaleCubit>()
                                      .state
                                      .isVietnamese
                                  ? 'Tiếng Việt'
                                  : 'English',
                              onTap: () => _showLanguageSheet(context),
                            ),
                            ProfileMenuItemData(
                              icon: LucideIcons.trending_up,
                              iconColor: const Color(0xFFBA4A32),
                              title: l10n.insightsTitle,
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
                              title: l10n.favorites,
                              onTap: () {
                                context.router.push(FavoriteStoresRoute());
                              },
                            ),
                            ProfileMenuItemData(
                              icon: LucideIcons.star,
                              title: l10n.reviews,
                              onTap: () {
                                context.router.push(const UserReviewsRoute());
                              },
                            ),
                            ProfileMenuItemData(
                              icon: LucideIcons.settings,
                              title: l10n.settings,
                              onTap: () {
                                AppToast.info(context, message: l10n.settings);
                              },
                            ),
                            ProfileMenuItemData(
                              icon: LucideIcons.tag,
                              title: l10n.coupons,
                              onTap: () {
                                AppToast.info(context, message: l10n.coupons);
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 28),

                        // Logout Button
                        AppButton(
                          text: l10n.logout,
                          leadingIcon: const Icon(
                            LucideIcons.log_out,
                            size: 18,
                            color: Colors.white,
                          ),
                          onPressed: () => _showLogoutDialog(context),
                          isLoading: state.isLoggingOut,
                          variant: AppButtonVariant.destructive,
                          borderRadius: BorderRadius.circular(26),
                          height: 52,
                          fullWidth: true,
                        ),

                        const SizedBox(height: 12),

                        // Delete Account Button (Required for Apple Review Guideline 5.1.1(v))
                        Center(
                          child: TextButton.icon(
                            onPressed:
                                (state.isLoggingOut || state.isDeletingAccount)
                                ? null
                                : () => _showDeleteAccountDialog(context),
                            icon: state.isDeletingAccount
                                ? const SizedBox(
                                    width: 14,
                                    height: 14,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Color(0xFFDC2626),
                                    ),
                                  )
                                : const Icon(
                                    LucideIcons.trash,
                                    size: 16,
                                    color: Color(0xFFDC2626),
                                  ),
                            label: Text(
                              l10n.deleteAccount,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFDC2626),
                              ),
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
