import 'package:flutter/material.dart';
import 'package:spa_booking/src/core/extensions/double_extensions.dart';
import '../../../../../shared/shared.dart';
import '../../models/booking_models.dart';

class BookingDetailBodyView extends StatelessWidget {
  final BookingDetailData detail;
  final TextEditingController noteController;
  final VoidCallback onAddNote;

  const BookingDetailBodyView({
    super.key,
    required this.detail,
    required this.noteController,
    required this.onAddNote,
  });

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
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
          // FORM 1: TÊN SALON, THỜI GIAN, SERVICE + NHÂN VIÊN
          // ==========================================
          _buildBookingInfoForm(isVi),

          const SizedBox(height: 12),

          // ==========================================
          // FORM 2: TOTAL AMOUNT & CHI PHÍ
          // ==========================================
          _buildTotalAmountForm(isVi),

          const SizedBox(height: 12),

          // ==========================================
          // GHI CHÚ BỔ SUNG (OPTIONAL NOTE FIELD)
          // ==========================================
          _buildNoteField(isVi),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // MARK: - FORM 1: Thông tin Lịch Hẹn
  Widget _buildBookingInfoForm(bool isVi) {
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
          // SESSION 1: TÊN SALON
          // ----------------------------------------------------
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
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
                        detail.salonName,
                        style: const TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w700,
                          color: _textDark,
                          letterSpacing: -0.2,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 1.5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFECFDF5),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              detail.status,
                              style: const TextStyle(
                                fontSize: 10.5,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF059669),
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            detail.bookingCode,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: _textMuted,
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

          // Divider ngắn ở giữa session 1 và 2
          const Divider(
            height: 1,
            color: Color(0xFFF1F5F9),
            indent: 14,
            endIndent: 14,
          ),

          // ----------------------------------------------------
          // SESSION 2: THỜI GIAN
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
                        detail.dateDisplay,
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
                            '${detail.timeDisplay} (${detail.durationDisplay})',
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
          // SESSION 3: SERVICE + NHÂN VIÊN LÀM
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
                          ? 'Dịch vụ đã chọn (${detail.services.length})'
                          : 'Selected Services (${detail.services.length})',
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

                // Danh sách dịch vụ
                ...detail.services.asMap().entries.map((entry) {
                  final index = entry.key;
                  final service = entry.value;
                  final isLast = index == detail.services.length - 1;

                  final staffName =
                      detail.serviceStaffNames?[service.id] ??
                      detail.staffName ??
                      (isVi
                          ? 'Bất kỳ chuyên viên nào (Tự sắp xếp)'
                          : 'Any Specialist');

                  return Padding(
                    padding: EdgeInsets.only(bottom: isLast ? 0 : 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Dòng Tên Dịch Vụ & Giá
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
                              service.priceDisplay,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: _textDark,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),

                        // Thời lượng & Nhân viên làm dịch vụ này
                        Row(
                          children: [
                            const Icon(
                              LucideIcons.clock,
                              size: 11,
                              color: Color(0xFF94A3B8),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              service.duration,
                              style: const TextStyle(
                                fontSize: 11.5,
                                color: _textMuted,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              '•',
                              style: TextStyle(color: Color(0xFFCBD5E1)),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              LucideIcons.user,
                              size: 11,
                              color: _coralColor,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                staffName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF475569),
                                ),
                              ),
                            ),
                          ],
                        ),
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

  // MARK: - FORM 2: Total Amount (Chi phí & Tổng thanh toán)
  Widget _buildTotalAmountForm(bool isVi) {
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
          // Dòng Tạm tính
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
                detail.subtotal.toVnd(),
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: _textDark,
                ),
              ),
            ],
          ),

          if (detail.discount > 0) ...[
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isVi ? 'Giảm giá' : 'Discount',
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF059669),
                  ),
                ),
                Text(
                  '-${detail.discount.toVnd()}',
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF059669),
                  ),
                ),
              ],
            ),
          ],

          const SizedBox(height: 10),

          // Divider nét đứt ngắn
          _buildDashedDivider(),

          const SizedBox(height: 10),

          // Dòng Tổng thanh toán (Giảm cỡ chữ, không bị to quá)
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
                detail.totalAmount.toVnd(),
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

  // MARK: - Ghi Chú Tinh Gọn (Optional Note)
  Widget _buildNoteField(bool isVi) {
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
                isVi ? 'Ghi chú cho salon' : 'Note for Salon',
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w700,
                  color: _textDark,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                isVi ? '(Tùy chọn)' : '(Optional)',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: _textMuted,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          AppTextField(
            controller: noteController,
            hint: isVi
                ? 'Thêm yêu cầu đặc biệt hoặc ghi chú...'
                : 'Add special requests or notes...',
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
        ],
      ),
    );
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
