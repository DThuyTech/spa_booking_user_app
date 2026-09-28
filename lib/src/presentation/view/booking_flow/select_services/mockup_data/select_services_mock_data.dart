import 'dart:ui';
import '../../models/booking_models.dart';

class SelectServicesMockData {
  const SelectServicesMockData._();

  static const List<BookingServiceItem> services = [
    // Hair Service
    BookingServiceItem(
      id: 'hair_1',
      category: 'Hair',
      name: 'Haircut',
      duration: '45 mins',
      price: 150000,
      priceDisplay: '150,000 VND',
      isSelected: true,
    ),
    BookingServiceItem(
      id: 'hair_2',
      category: 'Hair',
      name: 'Hair Styling',
      duration: '60 mins',
      price: 250000,
      priceDisplay: '250,000 VND',
      isSelected: false,
    ),
    BookingServiceItem(
      id: 'hair_3',
      category: 'Hair',
      name: 'Hair Coloring',
      duration: '120 mins',
      price: 800000,
      priceDisplay: '800,000 VND',
      isSelected: false,
    ),
    // Beauty Service
    BookingServiceItem(
      id: 'beauty_1',
      category: 'Beauty',
      name: 'Manicure Deluxe',
      duration: '45 mins',
      price: 180000,
      priceDisplay: '180,000 VND',
      isSelected: true,
    ),
    BookingServiceItem(
      id: 'beauty_2',
      category: 'Beauty',
      name: 'Pedicure Spa',
      duration: '60 mins',
      price: 220000,
      priceDisplay: '220,000 VND',
      isSelected: false,
    ),
  ];

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
}
