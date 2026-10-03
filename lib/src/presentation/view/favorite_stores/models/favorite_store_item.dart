class FavoriteStoreItem {
  final String id;
  final String name;
  final double rating;
  final String distance;
  final String description;
  final String imageUrl;
  final bool isFavorite;
  final String category;
  final String address;

  const FavoriteStoreItem({
    required this.id,
    required this.name,
    required this.rating,
    required this.distance,
    required this.description,
    required this.imageUrl,
    this.isFavorite = true,
    this.category = 'All',
    this.address = '123 Beauty Ave, Central District',
  });

  FavoriteStoreItem copyWith({
    String? id,
    String? name,
    double? rating,
    String? distance,
    String? description,
    String? imageUrl,
    bool? isFavorite,
    String? category,
    String? address,
  }) {
    return FavoriteStoreItem(
      id: id ?? this.id,
      name: name ?? this.name,
      rating: rating ?? this.rating,
      distance: distance ?? this.distance,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
      category: category ?? this.category,
      address: address ?? this.address,
    );
  }
}
