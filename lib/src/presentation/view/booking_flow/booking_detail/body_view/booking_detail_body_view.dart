import 'package:flutter/material.dart';
import '../../models/booking_models.dart';
import '../widgets/booking_detail_notes_card.dart';
import '../widgets/booking_detail_pricing_card.dart';
import '../widgets/booking_detail_salon_header.dart';
import '../widgets/booking_detail_services_card.dart';

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Status Pill & Salon Banner & Date/Time Card
          BookingDetailSalonHeader(detail: detail),

          const SizedBox(height: 16),

          // 2. Services Breakdown Card with Coral Banner
          BookingDetailServicesCard(services: detail.services),

          const SizedBox(height: 16),

          // 3. User Notes Card with Coral Banner & Input Field
          BookingDetailNotesCard(
            notes: detail.notes,
            noteController: noteController,
            onAddNote: onAddNote,
          ),

          const SizedBox(height: 16),

          // 4. Subtotal, Discount & Total Amount Pricing Card
          BookingDetailPricingCard(
            subtotal: detail.subtotal,
            discount: detail.discount,
            totalAmount: detail.totalAmount,
            paymentStatus: detail.paymentStatus,
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
