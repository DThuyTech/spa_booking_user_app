import 'package:flutter/material.dart';

class BookingResultSummaryCard extends StatelessWidget {
  final String bookingCode;
  final String salonName;
  final String dateDisplay;
  final String timeDisplay;
  final int totalAmount;

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

  String _formatVnd(int amount) {
    final str = amount.toString();
    final buffer = StringBuffer();
    int count = 0;
    for (int i = str.length - 1; i >= 0; i--) {
      buffer.write(str[i]);
      count++;
      if (count % 3 == 0 && i > 0) {
        buffer.write(',');
      }
    }
    return '${buffer.toString().split('').reversed.join('')} VND';
  }

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
          _buildRow(
            'Total Paid / Est.',
            _formatVnd(totalAmount),
            isTotal: true,
          ),
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
