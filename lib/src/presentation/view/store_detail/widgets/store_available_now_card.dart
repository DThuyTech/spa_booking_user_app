import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';

class StoreAvailableNowCard extends StatelessWidget {
  final int availableSeats;
  final String estimatedWait;
  final VoidCallback? onBookSeat;
  final bool isStoreOpen;

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF52525B);
  static const Color _cardBg = Colors.white;

  const StoreAvailableNowCard({
    super.key,
    this.availableSeats = 3,
    this.estimatedWait = '~5 min',
    this.onBookSeat,
    this.isStoreOpen = true,
  });

  @override
  Widget build(BuildContext context) {
    final isVi = Localizations.localeOf(context).languageCode == 'vi';

    final title = isStoreOpen
        ? context.l10n.availableNow
        : (isVi ? 'Đặt lịch hẹn trước' : 'Advance Booking');

    final subtitle = isStoreOpen
        ? (isVi
            ? 'Còn $availableSeats ghế trống • Thời gian chờ: $estimatedWait'
            : '$availableSeats seats available • Estimated wait: $estimatedWait')
        : (isVi
            ? 'Salon đang tạm đóng cửa. Bạn vẫn có thể chọn dịch vụ & đặt lịch trước cho các ngày tiếp theo!'
            : 'Salon is currently closed. You can book an appointment in advance for upcoming days!');

    final buttonText = isStoreOpen
        ? (isVi ? 'Đặt chỗ ngay' : 'Book a seat')
        : (isVi ? 'Đặt lịch trước ngay' : 'Book appointment');

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            // Decorative organic peach wave in top right
            Positioned(
              top: -15,
              right: -20,
              child: CustomPaint(
                size: const Size(130, 110),
                painter: _OrganicCurvePainter(),
              ),
            ),

            // Card content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: _textDark,
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500,
                      color: _textMuted,
                      height: 1.35,
                    ),
                  ),
                  const SizedBox(height: 18),
                  AppButton(
                    text: buttonText,
                    onPressed: onBookSeat,
                    backgroundColor: _coralColor,
                    textColor: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    height: 48,
                    fullWidth: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrganicCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFEECE7).withValues(alpha: 0.75)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width * 0.35, 0)
      ..cubicTo(
        size.width * 0.1,
        size.height * 0.45,
        size.width * 0.3,
        size.height * 0.85,
        size.width * 0.8,
        size.height,
      )
      ..cubicTo(
        size.width * 0.95,
        size.height * 0.9,
        size.width,
        size.height * 0.6,
        size.width,
        0,
      )
      ..close();

    canvas.drawPath(path, paint);

    final subPaint = Paint()
      ..color = const Color(0xFFFFDCD2).withValues(alpha: 0.45)
      ..style = PaintingStyle.fill;

    final subPath = Path()
      ..moveTo(size.width * 0.6, 0)
      ..cubicTo(
        size.width * 0.4,
        size.height * 0.35,
        size.width * 0.65,
        size.height * 0.7,
        size.width,
        size.height * 0.75,
      )
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(subPath, subPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
