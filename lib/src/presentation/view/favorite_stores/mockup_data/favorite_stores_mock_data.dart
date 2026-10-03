import '../models/favorite_store_item.dart';

class FavoriteStoresMockData {
  static const List<String> categories = [
    'All',
    'Hair Salon',
    'Nails & Spa',
    'Skin Clinic',
    'Barbershop',
  ];

  static const List<FavoriteStoreItem> defaultFavoriteStores = [
    FavoriteStoreItem(
      id: 'store-1',
      name: 'Aura Studio',
      rating: 4.9,
      distance: '1.2 km',
      description:
          'Premium hair coloring and styling in a serene, light-filled environment designed for ultimate..',
      imageUrl:
          'https://images.unsplash.com/photo-1560066984-138dadb4c035?auto=format&fit=crop&w=800&q=80',
      category: 'Hair Salon',
      address: '742 Evergreen Terrace, Central District',
      isFavorite: true,
    ),
    FavoriteStoreItem(
      id: 'store-2',
      name: 'Velvet Nails & Spa',
      rating: 4.7,
      distance: '3.5 km',
      description:
          'Elevated nail artistry and spa treatments focusing on holistic wellness and ethereal..',
      imageUrl:
          'https://images.unsplash.com/photo-1632345031435-8727f6897d53?auto=format&fit=crop&w=800&q=80',
      category: 'Nails & Spa',
      address: '108 Grand Boulevard, West End',
      isFavorite: true,
    ),
    FavoriteStoreItem(
      id: 'store-3',
      name: 'Lumina Skin Clinic',
      rating: 4.8,
      distance: '0.8 km',
      description:
          'Advanced skincare regimens tailored in an approachable, clinical-yet-cozy modern..',
      imageUrl:
          'https://images.unsplash.com/photo-1540555700478-4be289fbecef?auto=format&fit=crop&w=800&q=80',
      category: 'Skin Clinic',
      address: '45 Health Avenue, Downtown',
      isFavorite: true,
    ),
    FavoriteStoreItem(
      id: 'store-4',
      name: 'The Ivory Grooming',
      rating: 4.6,
      distance: '5.2 km',
      description:
          'Modern grooming lounge providing meticulous cuts in a bright, relaxed, and refined space.',
      imageUrl:
          'https://images.unsplash.com/photo-1503951914875-452162b0f3f1?auto=format&fit=crop&w=800&q=80',
      category: 'Barbershop',
      address: '22 Heritage Street, Old Town',
      isFavorite: true,
    ),
  ];
}
