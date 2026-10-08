import 'package:flutter/foundation.dart';

@immutable
class NearbyStoreItem {
  final String id;
  final String name;
  final String category;
  final String address;
  final double rating;
  final int reviewCount;
  final double distanceKm;
  final String distanceText;
  final String priceFrom;
  final String imageUrl;
  final bool isOpen;
  final String openHours;
  final String phone;
  final String? promoBadge;
  final List<String> popularServices;

  /// Geographic coordinates
  final double latitude;
  final double longitude;
  final double xRatio;
  final double yRatio;

  const NearbyStoreItem({
    required this.id,
    required this.name,
    required this.category,
    required this.address,
    required this.rating,
    required this.reviewCount,
    required this.distanceKm,
    required this.distanceText,
    required this.priceFrom,
    required this.imageUrl,
    required this.isOpen,
    required this.openHours,
    required this.phone,
    this.promoBadge,
    required this.popularServices,
    required this.latitude,
    required this.longitude,
    this.xRatio = 0,
    this.yRatio = 0,
  });
}

class NearbyStoreMockData {
  /// Default center user location (District 1, Ho Chi Minh City)
  static const double userLatitude = 10.7769;
  static const double userLongitude = 106.7009;

  static const List<NearbyStoreItem> sampleStores = [
    NearbyStoreItem(
      id: 'store_aura_q1',
      name: 'Aura Luxury Wellness & Spa',
      category: 'Spa & Chăm sóc da toàn diện',
      address: '72 Lê Thánh Tôn, Bến Nghé, Quận 1',
      rating: 4.9,
      reviewCount: 342,
      distanceKm: 0.45,
      distanceText: '450 m • 5 phút',
      priceFrom: '250.000 đ',
      imageUrl:
          'https://images.unsplash.com/photo-1540555700478-4be289fbecef?auto=format&fit=crop&w=600&q=80',
      isOpen: true,
      openHours: '08:30 - 21:30',
      phone: '0901 234 567',
      promoBadge: 'Giảm 25%',
      popularServices: [
        'Gội đầu thảo mộc',
        'Massage Body đá nóng',
        'Cấy tảo xoắn',
      ],
      latitude: 10.7782,
      longitude: 106.7020,
    ),
    NearbyStoreItem(
      id: 'store_anam_qt',
      name: 'Anam QT Relaxation Center',
      category: 'Massage trị liệu & Thư giãn',
      address: '26/1A Lê Thánh Tôn, Bến Nghé, Quận 1',
      rating: 4.8,
      reviewCount: 215,
      distanceKm: 0.75,
      distanceText: '750 m • 8 phút',
      priceFrom: '320.000 đ',
      imageUrl:
          'https://images.unsplash.com/photo-1519823551278-64ac92734fb1?auto=format&fit=crop&w=600&q=80',
      isOpen: true,
      openHours: '09:00 - 22:00',
      phone: '0908 765 432',
      promoBadge: 'Hot Deal',
      popularServices: [
        'Massage Thụy Điển',
        'Ngâm chân thảo dược',
        'Chăm sóc cổ vai gáy',
      ],
      latitude: 10.7801,
      longitude: 106.7042,
    ),
    NearbyStoreItem(
      id: 'store_lapothicaire',
      name: "L'Apothicaire Herbal Retreat",
      category: 'Trị liệu hữu cơ & Dưỡng sinh',
      address: '64A Trương Định, Phường 7, Quận 3',
      rating: 4.95,
      reviewCount: 489,
      distanceKm: 1.1,
      distanceText: '1.1 km • 12 phút',
      priceFrom: '450.000 đ',
      imageUrl:
          'https://images.unsplash.com/photo-1527799820374-dcf8d9d4a388?auto=format&fit=crop&w=600&q=80',
      isOpen: true,
      openHours: '08:00 - 21:00',
      phone: '0933 112 233',
      promoBadge: 'Độc quyền',
      popularServices: [
        'Trị liệu Anti-stress',
        'Facial Organic',
        'Tắm khoáng thảo mộc',
      ],
      latitude: 10.7788,
      longitude: 106.6925,
    ),
    NearbyStoreItem(
      id: 'store_golden_lotus',
      name: 'Golden Lotus Healing World',
      category: 'Xông hơi Jjim Jil Bang & Spa',
      address: '27 Phạm Ngọc Thạch, Phường 6, Quận 3',
      rating: 4.7,
      reviewCount: 620,
      distanceKm: 1.6,
      distanceText: '1.6 km • 15 phút',
      priceFrom: '190.000 đ',
      imageUrl:
          'https://images.unsplash.com/photo-1507652313519-d4e9174996dd?auto=format&fit=crop&w=600&q=80',
      isOpen: true,
      openHours: '08:00 - 23:00',
      phone: '0912 345 678',
      promoBadge: 'Đi 2 tặng 1',
      popularServices: [
        'Xông hơi đá muối Himalaya',
        'Massage chân bấm huyệt',
        'Tẩy tế bào chết body',
      ],
      latitude: 10.7836,
      longitude: 106.6948,
    ),
    NearbyStoreItem(
      id: 'store_omamori_spa',
      name: 'Omamori Zen Sanctuary',
      category: 'Dưỡng sinh đông y & Cổ truyền',
      address: '15 Pasteur, Phường Nguyễn Thái Bình, Quận 1',
      rating: 4.85,
      reviewCount: 178,
      distanceKm: 2.2,
      distanceText: '2.2 km • 18 phút',
      priceFrom: '220.000 đ',
      imageUrl:
          'https://images.unsplash.com/photo-1515377905703-c4788e51af15?auto=format&fit=crop&w=600&q=80',
      isOpen: false,
      openHours: '10:00 - 21:00 (Nghỉ trưa)',
      phone: '0903 998 877',
      promoBadge: null,
      popularServices: [
        'Dưỡng sinh ngũ hành',
        'Thông kinh lạc',
        'Chườm ngải cứu thảo mộc',
      ],
      latitude: 10.7712,
      longitude: 106.7015,
    ),
    NearbyStoreItem(
      id: 'store_sen_viet',
      name: 'Sen Việt Lotus Beauty Lounge',
      category: 'Nails & Mi & Spa thư giãn',
      address: '102 Nguyễn Du, Phường Bến Nghé, Quận 1',
      rating: 4.75,
      reviewCount: 140,
      distanceKm: 0.9,
      distanceText: '900 m • 10 phút',
      priceFrom: '150.000 đ',
      imageUrl:
          'https://images.unsplash.com/photo-1560750588-73207b1ef5b8?auto=format&fit=crop&w=600&q=80',
      isOpen: true,
      openHours: '09:00 - 20:30',
      phone: '0977 889 900',
      promoBadge: 'Voucher 50k',
      popularServices: [
        'Nail art thiết kế',
        'Uốn mi collagen',
        'Gội đầu dưỡng sinh',
      ],
      latitude: 10.7758,
      longitude: 106.6980,
    ),
  ];
}
