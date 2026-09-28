import 'package:flutter/material.dart';
import '../../models/booking_models.dart';

class BookingScheduleMockData {
  const BookingScheduleMockData._();

  static const List<BookingStaffItem> staffMembers = [
    BookingStaffItem(
      id: 'staff_sa',
      name: 'Sarah',
      initials: 'SA',
      avatarBgColor: Color(0xFFB2EBF2),
      photoUrl:
          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=200&q=80',
    ),
    BookingStaffItem(
      id: 'staff_mi',
      name: 'Mike',
      initials: 'MI',
      avatarBgColor: Color(0xFFE1BEE7),
      photoUrl:
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=200&q=80',
    ),
    BookingStaffItem(
      id: 'staff_el',
      name: 'Elena',
      initials: 'EL',
      avatarBgColor: Color(0xFFF8BBD0),
      photoUrl:
          'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&w=200&q=80',
    ),
    BookingStaffItem(
      id: 'staff_ja',
      name: 'James',
      initials: 'JA',
      avatarBgColor: Color(0xFFB2DFDB),
      isOff: true,
    ),
  ];

  static const List<String> timeColumns = [
    '09:00 AM',
    '09:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
  ];

  static final List<BookingTimeSlotItem> defaultSlots = [
    // Sarah's slots
    const BookingTimeSlotItem(
      staffId: 'staff_sa',
      time: '09:30 AM',
      bookedTitle: 'Haircut',
      clientName: 'Leila Azimi',
      color: Color(0xFFD1FAE5),
    ),
    const BookingTimeSlotItem(
      staffId: 'staff_sa',
      time: '10:00 AM',
      isSelected: true, // + card matching image 4
    ),

    // Mike's slots
    const BookingTimeSlotItem(
      staffId: 'staff_mi',
      time: '09:00 AM',
      bookedTitle: 'Coloring',
      clientName: 'John Doe',
      color: Color(0xFFFFEDD5),
    ),
    const BookingTimeSlotItem(
      staffId: 'staff_mi',
      time: '11:00 AM',
      isBreak: true,
    ),
    const BookingTimeSlotItem(
      staffId: 'staff_mi',
      time: '11:30 AM',
      isBreak: true,
    ),

    // Elena's slots
    const BookingTimeSlotItem(
      staffId: 'staff_el',
      time: '10:00 AM',
      bookedTitle: 'Styling',
      clientName: 'Emma Smith',
      color: Color(0xFFDBEAFE),
    ),

    // James is OFF
    const BookingTimeSlotItem(
      staffId: 'staff_ja',
      time: '09:00 AM',
      isOff: true,
    ),
  ];
}
