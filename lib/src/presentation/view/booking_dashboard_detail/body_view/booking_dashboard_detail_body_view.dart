import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/booking/booking_entity.dart';
import '../../../../shared/utils/app_toast_helper.dart';
import '../../../bloc/booking/booking_action/booking_action_bloc.dart';
import '../mockup_data/booking_dashboard_detail_mock_data.dart';
import '../widgets/booking_detail_datetime_card.dart';
import '../widgets/booking_detail_notes_card.dart';
import '../widgets/booking_detail_payment_card.dart';
import '../widgets/booking_detail_services_card.dart';
import '../widgets/booking_detail_store_card.dart';

class BookingDashboardDetailBodyView extends StatefulWidget {
  final BookingEntity? booking;

  const BookingDashboardDetailBodyView({super.key, this.booking});

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
    if (widget.booking != null) {
      context.read<BookingActionBloc>().add(
        UpdateBookingNotesEvent(bookingId: widget.booking!.id, note: text),
      );
    } else {
      AppToastHelper.showSuccess(context, message: 'Note added successfully');
    }
  }

  @override
  Widget build(BuildContext context) {
    final b = widget.booking;
    final status = b?.status ?? BookingDashboardDetailMockData.status;
    final bookingCode = b != null
        ? '#${b.bookingCode}'
        : BookingDashboardDetailMockData.bookingCode;
    final salonName =
        b?.store?.name ?? BookingDashboardDetailMockData.salonName;
    final salonAddress =
        b?.store?.address ?? BookingDashboardDetailMockData.salonAddress;
    final salonPhone =
        b?.store?.phoneNumber ?? BookingDashboardDetailMockData.salonPhone;
    final appointmentDate = b != null
        ? '${b.startAt.year}-${b.startAt.month.toString().padLeft(2, '0')}-${b.startAt.day.toString().padLeft(2, '0')}'
        : BookingDashboardDetailMockData.appointmentDate;
    final appointmentTimeRange = b != null
        ? '${b.startAt.hour.toString().padLeft(2, '0')}:${b.startAt.minute.toString().padLeft(2, '0')} - ${b.endAt.hour.toString().padLeft(2, '0')}:${b.endAt.minute.toString().padLeft(2, '0')}'
        : BookingDashboardDetailMockData.appointmentTimeRange;
    final appointmentDurationBadge = b != null
        ? '${b.totalDuration}m'
        : BookingDashboardDetailMockData.appointmentDurationBadge;

    final services = (b != null && b.services.isNotEmpty)
        ? b.services
              .map(
                (item) => DetailServiceItem(
                  name: item.name,
                  duration: '${item.duration}m',
                  price: '${item.price} VND',
                ),
              )
              .toList()
        : BookingDashboardDetailMockData.services;

    final totalAmount = b != null
        ? '${b.totalAmount} VND'
        : BookingDashboardDetailMockData.totalAmount;
    final paymentStatus =
        b?.paymentStatus ?? BookingDashboardDetailMockData.paymentStatus;

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
                  color: status == 'CANCELLED'
                      ? const Color(0xFFFFECE8)
                      : const Color(0xFFE0F7F6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 7,
                      color: status == 'CANCELLED'
                          ? const Color(0xFFBA1A1A)
                          : const Color(0xFF0F766E),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: status == 'CANCELLED'
                            ? const Color(0xFFBA1A1A)
                            : const Color(0xFF0F766E),
                        letterSpacing: 0.4,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                bookingCode,
                style: const TextStyle(
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
          BookingDetailStoreCard(
            salonName: salonName,
            salonAddress: salonAddress,
            salonPhone: salonPhone,
          ),

          const SizedBox(height: 14),

          // Date & Time Card
          BookingDetailDateTimeCard(
            date: appointmentDate,
            timeRange: appointmentTimeRange,
            durationBadge: appointmentDurationBadge,
          ),

          const SizedBox(height: 14),

          // Services Breakdown Card
          BookingDetailServicesCard(services: services),

          const SizedBox(height: 14),

          // User Notes Card
          BookingDetailNotesCard(notes: _notes, onAddNote: _onAddNote),

          const SizedBox(height: 14),

          // Payment Summary Card
          BookingDetailPaymentCard(
            subtotal: b != null
                ? totalAmount
                : BookingDashboardDetailMockData.subtotal,
            discount: b != null
                ? '0 VND'
                : BookingDashboardDetailMockData.discount,
            discountBadge: b != null
                ? 'Standard'
                : BookingDashboardDetailMockData.discountBadge,
            totalAmount: totalAmount,
            paymentStatus: paymentStatus,
          ),

          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
