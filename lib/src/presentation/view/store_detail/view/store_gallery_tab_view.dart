import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../mockup_data/store_detail_mock_data.dart';

class StoreGalleryTabView extends StatefulWidget {
  final List<StoreGalleryPhotoItem> photos;
  final ValueChanged<StoreGalleryPhotoItem>? onPhotoTap;

  const StoreGalleryTabView({super.key, required this.photos, this.onPhotoTap});

  @override
  State<StoreGalleryTabView> createState() => _StoreGalleryTabViewState();
}

class _StoreGalleryTabViewState extends State<StoreGalleryTabView> {
  String _selectedCategory = 'All';

  static const List<String> _categories = [
    'All',
    'Interior',
    'Services',
    'Team',
  ];

  static const Color _selectedChipBg = Color(0xFFA53C2A);
  static const Color _unselectedChipBg = Color(0xFFE0F2FE);
  static const Color _unselectedChipText = Color(0xFF0369A1);
  static const Color _textDark = Color(0xFF1E2022);

  @override
  Widget build(BuildContext context) {
    final filtered = _selectedCategory == 'All'
        ? widget.photos
        : widget.photos
              .where(
                (p) =>
                    p.category.toLowerCase() == _selectedCategory.toLowerCase(),
              )
              .toList();

    final featuredPhoto = filtered.isNotEmpty ? filtered.first : null;
    final gridPhotos = filtered.length > 1
        ? filtered.sublist(1)
        : <StoreGalleryPhotoItem>[];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          // Header
          const Text(
            'Salon photos',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: _textDark,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 14),

          // Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: _categories.map((cat) {
                final isSelected = _selectedCategory == cat;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = cat;
                      });
                    },
                    behavior: HitTestBehavior.opaque,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 9,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected ? _selectedChipBg : _unselectedChipBg,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        cat,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w600,
                          color: isSelected
                              ? Colors.white
                              : _unselectedChipText,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 18),

          // Featured Big Photo
          if (featuredPhoto != null)
            GestureDetector(
              onTap: () => widget.onPhotoTap?.call(featuredPhoto),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: SizedBox(
                  width: double.infinity,
                  height: 190,
                  child: Image.network(
                    featuredPhoto.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: const Color(0xFFE2E8F0),
                      child: const Center(
                        child: Icon(
                          LucideIcons.image,
                          size: 32,
                          color: Color(0xFF94A3B8),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          const SizedBox(height: 12),

          // 2x2 Grid of Photos
          if (gridPhotos.isNotEmpty)
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: gridPhotos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.05,
              ),
              itemBuilder: (context, index) {
                final photo = gridPhotos[index];
                return GestureDetector(
                  onTap: () => widget.onPhotoTap?.call(photo),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.network(
                      photo.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: const Color(0xFFE2E8F0),
                        child: const Center(
                          child: Icon(
                            LucideIcons.image,
                            size: 28,
                            color: Color(0xFF94A3B8),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
