import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';
import 'store_detail_tab_bar_section.dart';

class StoreDetailBottomBarSection extends StatelessWidget {
  final StoreDetailTab activeTab;
  final String startingPrice;
  final String seatsText;
  final VoidCallback? onBookNow;
  final VoidCallback? onBookAppointment;
  final bool isStoreOpen;

  static const Color _appointmentBtnColor = Color(0xFFA53C2A);

  const StoreDetailBottomBarSection({
    super.key,
    required this.activeTab,
    this.startingPrice = r'From $15',
    this.seatsText = '3 seats available',
    this.onBookNow,
    this.onBookAppointment,
    this.isStoreOpen = true,
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
      child: _buildFullAppointmentBar(context),
    );
  }

  Widget _buildFullAppointmentBar(BuildContext context) {
    final isVi = Localizations.localeOf(context).languageCode == 'vi';
    return AppButton(
      text: isVi ? 'Đặt lịch hẹn' : 'Book Appointment',
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
