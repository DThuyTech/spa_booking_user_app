import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';
import 'store_detail_tab_bar_section.dart';

class StoreDetailBottomBarSection extends StatelessWidget {
  final StoreDetailTab activeTab;
  final String startingPrice;
  final String seatsText;
  final VoidCallback? onBookNow;
  final VoidCallback? onBookAppointment;

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _appointmentBtnColor = Color(0xFFA53C2A);
  static const Color _textDark = Color(0xFF1E2022);

  const StoreDetailBottomBarSection({
    super.key,
    required this.activeTab,
    this.startingPrice = r'From $15',
    this.seatsText = '3 seats available',
    this.onBookNow,
    this.onBookAppointment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 12,
        bottom: MediaQuery.of(context).padding.bottom > 0
            ? MediaQuery.of(context).padding.bottom + 8
            : 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: activeTab == StoreDetailTab.overview
          ? _buildOverviewBar()
          : _buildFullAppointmentBar(),
    );
  }

  Widget _buildOverviewBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              startingPrice,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: _textDark,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              seatsText,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: _coralColor,
              ),
            ),
          ],
        ),
        AppButton(
          text: 'Book now',
          onPressed: onBookNow,
          backgroundColor: _coralColor,
          textColor: Colors.white,
          borderRadius: BorderRadius.circular(22),
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 28),
        ),
      ],
    );
  }

  Widget _buildFullAppointmentBar() {
    return AppButton(
      text: 'Book Appointment',
      leadingIcon: const Icon(
        LucideIcons.calendar,
        size: 18,
        color: Colors.white,
      ),
      onPressed: onBookAppointment ?? onBookNow,
      backgroundColor: _appointmentBtnColor,
      textColor: Colors.white,
      borderRadius: BorderRadius.circular(24),
      height: 48,
      fullWidth: true,
    );
  }
}
