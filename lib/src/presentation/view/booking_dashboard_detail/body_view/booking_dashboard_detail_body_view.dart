import 'package:board_oi/src/presentation/view/booking_dashboard_detail/mockup_data/booking_dashboard_detail_mock_data.dart';
import 'package:board_oi/src/presentation/view/booking_dashboard_detail/widgets/booking_detail_datetime_card.dart';
import 'package:board_oi/src/presentation/view/booking_dashboard_detail/widgets/booking_detail_notes_card.dart';
import 'package:board_oi/src/presentation/view/booking_dashboard_detail/widgets/booking_detail_payment_card.dart';
import 'package:board_oi/src/presentation/view/booking_dashboard_detail/widgets/booking_detail_services_card.dart';
import 'package:board_oi/src/presentation/view/booking_dashboard_detail/widgets/booking_detail_store_card.dart';
import 'package:board_oi/src/shared/widgets/toast/app_toast.dart';
import 'package:flutter/material.dart';

class BookingDashboardDetailBodyView extends StatefulWidget {
  const BookingDashboardDetailBodyView({super.key});

  @override
  State<BookingDashboardDetailBodyView> createState() =>
      _BookingDashboardDetailBodyViewState();
}

class _BookingDashboardDetailBodyViewState
    extends State<BookingDashboardDetailBodyView> {
  late List<DetailUserNoteItem> _notes;

  @override
  void initState() {
    super.initState();
    _notes = List.from(BookingDashboardDetailMockData.notes);
  }

  void _onAddNote(String text) {
    setState(() {
      _notes.add(DetailUserNoteItem(timestamp: 'Just now', note: text));
    });
    AppToast.success(context, message: 'Note added successfully');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status Pill & Booking Code Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0F7F6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.circle, size: 7, color: Color(0xFF0F766E)),
                    SizedBox(width: 5),
                    Text(
                      BookingDashboardDetailMockData.status,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF0F766E),
                        letterSpacing: 0.4,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                BookingDashboardDetailMockData.bookingCode,
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF475569),
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          // Store Card
          const BookingDetailStoreCard(
            salonName: BookingDashboardDetailMockData.salonName,
            salonAddress: BookingDashboardDetailMockData.salonAddress,
            salonPhone: BookingDashboardDetailMockData.salonPhone,
          ),

          const SizedBox(height: 14),

          // Date & Time Card
          const BookingDetailDateTimeCard(
            date: BookingDashboardDetailMockData.appointmentDate,
            timeRange: BookingDashboardDetailMockData.appointmentTimeRange,
            durationBadge:
                BookingDashboardDetailMockData.appointmentDurationBadge,
          ),

          const SizedBox(height: 14),

          // Services Breakdown Card
          const BookingDetailServicesCard(
            services: BookingDashboardDetailMockData.services,
          ),

          const SizedBox(height: 14),

          // User Notes Card
          BookingDetailNotesCard(notes: _notes, onAddNote: _onAddNote),

          const SizedBox(height: 14),

          // Payment Summary Card
          const BookingDetailPaymentCard(
            subtotal: BookingDashboardDetailMockData.subtotal,
            discount: BookingDashboardDetailMockData.discount,
            discountBadge: BookingDashboardDetailMockData.discountBadge,
            totalAmount: BookingDashboardDetailMockData.totalAmount,
            paymentStatus: BookingDashboardDetailMockData.paymentStatus,
          ),

          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
