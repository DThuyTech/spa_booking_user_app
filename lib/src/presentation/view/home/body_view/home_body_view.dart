import 'package:board_oi/src/core/localization/app_localizations.dart';
import 'package:board_oi/src/shared/design_system/tokens/app_colors.dart';
import 'package:board_oi/src/shared/design_system/tokens/app_radius.dart';
import 'package:board_oi/src/shared/design_system/tokens/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../sections/home_booking_section.dart';
import '../sections/home_category_section.dart';
import '../sections/home_header_section.dart';
import '../sections/home_search_section.dart';
import '../sections/home_store_section.dart';
import '../widgets/home_skeleton.dart';

class HomeBodyView extends StatelessWidget {
  final VoidCallback? onSearchTap;
  final VoidCallback? onFilterTap;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onAvatarTap;
  final VoidCallback? onBookingCardTap;
  final VoidCallback? onBookAppointmentTap;
  final ValueChanged<String>? onCategorySelected;
  final VoidCallback? onSeeAllCategoriesTap;
  final VoidCallback? onStoreTap;

  const HomeBodyView({
    super.key,
    this.onSearchTap,
    this.onFilterTap,
    this.onNotificationTap,
    this.onAvatarTap,
    this.onBookingCardTap,
    this.onBookAppointmentTap,
    this.onCategorySelected,
    this.onSeeAllCategoriesTap,
    this.onStoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.greeting != current.greeting,
      builder: (context, state) {
        if (state.isLoading) {
          return const SafeArea(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: HomeSkeleton(),
            ),
          );
        }

        if (state.isFailure && !state.hasGreeting) {
          return SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      LucideIcons.circle_alert,
                      size: 44,
                      color: AppColors.error,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      state.errorMessage ?? context.l10n.errorOccurred,
                      style: AppTypography.titleMedium.copyWith(
                        color: AppColors.darkBrown,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.read<HomeBloc>().add(const HomeRetried());
                      },
                      icon: const Icon(LucideIcons.rotate_cw, size: 16),
                      label: Text(context.l10n.retry),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBrown,
                        foregroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: AppRadius.borderButton,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return RefreshIndicator(
          color: AppColors.primaryBrown,
          backgroundColor: AppColors.surface,
          onRefresh: () async {
            context.read<HomeBloc>().add(const HomeRefreshed());
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 1. Header Section (Customer greeting, notification, avatar)
                    HomeHeaderSection(
                      subtitle: state.greeting?.message,
                      onNotificationTap: onNotificationTap,
                      onAvatarTap: onAvatarTap,
                    ),
                    const SizedBox(height: 20),

                    // 2. Search Section (Entry point for salon/service search)
                    HomeSearchSection(
                      onSearchTap: onSearchTap,
                      onFilterTap: onFilterTap,
                    ),
                    const SizedBox(height: 24),

                    // 3. Upcoming Booking Section
                    HomeBookingSection(
                      onBookingCardTap: onBookingCardTap,
                      onBookAppointmentTap: onBookAppointmentTap,
                    ),
                    const SizedBox(height: 24),

                    // 4. Categories Section (Haircut, Spa, Nails, etc.)
                    HomeCategorySection(
                      onCategorySelected: onCategorySelected,
                      onSeeAllTap: onSeeAllCategoriesTap,
                    ),
                    const SizedBox(height: 24),

                    // 5. Stores Section (Recommended salons)
                    HomeStoreSection(
                      onStoreTap: onStoreTap,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
