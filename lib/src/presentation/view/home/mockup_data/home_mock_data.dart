import '../widgets/home_near_salon_card.dart';
import '../widgets/home_recommended_salon_card.dart';
import '../widgets/home_special_offer_card.dart';

class HomeMockData {
  const HomeMockData._();

  static const List<HomeSpecialOfferItem> specialOffers = [
    HomeSpecialOfferItem(
      id: 'offer_1',
      title: 'Hair Special',
      discount: '20% OFF',
      subtitle: 'All Hair Services',
      validUntil: 'Until Aug 30',
      imageUrl:
          'https://images.unsplash.com/photo-1560066984-138dadb4c035?auto=format&fit=crop&w=800&q=80',
    ),
    HomeSpecialOfferItem(
      id: 'offer_2',
      title: 'Facial Care',
      discount: '15% OFF',
      subtitle: 'Facial Treatments',
      validUntil: 'Limited Time',
      imageUrl:
          'https://images.unsplash.com/photo-1540555700478-4be289fbecef?auto=format&fit=crop&w=800&q=80',
    ),
    HomeSpecialOfferItem(
      id: 'offer_3',
      title: 'Aroma Therapy',
      discount: '25% OFF',
      subtitle: 'Relaxing Spa & Massage',
      validUntil: 'This Weekend Only',
      imageUrl:
          'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?auto=format&fit=crop&w=800&q=80',
    ),
  ];

  static const List<HomeNearSalonItem> nearSalons = [
    HomeNearSalonItem(
      id: 'salon_near_1',
      name: 'Miette Hair Studio',
      categories: 'Hair · Beauty · Spa',
      rating: 4.8,
      distance: '1.2 km',
      imageUrl:
          'https://images.unsplash.com/photo-1527799820374-dcf8d9d4a388?auto=format&fit=crop&w=600&q=80',
    ),
    HomeNearSalonItem(
      id: 'salon_near_2',
      name: 'Lotus Zen Spa',
      categories: 'Massage · Facial',
      rating: 4.9,
      distance: '2.5 km',
      imageUrl:
          'https://images.unsplash.com/photo-1544161515-4ab6ce6db874?auto=format&fit=crop&w=600&q=80',
    ),
    HomeNearSalonItem(
      id: 'salon_near_3',
      name: 'The Barber Club',
      categories: 'Haircut · Shave',
      rating: 4.7,
      distance: '3.1 km',
      imageUrl:
          'https://images.unsplash.com/photo-1503951914875-452162b0f3f1?auto=format&fit=crop&w=600&q=80',
    ),
  ];

  static const List<HomeRecommendedSalonItem> recommendedSalons = [
    HomeRecommendedSalonItem(
      id: 'rec_1',
      name: 'Aura Wellness Spa',
      categoryLocation: 'Skin Care • District 1',
      rating: 4.8,
      reviewCount: 120,
      imageUrl:
          'https://images.unsplash.com/photo-1519415510236-718bdfcd89c8?auto=format&fit=crop&w=400&q=80',
      isFavorite: false,
    ),
    HomeRecommendedSalonItem(
      id: 'rec_2',
      name: 'Lumiere Hair',
      categoryLocation: 'Hair Salon • 0.8 km',
      rating: 4.9,
      reviewCount: 85,
      imageUrl:
          'https://images.unsplash.com/photo-1522337360788-8b13dee7a37e?auto=format&fit=crop&w=400&q=80',
      isFavorite: true,
    ),
    HomeRecommendedSalonItem(
      id: 'rec_3',
      name: 'Zen Nail Bar',
      categoryLocation: 'Nail Care • 1.5 km',
      rating: 4.7,
      reviewCount: 210,
      imageUrl:
          'https://images.unsplash.com/photo-1632345031435-8727f6897d53?auto=format&fit=crop&w=400&q=80',
      isFavorite: false,
    ),
  ];
}
