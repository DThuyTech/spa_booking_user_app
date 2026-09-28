import 'package:flutter/material.dart';

class StoreDetailItem {
  final String id;
  final String name;
  final double rating;
  final int reviewCount;
  final String distance;
  final bool isOpen;
  final String openStatusText;
  final int availableSeats;
  final String seatsText;
  final String coverImageUrl;
  final bool isFavorite;
  final String startingPrice;
  final String aboutDescription;
  final List<StoreOverviewServiceItem> overviewServices;
  final StoreLocationItem location;
  final StoreOpeningHoursItem openingHours;
  final StoreInformationItem information;
  final List<StoreServiceCategoryGroup> serviceGroups;
  final List<StoreGalleryPhotoItem> galleryPhotos;
  final StoreRatingSummary ratingSummary;
  final List<StoreReviewItem> reviews;

  const StoreDetailItem({
    required this.id,
    required this.name,
    required this.rating,
    required this.reviewCount,
    required this.distance,
    required this.isOpen,
    required this.openStatusText,
    required this.availableSeats,
    required this.seatsText,
    required this.coverImageUrl,
    this.isFavorite = false,
    required this.startingPrice,
    required this.aboutDescription,
    required this.overviewServices,
    required this.location,
    required this.openingHours,
    required this.information,
    required this.serviceGroups,
    required this.galleryPhotos,
    required this.ratingSummary,
    required this.reviews,
  });

  StoreDetailItem copyWith({
    String? id,
    String? name,
    double? rating,
    int? reviewCount,
    String? distance,
    bool? isOpen,
    String? openStatusText,
    int? availableSeats,
    String? seatsText,
    String? coverImageUrl,
    bool? isFavorite,
    String? startingPrice,
    String? aboutDescription,
    List<StoreOverviewServiceItem>? overviewServices,
    StoreLocationItem? location,
    StoreOpeningHoursItem? openingHours,
    StoreInformationItem? information,
    List<StoreServiceCategoryGroup>? serviceGroups,
    List<StoreGalleryPhotoItem>? galleryPhotos,
    StoreRatingSummary? ratingSummary,
    List<StoreReviewItem>? reviews,
  }) {
    return StoreDetailItem(
      id: id ?? this.id,
      name: name ?? this.name,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      distance: distance ?? this.distance,
      isOpen: isOpen ?? this.isOpen,
      openStatusText: openStatusText ?? this.openStatusText,
      availableSeats: availableSeats ?? this.availableSeats,
      seatsText: seatsText ?? this.seatsText,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
      startingPrice: startingPrice ?? this.startingPrice,
      aboutDescription: aboutDescription ?? this.aboutDescription,
      overviewServices: overviewServices ?? this.overviewServices,
      location: location ?? this.location,
      openingHours: openingHours ?? this.openingHours,
      information: information ?? this.information,
      serviceGroups: serviceGroups ?? this.serviceGroups,
      galleryPhotos: galleryPhotos ?? this.galleryPhotos,
      ratingSummary: ratingSummary ?? this.ratingSummary,
      reviews: reviews ?? this.reviews,
    );
  }
}

class StoreOverviewServiceItem {
  final String title;
  final String duration;
  final String price;

  const StoreOverviewServiceItem({
    required this.title,
    required this.duration,
    required this.price,
  });
}

class StoreLocationItem {
  final String address;
  final String cityStateZip;
  final double latitude;
  final double longitude;
  final String mapImageUrl;

  const StoreLocationItem({
    required this.address,
    required this.cityStateZip,
    required this.latitude,
    required this.longitude,
    required this.mapImageUrl,
  });
}

class StoreOpeningHoursItem {
  final String todayHours;
  final Map<String, String> weeklySchedule;

  const StoreOpeningHoursItem({
    required this.todayHours,
    required this.weeklySchedule,
  });
}

class StoreInformationItem {
  final String paymentMethods;
  final String amenities;

  const StoreInformationItem({
    required this.paymentMethods,
    required this.amenities,
  });
}

class StoreServiceCategoryGroup {
  final String categoryName;
  final List<StoreServiceItem> services;

  const StoreServiceCategoryGroup({
    required this.categoryName,
    required this.services,
  });
}

class StoreServiceItem {
  final String id;
  final String name;
  final String? badge;
  final String description;
  final String duration;
  final double price;
  final String priceDisplay;

  const StoreServiceItem({
    required this.id,
    required this.name,
    this.badge,
    required this.description,
    required this.duration,
    required this.price,
    required this.priceDisplay,
  });
}

class StoreGalleryPhotoItem {
  final String id;
  final String imageUrl;
  final String category;
  final bool isFeatured;

  const StoreGalleryPhotoItem({
    required this.id,
    required this.imageUrl,
    required this.category,
    this.isFeatured = false,
  });
}

class StoreRatingSummary {
  final double averageRating;
  final int totalReviews;
  final Map<int, double> starRatios;

  const StoreRatingSummary({
    required this.averageRating,
    required this.totalReviews,
    required this.starRatios,
  });
}

class StoreReviewItem {
  final String id;
  final String author;
  final String authorInitials;
  final Color avatarBgColor;
  final String timeAgo;
  final int rating;
  final String content;

  const StoreReviewItem({
    required this.id,
    required this.author,
    required this.authorInitials,
    required this.avatarBgColor,
    required this.timeAgo,
    required this.rating,
    required this.content,
  });
}

class StoreDetailMockData {
  const StoreDetailMockData._();

  static const StoreDetailItem luxeSalon = StoreDetailItem(
    id: 'store_luxe',
    name: 'LUXE SALON',
    rating: 4.8,
    reviewCount: 238,
    distance: '1.2 km',
    isOpen: true,
    openStatusText: 'Open now',
    availableSeats: 3,
    seatsText: '3 seats available',
    coverImageUrl:
        'https://images.unsplash.com/photo-1560066984-138dadb4c035?auto=format&fit=crop&w=1200&q=80',
    isFavorite: false,
    startingPrice: r'$15',
    aboutDescription:
        'LUXE SALON is a premium studio offering high-end hair, styling, and wellness services. Our master stylists are dedicated to providing personalized beauty experiences with exceptional quality.',
    overviewServices: [
      StoreOverviewServiceItem(
        title: 'Haircut',
        duration: '45 min',
        price: r'$45',
      ),
      StoreOverviewServiceItem(
        title: 'Styling',
        duration: '30 min',
        price: r'$35',
      ),
      StoreOverviewServiceItem(
        title: 'Coloring',
        duration: '120 min',
        price: r'$120',
      ),
      StoreOverviewServiceItem(
        title: 'Manicure',
        duration: '40 min',
        price: r'$30',
      ),
    ],
    location: StoreLocationItem(
      address: '123 Wellness Ave, Suite 200',
      cityStateZip: 'Metropolis, NY 10001',
      latitude: 40.7128,
      longitude: -74.0060,
      mapImageUrl:
          'https://images.unsplash.com/photo-1524661135-423995f22d0b?auto=format&fit=crop&w=800&q=80',
    ),
    openingHours: StoreOpeningHoursItem(
      todayHours: 'Today : 09:00 AM - 09:00 PM',
      weeklySchedule: {
        'Monday': '09:00 AM - 09:00 PM',
        'Tuesday': '09:00 AM - 09:00 PM',
        'Wednesday': '09:00 AM - 09:00 PM',
        'Thursday': '09:00 AM - 09:00 PM',
        'Friday': '09:00 AM - 10:00 PM',
        'Saturday': '08:30 AM - 10:00 PM',
        'Sunday': '10:00 AM - 08:00 PM',
      },
    ),
    information: StoreInformationItem(
      paymentMethods: 'Cash, Card, E-wallet',
      amenities: 'Wi-Fi, Parking, AC',
    ),
    serviceGroups: [
      StoreServiceCategoryGroup(
        categoryName: 'Hair',
        services: [
          StoreServiceItem(
            id: 'hair_1',
            name: 'Haircut',
            badge: 'Popular',
            description:
                'Professional wash, cut, and blow-dry tailored to your face shape.',
            duration: '30 min',
            price: 15,
            priceDisplay: r'$15',
          ),
          StoreServiceItem(
            id: 'hair_2',
            name: 'Hair Styling',
            description: 'Special event styling, updos, or complex braiding.',
            duration: '45 min',
            price: 25,
            priceDisplay: r'$25',
          ),
          StoreServiceItem(
            id: 'hair_3',
            name: 'Hair Coloring',
            description: 'Full head color, highlights, or balayage treatments.',
            duration: '90 min',
            price: 60,
            priceDisplay: r'$60',
          ),
        ],
      ),
      StoreServiceCategoryGroup(
        categoryName: 'Beauty',
        services: [
          StoreServiceItem(
            id: 'beauty_1',
            name: 'Manicure',
            description:
                'Cuticle care, nail shaping, hand massage, and polish.',
            duration: '45 min',
            price: 20,
            priceDisplay: r'$20',
          ),
          StoreServiceItem(
            id: 'beauty_2',
            name: 'Pedicure',
            description:
                'Relaxing foot soak, exfoliation, nail care, and polish.',
            duration: '60 min',
            price: 25,
            priceDisplay: r'$25',
          ),
        ],
      ),
    ],
    galleryPhotos: [
      StoreGalleryPhotoItem(
        id: 'gal_1',
        imageUrl:
            'https://images.unsplash.com/photo-1521590832167-7bcbfaa6381f?auto=format&fit=crop&w=1200&q=80',
        category: 'Interior',
        isFeatured: true,
      ),
      StoreGalleryPhotoItem(
        id: 'gal_2',
        imageUrl:
            'https://images.unsplash.com/photo-1519415510236-718bdfcd89c8?auto=format&fit=crop&w=600&q=80',
        category: 'Services',
      ),
      StoreGalleryPhotoItem(
        id: 'gal_3',
        imageUrl:
            'https://images.unsplash.com/photo-1560066984-138dadb4c035?auto=format&fit=crop&w=600&q=80',
        category: 'Interior',
      ),
      StoreGalleryPhotoItem(
        id: 'gal_4',
        imageUrl:
            'https://images.unsplash.com/photo-1522337360788-8b13dee7a37e?auto=format&fit=crop&w=600&q=80',
        category: 'Team',
      ),
      StoreGalleryPhotoItem(
        id: 'gal_5',
        imageUrl:
            'https://images.unsplash.com/photo-1527799820374-dcf8d9d4a388?auto=format&fit=crop&w=600&q=80',
        category: 'Interior',
      ),
    ],
    ratingSummary: StoreRatingSummary(
      averageRating: 4.8,
      totalReviews: 238,
      starRatios: {5: 0.80, 4: 0.14, 3: 0.04, 2: 0.01, 1: 0.01},
    ),
    reviews: [
      StoreReviewItem(
        id: 'rev_1',
        author: 'Sarah Connor',
        authorInitials: 'SC',
        avatarBgColor: Color(0xFF81D4FA),
        timeAgo: '2 days ago',
        rating: 5,
        content:
            'Absolutely loved my experience here! Eva was amazing and took exactly what I wanted and made it reality. The salon itself is so beautiful and relaxing.',
      ),
      StoreReviewItem(
        id: 'rev_2',
        author: 'Mia Richards',
        authorInitials: 'MR',
        avatarBgColor: Color(0xFFFFAB91),
        timeAgo: '1 week ago',
        rating: 5,
        content:
            'Great service, very professional. I got a manicure and pedicure, and they were very detail-oriented. Will definitely be coming back for a haircut next time.',
      ),
      StoreReviewItem(
        id: 'rev_3',
        author: 'Elena Lopez',
        authorInitials: 'EL',
        avatarBgColor: Color(0xFF80DEEA),
        timeAgo: '3 days ago',
        rating: 5,
        content:
            "The interior is absolutely stunning and the service matches. I had a balayage done by Marcus and it's the best color I've ever had. Highly recommend!",
      ),
      StoreReviewItem(
        id: 'rev_4',
        author: 'James Taylor',
        authorInitials: 'JT',
        avatarBgColor: Color(0xFFFFCCBC),
        timeAgo: '5 days ago',
        rating: 5,
        content:
            'Great atmosphere and very professional staff. The wait time was minimal and the haircut was exactly what I asked for. Will be back.',
      ),
    ],
  );
}
