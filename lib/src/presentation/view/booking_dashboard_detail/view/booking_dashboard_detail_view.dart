import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../app/di/dependency_injection.dart';
import '../../../../app/router/app_router.gr.dart';
import '../../../../domain/entities/booking/booking_entity.dart';
import '../../../../shared/shared.dart';
import '../../../bloc/booking/booking_action/booking_action_bloc.dart';
import '../../../bloc/booking/booking_detail/booking_detail_bloc.dart';
import '../body_view/booking_dashboard_detail_body_view.dart';

class BookingDashboardDetailView extends StatelessWidget {
  final String? bookingId;

  const BookingDashboardDetailView({super.key, this.bookingId});

  @override
  Widget build(BuildContext context) {
    final effectiveId = bookingId ?? 'BK-TODAY-01';
    final hasBlocs =
        sl.isRegistered<BookingDetailBloc>() &&
        sl.isRegistered<BookingActionBloc>();
    if (!hasBlocs) {
      return _BookingDashboardDetailContent(bookingId: effectiveId);
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider<BookingDetailBloc>(
          create: (_) =>
              sl<BookingDetailBloc>()..add(LoadBookingDetailEvent(effectiveId)),
        ),
        BlocProvider<BookingActionBloc>(create: (_) => sl<BookingActionBloc>()),
      ],
      child: _BookingDashboardDetailContent(bookingId: effectiveId),
    );
  }
}

class _BookingDashboardDetailContent extends StatelessWidget {
  final String bookingId;

  const _BookingDashboardDetailContent({required this.bookingId});

  void _showCancelDialog(BuildContext parentContext) {
    final l10n = parentContext.l10n;
    final reasonController = TextEditingController(text: 'Change of schedule');

    showDialog(
      context: parentContext,
      builder: (dialogCtx) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            l10n.cancelBookingConfirm,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E293B),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.cancelReasonPrompt,
                style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
              ),
              const SizedBox(height: 10),
              AppTextField(
                controller: reasonController,
                maxLines: 2,
                hint: l10n.cancelReasonHint,
                fillColor: const Color(0xFFF8FAFC),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogCtx).pop(),
              child: Text(
                l10n.keepBooking,
                style: const TextStyle(
                  color: Color(0xFF64748B),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            AppButton(
              text: l10n.yesCancel,
              onPressed: () {
                final reason = reasonController.text.trim();
                Navigator.of(dialogCtx).pop();
                parentContext.read<BookingActionBloc>().add(
                  CancelBookingEvent(
                    bookingId: bookingId,
                    reason: reason.isNotEmpty ? reason : 'Customer cancelled',
                  ),
                );
              },
              variant: AppButtonVariant.destructive,
              borderRadius: BorderRadius.circular(10),
              size: AppButtonSize.sm,
            ),
          ],
        );
      },
    );
  }

  Future<void> _connectSalon(
    BuildContext context,
    String? phone,
    String? storeName,
  ) async {
    final l10n = context.l10n;
    final phoneNumber = (phone != null && phone.trim().isNotEmpty)
        ? phone.trim()
        : null;

    if (phoneNumber == null) {
      AppToastHelper.showWarning(context, message: l10n.noPhoneNumber);
      return;
    }

    final cleanedPhone = phoneNumber.replaceAll(RegExp(r'[^0-9+]'), '');
    final uri = Uri.parse('tel:$cleanedPhone');
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (_) {
      if (context.mounted) {
        AppToast.error(context, message: l10n.cannotCallPhone);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool hasBlocs = false;
    try {
      BlocProvider.of<BookingDetailBloc>(context);
      BlocProvider.of<BookingActionBloc>(context);
      hasBlocs = true;
    } catch (_) {
      hasBlocs = false;
    }

    if (!hasBlocs) {
      return _buildScaffold(
        context,
        canCancel: true,
        isSubmittingAction: false,
        isLoading: false,
        booking: null,
      );
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<BookingActionBloc, BookingActionState>(
          listener: (context, state) {
            if (state.isCancelledSuccess) {
              AppToastHelper.showSuccess(
                context,
                message: 'Booking cancelled successfully',
              );
              Navigator.of(context).pop(true);
            } else if (state.isNotesUpdatedSuccess) {
              AppToastHelper.showSuccess(
                context,
                message: 'Note updated successfully',
              );
            } else if (state.isFailure && state.failure != null) {
              AppToastHelper.showError(context, error: state.failure);
            }
          },
        ),
        BlocListener<BookingDetailBloc, BookingDetailState>(
          listener: (context, state) {
            if (state.isFailure && state.failure != null) {
              AppToastHelper.showError(context, error: state.failure);
            }
          },
        ),
      ],
      child: BlocBuilder<BookingDetailBloc, BookingDetailState>(
        builder: (context, detailState) {
          final isSubmittingAction = context
              .watch<BookingActionBloc>()
              .state
              .isLoading;
          final booking = detailState.booking;
          final canCancel = booking?.actions?.canCancel ?? true;

          return _buildScaffold(
            context,
            canCancel: canCancel,
            isSubmittingAction: isSubmittingAction,
            isLoading: detailState.isLoading,
            booking: booking,
          );
        },
      ),
    );
  }

  Widget _buildScaffold(
    BuildContext context, {
    required bool canCancel,
    required bool isSubmittingAction,
    required bool isLoading,
    required BookingEntity? booking,
  }) {
    final l10n = context.l10n;
    final isCompleted =
        (booking?.status.toUpperCase() == 'COMPLETED') ||
        (booking?.actions?.canReview ?? false);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppAppBar(
        title: l10n.bookingDetailTitle,
        onMorePressed: () {
          AppToastHelper.showInfo(context, message: 'More options');
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: Row(
            children: [
              if (isCompleted) ...[
                // Connect Button
                Expanded(
                  child: AppButton(
                    text: l10n.connectSalon,
                    onPressed: () => _connectSalon(
                      context,
                      booking?.store?.phoneNumber ?? '',
                      booking?.store?.name,
                    ),
                    variant: AppButtonVariant.outline,
                    textColor: const Color(0xFFFA7762),
                    borderRadius: BorderRadius.circular(24),
                    height: 48,
                  ),
                ),

                const SizedBox(width: 14),

                // Review Button
                Expanded(
                  child: AppButton(
                    text: l10n.review,
                    leadingIcon: const Icon(
                      LucideIcons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      final result = await context.router.push(
                        WriteReviewRoute(
                          bookingId: booking?.id ?? bookingId,
                          storeId: booking?.storeId ?? booking?.store?.id,
                          salonName: booking?.store?.name,
                          logoUrl: booking?.store?.logoUrl,
                        ),
                      );
                      if (result == true && context.mounted) {
                        try {
                          context.read<BookingDetailBloc>().add(
                            LoadBookingDetailEvent(booking?.id ?? bookingId),
                          );
                        } catch (_) {}
                      }
                    },
                    backgroundColor: const Color(0xFFFA7762),
                    textColor: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    height: 48,
                  ),
                ),
              ] else ...[
                // Cancel Button
                Expanded(
                  child: AppButton(
                    text: l10n.cancelBooking,
                    onPressed: (canCancel && !isSubmittingAction)
                        ? () => _showCancelDialog(context)
                        : null,
                    variant: AppButtonVariant.outline,
                    isLoading: isSubmittingAction,
                    textColor: canCancel
                        ? const Color(0xFFFA7762)
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(24),
                    height: 48,
                  ),
                ),

                const SizedBox(width: 14),

                // Connect Button (Triggers phone call to store)
                Expanded(
                  child: AppButton(
                    text: l10n.connectSalon,
                    onPressed: () => _connectSalon(
                      context,
                      booking?.store?.phoneNumber ?? '',
                      booking?.store?.name,
                    ),
                    backgroundColor: const Color(0xFFFA7762),
                    textColor: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    height: 48,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(color: Color(0xFFFA7762)),
              )
            : BookingDashboardDetailBodyView(booking: booking),
      ),
    );
  }
}
