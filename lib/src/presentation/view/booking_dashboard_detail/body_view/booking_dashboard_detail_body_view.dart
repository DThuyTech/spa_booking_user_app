import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:spa_booking/src/core/extensions/double_extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../domain/entities/booking/booking_entity.dart';
import '../../../../shared/shared.dart';
import '../../../bloc/booking/booking_action/booking_action_bloc.dart';

class BookingDashboardDetailBodyView extends StatefulWidget {
  final BookingEntity? booking;

  const BookingDashboardDetailBodyView({super.key, this.booking});

  @override
  State<BookingDashboardDetailBodyView> createState() =>
      _BookingDashboardDetailBodyViewState();
}

class _BookingDashboardDetailBodyViewState
    extends State<BookingDashboardDetailBodyView> {
  late final TextEditingController _noteController;

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF64748B);

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController();
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _onUpdateNote() {
    final text = _noteController.text.trim();
    if (text.isEmpty) {
      AppToast.warning(context, message: 'Vui lòng nhập nội dung ghi chú');
      return;
    }

    if (widget.booking != null) {
      context.read<BookingActionBloc>().add(
        UpdateBookingNotesEvent(bookingId: widget.booking!.id, note: text),
      );
      _noteController.clear();
      FocusScope.of(context).unfocus();
    }
  }

  Future<void> _makeCall(String? phone) async {
    if (phone == null || phone.trim().isEmpty) return;
    final cleaned = phone.replaceAll(RegExp(r'[^0-9+]'), '');
    final uri = Uri.parse('tel:$cleaned');
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final b = widget.booking;
    if (b == null) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 60),
          child: CircularProgressIndicator(color: _coralColor),
        ),
      );
    }

    final isVi = Localizations.localeOf(context).languageCode == 'vi';

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ==========================================
          // FORM 1: SALON, THỜI GIAN, DỊCH VỤ & THỢ
          // ==========================================
          _buildBookingInfoForm(b, isVi),

          const SizedBox(height: 12),

          // ==========================================
          // FORM 2: CHI PHÍ & THANH TOÁN
          // ==========================================
          _buildTotalAmountForm(b, isVi),

          const SizedBox(height: 12),

          // ==========================================
          // THÔNG BÁO HỦY LỊCH (NẾU ĐÃ HỦY)
          // ==========================================
          if (b.status.toUpperCase() == 'CANCELLED') ...[
            _buildCancellationNotice(b, isVi),
            const SizedBox(height: 12),
          ],

          // ==========================================
          // GHI CHÚ (NOTE FIELD SỬ DỤNG APP TEXT FIELD)
          // ==========================================
          _buildNoteSection(b, isVi),

          const SizedBox(height: 80),
        ],
      ),
    );
  }

  // MARK: - FORM 1: Thông tin Lịch Hẹn
  Widget _buildBookingInfoForm(BookingEntity b, bool isVi) {
    final salonName = b.store?.name ?? (isVi ? 'Salon Spa' : 'Salon Spa');
    final salonAddress = b.store?.address ?? '';
    final salonPhone = b.store?.phoneNumber ?? '';

    // Format ngày giờ
    final dateDisplay = DateFormat(
      'EEEE, dd/MM/yyyy',
      isVi ? 'vi' : 'en_US',
    ).format(b.startAt);
    final timeFmt = DateFormat('hh:mm a', 'en_US');
    final timeDisplay =
        '${timeFmt.format(b.startAt)} - ${timeFmt.format(b.endAt)}';
    final durationDisplay =
        '${b.totalDuration.toInt()} ${isVi ? "phút" : "min"}';

    final staffNameDisplay = b.staffSnapshot?.name.isNotEmpty == true
        ? b.staffSnapshot!.name
        : (isVi ? 'Chuyên viên được phân công' : 'Assigned Specialist');

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.025),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ----------------------------------------------------
          // SESSION 1: TÊN SALON & MÃ LỊCH HẸN & TRẠNG THÁI
          // ----------------------------------------------------
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: _coralColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    LucideIcons.store,
                    size: 20,
                    color: _coralColor,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        salonName,
                        style: const TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w700,
                          color: _textDark,
                          letterSpacing: -0.2,
                        ),
                      ),
                      Row(
                        children: [
                          _buildStatusBadge(b.status, isVi),
                          if (b.bookingCode.isNotEmpty) ...[
                            const SizedBox(width: 8),
                            Text(
                              '#${b.bookingCode}',
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF94A3B8),
                              ),
                            ),
                          ],
                        ],
                      ),
                      if (b.customerSnapshot != null &&
                          (b.customerSnapshot!.name.isNotEmpty ||
                              b.customerSnapshot!.phoneNumber.isNotEmpty)) ...[
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(
                              LucideIcons.user,
                              size: 11.5,
                              color: _textMuted,
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                '${isVi ? "Khách: " : "Customer: "}${b.customerSnapshot!.name}${b.customerSnapshot!.phoneNumber.isNotEmpty ? " • ${b.customerSnapshot!.phoneNumber}" : ""}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 11.5,
                                  color: _textMuted,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                      if (salonAddress.isNotEmpty) ...[
                        const SizedBox(height: 5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              LucideIcons.map_pin,
                              size: 11.5,
                              color: _textMuted,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                salonAddress,
                                style: const TextStyle(
                                  fontSize: 11.5,
                                  color: _textMuted,
                                  height: 1.3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                      if (salonPhone.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        GestureDetector(
                          onTap: () => _makeCall(salonPhone),
                          child: Row(
                            children: [
                              const Icon(
                                LucideIcons.phone,
                                size: 11.5,
                                color: _coralColor,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                salonPhone,
                                style: const TextStyle(
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w600,
                                  color: _coralColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Divider ngắn ở giữa session 1 và 2
          const Divider(
            height: 1,
            color: Color(0xFFF1F5F9),
            indent: 14,
            endIndent: 14,
          ),

          // ----------------------------------------------------
          // SESSION 2: THỜI GIAN HẸN
          // ----------------------------------------------------
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    LucideIcons.calendar,
                    size: 19,
                    color: Color(0xFF475569),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isVi ? 'Thời gian hẹn' : 'Appointment Schedule',
                        style: const TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w600,
                          color: _textMuted,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        dateDisplay,
                        style: const TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w700,
                          color: _textDark,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const Icon(
                            LucideIcons.clock,
                            size: 12,
                            color: _coralColor,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '$timeDisplay ($durationDisplay)',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: _coralColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Divider ngắn ở giữa session 2 và 3
          const Divider(
            height: 1,
            color: Color(0xFFF1F5F9),
            indent: 14,
            endIndent: 14,
          ),

          // ----------------------------------------------------
          // SESSION 3: DỊCH VỤ + NHÂN VIÊN LÀM
          // ----------------------------------------------------
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isVi
                          ? 'Dịch vụ đã đặt (${b.services.length})'
                          : 'Booked Services (${b.services.length})',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: _textMuted,
                      ),
                    ),
                    const Icon(
                      LucideIcons.sparkles,
                      size: 14,
                      color: Color(0xFF94A3B8),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Danh sách từng dịch vụ
                ...b.services.asMap().entries.map((entry) {
                  final index = entry.key;
                  final service = entry.value;
                  final isLast = index == b.services.length - 1;

                  return Padding(
                    padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                service.name,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: _textDark,
                                  letterSpacing: -0.1,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              service.price.toVnd(),
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: _textDark,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Row(
                          children: [
                            const Icon(
                              LucideIcons.clock,
                              size: 11,
                              color: _textMuted,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              service.startAt != null && service.endAt != null
                                  ? '${DateFormat('HH:mm').format(service.startAt!.toLocal())} - ${DateFormat('HH:mm').format(service.endAt!.toLocal())} (${service.duration} ${isVi ? "phút" : "min"})'
                                  : '${service.duration} ${isVi ? "phút" : "min"}',
                              style: const TextStyle(
                                fontSize: 11,
                                color: _textMuted,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              '•',
                              style: TextStyle(
                                color: Color(0xFFCBD5E1),
                                fontSize: 10,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              LucideIcons.user,
                              size: 11,
                              color: _coralColor,
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                (service.staffName != null &&
                                        service.staffName!.isNotEmpty)
                                    ? service.staffName!
                                    : staffNameDisplay,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: _coralColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (!isLast) ...[
                          const SizedBox(height: 10),
                          const Divider(height: 1, color: Color(0xFFF8FAFC)),
                        ],
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // MARK: - FORM 2: Total Amount & Chi Phí
  Widget _buildTotalAmountForm(BookingEntity b, bool isVi) {
    final subtotal = b.subtotal ?? b.totalAmount;
    final discount = b.discountAmount ?? 0;
    final paymentMethodText = _formatPaymentMethod(b.paymentMethod, isVi);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.025),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isVi ? 'Chi tiết thanh toán' : 'Payment Details',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: _textMuted,
                ),
              ),
              _buildPaymentStatusBadge(b.paymentStatus, isVi),
            ],
          ),
          const SizedBox(height: 10),

          // Tạm tính
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isVi ? 'Tạm tính' : 'Subtotal',
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF64748B),
                ),
              ),
              Text(
                subtotal.toVnd(),
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: _textDark,
                ),
              ),
            ],
          ),

          if (discount > 0) ...[
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isVi ? 'Giảm giá' : 'Discount',
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF64748B),
                  ),
                ),
                Text(
                  '-${discount.toVnd()}',
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF10B981),
                  ),
                ),
              ],
            ),
          ],

          const SizedBox(height: 8),

          // Phương thức thanh toán
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isVi ? 'Phương thức' : 'Payment Method',
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF64748B),
                ),
              ),
              Text(
                paymentMethodText,
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: _textDark,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Divider nét đứt
          _buildDashedDivider(),

          const SizedBox(height: 10),

          // Dòng Tổng thanh toán
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isVi ? 'Tổng thanh toán:' : 'Total Amount:',
                style: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w700,
                  color: _textDark,
                  letterSpacing: -0.1,
                ),
              ),
              Text(
                b.totalAmount.toVnd(),
                style: const TextStyle(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w800,
                  color: _coralColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // MARK: - Ghi Chú & Cập Nhật Ghi Chú (AppTextField)
  Widget _buildNoteSection(BookingEntity b, bool isVi) {
    final existingNote =
        (b.note != null && b.note!.trim().isNotEmpty && b.note!.trim() != '-')
        ? b.note!.trim()
        : null;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.025),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(LucideIcons.pencil, size: 14, color: _coralColor),
              const SizedBox(width: 8),
              Text(
                isVi ? 'Ghi chú lịch hẹn' : 'Booking Notes',
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w700,
                  color: _textDark,
                ),
              ),
            ],
          ),
          if (existingNote != null) ...[
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFF1F5F9)),
              ),
              child: Text(
                existingNote,
                style: const TextStyle(
                  fontSize: 12.5,
                  color: Color(0xFF334155),
                  height: 1.4,
                ),
              ),
            ),
          ],
          const SizedBox(height: 10),
          AppTextField(
            controller: _noteController,
            hint: isVi
                ? 'Thêm yêu cầu hoặc cập nhật ghi chú...'
                : 'Add special request or update notes...',
            maxLines: 2,
            minLines: 1,
            fillColor: const Color(0xFFF8FAFC),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFEDF0F3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: _coralColor),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 34,
              child: AppButton(
                text: isVi ? 'Cập nhật ghi chú' : 'Save Note',
                size: AppButtonSize.sm,
                onPressed: _onUpdateNote,
                backgroundColor: _coralColor,
                textColor: Colors.white,
                borderRadius: BorderRadius.circular(17),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // MARK: - Thông Báo Hủy Lịch
  Widget _buildCancellationNotice(BookingEntity b, bool isVi) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF2F2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFFEE2E2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            LucideIcons.circle_alert,
            size: 18,
            color: Color(0xFFDC2626),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isVi ? 'Lịch hẹn đã bị hủy' : 'Booking Cancelled',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF991B1B),
                  ),
                ),
                if (b.cancellationReason != null &&
                    b.cancellationReason!.isNotEmpty) ...[
                  const SizedBox(height: 3),
                  Text(
                    '${isVi ? "Lý do: " : "Reason: "}${b.cancellationReason}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFFB91C1C),
                      height: 1.35,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  // MARK: - Status Badge
  Widget _buildStatusBadge(String status, bool isVi) {
    final s = status.toUpperCase();
    final Color bgColor;
    final Color textColor;
    final String label;

    switch (s) {
      case 'CONFIRMED':
        bgColor = const Color(0xFFD1FAE5);
        textColor = const Color(0xFF059669);
        label = isVi ? 'Đã xác nhận' : 'Confirmed';
        break;
      case 'COMPLETED':
        bgColor = const Color(0xFFE0F7F6);
        textColor = const Color(0xFF0F766E);
        label = isVi ? 'Hoàn thành' : 'Completed';
        break;
      case 'CANCELLED':
        bgColor = const Color(0xFFFFECE8);
        textColor = const Color(0xFFDC2626);
        label = isVi ? 'Đã hủy' : 'Cancelled';
        break;
      case 'PENDING':
      default:
        bgColor = const Color(0xFFFEF3C7);
        textColor = const Color(0xFFD97706);
        label = isVi ? 'Chờ xác nhận' : 'Pending';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10.5,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
    );
  }

  // MARK: - Payment Status Badge
  Widget _buildPaymentStatusBadge(String paymentStatus, bool isVi) {
    final ps = paymentStatus.toUpperCase();
    final isPaid = ps == 'PAID' || ps == 'SUCCESS';
    final label = isPaid
        ? (isVi ? 'Đã thanh toán' : 'Paid')
        : (isVi ? 'Chờ thanh toán' : 'Pending');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
      decoration: BoxDecoration(
        color: isPaid ? const Color(0xFFD1FAE5) : const Color(0xFFFEF3C7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: isPaid ? const Color(0xFF059669) : const Color(0xFFD97706),
        ),
      ),
    );
  }

  String _formatPaymentMethod(String? method, bool isVi) {
    if (method == null || method.isEmpty) {
      return isVi ? 'Tiền mặt tại quầy' : 'Cash at counter';
    }
    switch (method.toUpperCase()) {
      case 'CASH':
        return isVi ? 'Tiền mặt tại quầy' : 'Cash at counter';
      case 'VNPAY':
        return 'VNPay';
      case 'MOMO':
        return 'MoMo';
      case 'BANK_TRANSFER':
        return isVi ? 'Chuyển khoản' : 'Bank Transfer';
      default:
        return method;
    }
  }

  Widget _buildDashedDivider() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 4.0;
        const dashSpace = 3.0;
        final count = (boxWidth / (dashWidth + dashSpace)).floor();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(count, (_) {
            return const SizedBox(
              width: dashWidth,
              height: 1,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Color(0xFFE2E8F0)),
              ),
            );
          }),
        );
      },
    );
  }
}
