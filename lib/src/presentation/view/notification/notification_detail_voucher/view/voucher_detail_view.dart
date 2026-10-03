import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../booking_flow/select_services/view/select_services_view.dart';
import 'package:spa_booking/src/shared/shared.dart';
import '../../models/notification_models.dart';
import '../body_view/voucher_detail_body_view.dart';
import '../mockup_data/voucher_detail_mock_data.dart';

@RoutePage()
class VoucherDetailPage extends StatelessWidget {
  final VoucherNotificationData? voucher;

  const VoucherDetailPage({super.key, this.voucher});

  @override
  Widget build(BuildContext context) {
    return VoucherDetailView(
      voucher: voucher ?? VoucherDetailMockData.defaultVoucher,
    );
  }
}

class VoucherDetailView extends StatelessWidget {
  final VoucherNotificationData voucher;

  const VoucherDetailView({
    super.key,
    this.voucher = VoucherDetailMockData.defaultVoucher,
  });

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);

  void _onBookNow(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const SelectServicesView(salonName: 'LUXE SALON'),
      ),
    );
  }

  void _onViewCoupon(BuildContext context) {
    Clipboard.setData(ClipboardData(text: voucher.code));
    AppToast.success(
      context,
      message: 'Voucher code "${voucher.code}" copied to clipboard!',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppAppBar(title: 'Detail', onMorePressed: () {}),
      body: VoucherDetailBodyView(voucher: voucher),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 14,
          bottom: MediaQuery.of(context).padding.bottom > 0
              ? MediaQuery.of(context).padding.bottom + 8
              : 16,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 14,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Coral "Book Now" Button
            Expanded(
              child: AppButton(
                text: 'Book Now',
                onPressed: () => _onBookNow(context),
                backgroundColor: _coralColor,
                textColor: Colors.white,
                borderRadius: BorderRadius.circular(24),
                height: 48,
              ),
            ),

            const SizedBox(width: 14),

            // Outlined "View Coupon" Button
            Expanded(
              child: AppButton(
                text: 'View Coupon',
                onPressed: () => _onViewCoupon(context),
                variant: AppButtonVariant.outline,
                textColor: _textDark,
                borderRadius: BorderRadius.circular(24),
                height: 48,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
