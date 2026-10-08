import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_booking/src/core/extensions/double_extensions.dart';
import '../../../../domain/entities/booking/booking_entity.dart';
import '../../../../shared/utils/app_toast_helper.dart';
import '../../../bloc/booking/booking_action/booking_action_bloc.dart';
import '../models/booking_detail_models.dart';
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
  @override
  void initState() {
    super.initState();
  }

  void _onAddNote(String text) {
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
    if (b == null) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 60),
          child: CircularProgressIndicator(color: Color(0xFFFC6E58)),
        ),
      );
    }

    final status = b.status;
    final bookingCode = '#${b.bookingCode}';
    final salonName = b.store?.name ?? '';
    final salonAddress = b.store?.address ?? '';
    final salonPhone = b.store?.phoneNumber ?? '';
    final appointmentDate =
        '${b.startAt.year}-${b.startAt.month.toString().padLeft(2, '0')}-${b.startAt.day.toString().padLeft(2, '0')}';
    final appointmentTimeRange =
        '${b.startAt.hour.toString().padLeft(2, '0')}:${b.startAt.minute.toString().padLeft(2, '0')} - ${b.endAt.hour.toString().padLeft(2, '0')}:${b.endAt.minute.toString().padLeft(2, '0')}';
    final appointmentDurationBadge = '${b.totalDuration}m';

    final services = b.services
        .map(
          (item) => DetailServiceItem(
            name: item.name,
            duration: '${item.duration}m',
            price: item.price.toVnd(),
          ),
        )
        .toList();

    final totalAmount = b.totalAmount.toVnd();
    final paymentStatus = b.paymentStatus;

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
          BookingDetailNotesCard(
            note: widget.booking?.note ?? '-',
            onAddNote: _onAddNote,
          ),

          const SizedBox(height: 14),

          // Payment Summary Card
          BookingDetailPaymentCard(
            subtotal: totalAmount,
            discount: null, // Don't show if there is no discount
            discountBadge: null,
            totalAmount: totalAmount,
            paymentStatus: paymentStatus,
          ),

          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
