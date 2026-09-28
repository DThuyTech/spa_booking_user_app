import 'package:flutter/material.dart';
import '../../../../shared/design_system/components/sheets/app_filter_bottom_sheet.dart';
import '../widgets/search_store_card.dart';

class SearchMockData {
  const SearchMockData._();

  static const SpaFilterCriteria defaultCriteria = SpaFilterCriteria(
    location: 'Ho Chi Minh City',
    distanceKm: 5.0,
    services: ['Hair', 'Massage'],
    date: 'This Week',
    time: 'Any Time',
    priceRange: RangeValues(20, 150),
    rating: '4.5+',
  );

  static const List<SearchStoreItem> stores = [
    SearchStoreItem(
      id: 'store_1',
      name: 'Aura Studio',
      rating: 4.9,
      distance: '1.2 km',
      tags: ['Hair', 'Hair', 'Hair'],
      description:
          'Premium hair coloring and styling in a serene, light-filled environment designed for ultimate relaxation and rejuvenation.',
      imageUrl:
          'https://images.unsplash.com/photo-1527799820374-dcf8d9d4a388?auto=format&fit=crop&w=800&q=80',
      isFavorite: true,
    ),
    SearchStoreItem(
      id: 'store_2',
      name: 'Lotus Zen Spa & Wellness',
      rating: 4.8,
      distance: '2.5 km',
      tags: ['Massage', 'Facial', 'Spa'],
      description:
          'Holistic aromatherapy treatments and signature hot stone massage therapy designed to relieve tension and restore your inner glow.',
      imageUrl:
          'https://images.unsplash.com/photo-1540555700478-4be289fbecef?auto=format&fit=crop&w=800&q=80',
      isFavorite: false,
    ),
    SearchStoreItem(
      id: 'store_3',
      name: 'Lumiere Hair & Beauty Boutique',
      rating: 4.9,
      distance: '0.8 km',
      tags: ['Hair', 'Hair Color', 'Styling'],
      description:
          'Award-winning hair experts specializing in balayage, precision cuts, and luxury scalp hair treatments.',
      imageUrl:
          'https://images.unsplash.com/photo-1560066984-138dadb4c035?auto=format&fit=crop&w=800&q=80',
      isFavorite: false,
    ),
    SearchStoreItem(
      id: 'store_4',
      name: 'Zen Nail & Beauty Lounge',
      rating: 4.7,
      distance: '1.5 km',
      tags: ['Nail', 'Nail Art', 'Manicure'],
      description:
          'Organic non-toxic nail care, intricate artistic nail design, and deluxe spa pedicures in a chic, hygienic space.',
      imageUrl:
          'https://images.unsplash.com/photo-1632345031435-8727f6897d53?auto=format&fit=crop&w=800&q=80',
      isFavorite: false,
    ),
    SearchStoreItem(
      id: 'store_5',
      name: 'Glow Facial & Skin Sanctuary',
      rating: 4.9,
      distance: '3.0 km',
      tags: ['Facial', 'Skin Care', 'Anti-aging'],
      description:
          'Advanced dermatological facials, gentle oxygen peeling, and cellular hydration therapies with visible results.',
      imageUrl:
          'https://images.unsplash.com/photo-1519415510236-718bdfcd89c8?auto=format&fit=crop&w=800&q=80',
      isFavorite: true,
    ),
  ];
}
