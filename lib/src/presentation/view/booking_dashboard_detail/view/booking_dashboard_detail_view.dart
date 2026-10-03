import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/di/dependency_injection.dart';
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
    final reasonController = TextEditingController(text: 'Change of schedule');

    showDialog(
      context: parentContext,
      builder: (dialogCtx) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Cancel Booking?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1E293B),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Please provide a reason for cancellation:',
                style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
              ),
              const SizedBox(height: 10),
              AppTextField(
                controller: reasonController,
                maxLines: 2,
                hint: 'Reason...',
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
              child: const Text(
                'No, Keep',
                style: TextStyle(
                  color: Color(0xFF64748B),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            AppButton(
              text: 'Yes, Cancel',
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

  void _connectSalon(BuildContext context, String? phone, String? storeName) {
    AppToastHelper.showInfo(
      context,
      message:
          'Connecting to ${storeName ?? 'Salon'} (${phone ?? '+84 912 345 678'})...',
    );
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
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppAppBar(
        title: 'Booking detail',
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
              // Cancel Button
              Expanded(
                child: AppButton(
                  text: 'Cancel',
                  onPressed: (canCancel && !isSubmittingAction)
                      ? () => _showCancelDialog(context)
                      : null,
                  variant: AppButtonVariant.outline,
                  isLoading: isSubmittingAction,
                  textColor: canCancel ? const Color(0xFFFA7762) : Colors.grey,
                  borderRadius: BorderRadius.circular(24),
                  height: 48,
                ),
              ),

              const SizedBox(width: 14),

              // Connect Button
              Expanded(
                child: AppButton(
                  text: 'Connect',
                  onPressed: () => _connectSalon(
                    context,
                    booking?.store?.address,
                    booking?.store?.name,
                  ),
                  backgroundColor: const Color(0xFFFA7762),
                  textColor: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  height: 48,
                ),
              ),
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
