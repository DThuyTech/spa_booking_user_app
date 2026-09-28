import 'package:flutter/material.dart';

class BookingServiceItem {
  final String id;
  final String category;
  final String name;
  final String duration;
  final int price;
  final String priceDisplay;
  final bool isSelected;

  const BookingServiceItem({
    required this.id,
    required this.category,
    required this.name,
    required this.duration,
    required this.price,
    required this.priceDisplay,
    this.isSelected = false,
  });

  BookingServiceItem copyWith({
    String? id,
    String? category,
    String? name,
    String? duration,
    int? price,
    String? priceDisplay,
    bool? isSelected,
  }) {
    return BookingServiceItem(
      id: id ?? this.id,
      category: category ?? this.category,
      name: name ?? this.name,
      duration: duration ?? this.duration,
      price: price ?? this.price,
      priceDisplay: priceDisplay ?? this.priceDisplay,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class BookingStaffItem {
  final String id;
  final String name;
  final String initials;
  final Color avatarBgColor;
  final String? photoUrl;
  final bool isOff;

  const BookingStaffItem({
    required this.id,
    required this.name,
    required this.initials,
    required this.avatarBgColor,
    this.photoUrl,
    this.isOff = false,
  });
}

class BookingTimeSlotItem {
  final String staffId;
  final String time; // e.g. "09:00 AM"
  final String? bookedTitle;
  final String? clientName;
  final Color? color;
  final bool isBreak;
  final bool isOff;
  final bool isSelected;

  const BookingTimeSlotItem({
    required this.staffId,
    required this.time,
    this.bookedTitle,
    this.clientName,
    this.color,
    this.isBreak = false,
    this.isOff = false,
    this.isSelected = false,
  });

  BookingTimeSlotItem copyWith({
    String? staffId,
    String? time,
    String? bookedTitle,
    String? clientName,
    Color? color,
    bool? isBreak,
    bool? isOff,
    bool? isSelected,
  }) {
    return BookingTimeSlotItem(
      staffId: staffId ?? this.staffId,
      time: time ?? this.time,
      bookedTitle: bookedTitle ?? this.bookedTitle,
      clientName: clientName ?? this.clientName,
      color: color ?? this.color,
      isBreak: isBreak ?? this.isBreak,
      isOff: isOff ?? this.isOff,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class BookingDetailData {
  final String bookingCode;
  final String status;
  final String salonName;
  final String salonAddress;
  final String salonPhone;
  final String dateDisplay;
  final String timeDisplay;
  final String durationDisplay;
  final List<BookingServiceItem> services;
  final List<String> notes;
  final int subtotal;
  final int discount;
  final int totalAmount;
  final String paymentStatus;

  const BookingDetailData({
    required this.bookingCode,
    required this.status,
    required this.salonName,
    required this.salonAddress,
    required this.salonPhone,
    required this.dateDisplay,
    required this.timeDisplay,
    required this.durationDisplay,
    required this.services,
    required this.notes,
    required this.subtotal,
    required this.discount,
    required this.totalAmount,
    required this.paymentStatus,
  });
}
