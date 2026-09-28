import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:board_oi/src/presentation/view/booking_flow/select_services/view/select_services_view.dart';
import 'package:board_oi/src/shared/design_system/components/navigation/app_app_bar.dart';
import 'package:board_oi/src/shared/widgets/toast/app_toast.dart';
import '../../models/notification_models.dart';
import '../body_view/voucher_detail_body_view.dart';
import '../mockup_data/voucher_detail_mock_data.dart';

@RoutePage()
class VoucherDetailPage extends StatelessWidget {
  final VoucherNotificationData voucher;

  const VoucherDetailPage({
    super.key,
    this.voucher = VoucherDetailMockData.defaultVoucher,
  });

  @override
  Widget build(BuildContext context) {
    return VoucherDetailView(voucher: voucher);
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
              child: SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () => _onBookNow(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _coralColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  child: const Text('Book Now'),
                ),
              ),
            ),

            const SizedBox(width: 14),

            // Outlined "View Coupon" Button
            Expanded(
              child: SizedBox(
                height: 48,
                child: OutlinedButton(
                  onPressed: () => _onViewCoupon(context),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: _textDark,
                    side: const BorderSide(
                      color: Color(0xFF475569),
                      width: 1.2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  child: const Text('View Coupon'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
