import 'package:flutter/material.dart';
import 'package:spa_booking/src/core/extensions/double_extensions.dart';

class BookingResultSummaryCard extends StatelessWidget {
  final String bookingCode;
  final String salonName;
  final String dateDisplay;
  final String timeDisplay;
  final double totalAmount;

  const BookingResultSummaryCard({
    super.key,
    required this.bookingCode,
    required this.salonName,
    required this.dateDisplay,
    required this.timeDisplay,
    required this.totalAmount,
  });

  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildRow('Booking Code', bookingCode, isBold: true),
          const Divider(height: 20, color: Color(0xFFF1F5F9)),
          _buildRow('Salon', salonName),
          const Divider(height: 20, color: Color(0xFFF1F5F9)),
          _buildRow('Date', dateDisplay),
          const Divider(height: 20, color: Color(0xFFF1F5F9)),
          _buildRow('Time', timeDisplay),
          const Divider(height: 20, color: Color(0xFFF1F5F9)),
          _buildRow('Total Paid / Est.', totalAmount.toVnd(), isTotal: true),
        ],
      ),
    );
  }

  Widget _buildRow(
    String label,
    String value, {
    bool isBold = false,
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w500,
            color: _textMuted,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 16 : 13.5,
            fontWeight: isBold || isTotal ? FontWeight.w800 : FontWeight.w600,
            color: isTotal ? const Color(0xFFFF6F59) : _textDark,
          ),
        ),
      ],
    );
  }
}
