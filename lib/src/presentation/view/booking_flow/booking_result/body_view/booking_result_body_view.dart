import 'package:flutter/material.dart';
import '../../../../../shared/shared.dart';
import '../widgets/booking_result_summary_card.dart';

class BookingResultBodyView extends StatelessWidget {
  final bool isSuccess;
  final String bookingCode;
  final String salonName;
  final String dateDisplay;
  final String timeDisplay;
  final double totalAmount;
  final VoidCallback onPrimaryAction;
  final VoidCallback onSecondaryAction;
  final VoidCallback onToggleState;

  const BookingResultBodyView({
    super.key,
    required this.isSuccess,
    required this.bookingCode,
    required this.salonName,
    required this.dateDisplay,
    required this.timeDisplay,
    required this.totalAmount,
    required this.onPrimaryAction,
    required this.onSecondaryAction,
    required this.onToggleState,
  });

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 12),

          // 1. Result Status Icon (Success Check vs Failure Alert)
          _buildStatusIcon(),

          const SizedBox(height: 24),

          // 2. Result Title & Message
          Text(
            isSuccess ? 'Booking Confirmed!' : 'Booking Failed',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: _textDark,
              letterSpacing: -0.4,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            isSuccess
                ? 'Your appointment has been successfully scheduled with $salonName.'
                : 'We could not complete your booking request at this time. Please try selecting a different slot or try again.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: _textMuted,
              height: 1.45,
            ),
          ),

          const SizedBox(height: 28),

          // 3. Booking Details Summary Card
          BookingResultSummaryCard(
            bookingCode: bookingCode,
            salonName: salonName,
            dateDisplay: dateDisplay,
            timeDisplay: timeDisplay,
            totalAmount: totalAmount,
          ),

          const SizedBox(height: 28),

          // 4. Action Buttons
          AppButton(
            text: isSuccess ? 'View My Bookings' : 'Try Again',
            onPressed: onPrimaryAction,
            backgroundColor: isSuccess ? _coralColor : const Color(0xFFEF4444),
            textColor: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),

          const SizedBox(height: 12),

          AppButton(
            text: 'Back to Home',
            onPressed: onSecondaryAction,
            variant: AppButtonVariant.outline,
            textColor: const Color(0xFF475569),
            borderRadius: BorderRadius.circular(25),
          ),

          const SizedBox(height: 24),

          // Interactive Testing Switch (allows toggling Success / Fail in preview)
          GestureDetector(
            onTap: onToggleState,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isSuccess
                        ? LucideIcons.refresh_cw
                        : LucideIcons.circle_check,
                    size: 14,
                    color: const Color(0xFF64748B),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Preview ${isSuccess ? "Failed" : "Success"} State',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildStatusIcon() {
    final bgColor = isSuccess
        ? const Color(0xFFD1FAE5)
        : const Color(0xFFFEE2E2);
    final iconColor = isSuccess
        ? const Color(0xFF10B981)
        : const Color(0xFFEF4444);
    final icon = isSuccess ? LucideIcons.check : LucideIcons.circle_alert;

    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: iconColor.withValues(alpha: 0.20),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Center(child: Icon(icon, size: 44, color: iconColor)),
    );
  }
}
