import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class StoreGalleryTabView extends StatelessWidget {
  final String? coverImageUrl;
  final List<String> images;
  final ValueChanged<String>? onPhotoTap;

  const StoreGalleryTabView({
    super.key,
    this.coverImageUrl,
    this.images = const [],
    this.onPhotoTap,
  });

  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF64748B);
  static const Color _coralColor = Color(0xFFFF6F59);

  void _showPhotoPreview(BuildContext context, String imageUrl) {
    if (onPhotoTap != null) {
      onPhotoTap!(imageUrl);
      return;
    }

    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.88),
      builder: (dialogCtx) => Stack(
        children: [
          Center(
            child: InteractiveViewer(
              panEnabled: true,
              minScale: 0.8,
              maxScale: 4.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Container(
                      padding: const EdgeInsets.all(24),
                      color: Colors.black54,
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            LucideIcons.image_off,
                            color: Colors.white70,
                            size: 48,
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Unable to load image',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: SafeArea(
              child: Material(
                color: Colors.black54,
                shape: const CircleBorder(),
                child: IconButton(
                  icon: const Icon(
                    LucideIcons.x,
                    color: Colors.white,
                    size: 22,
                  ),
                  onPressed: () => Navigator.of(dialogCtx).pop(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final validCover =
        (coverImageUrl != null && coverImageUrl!.trim().isNotEmpty)
        ? coverImageUrl!.trim()
        : null;

    final additionalImages = images
        .where((img) => img.trim().isNotEmpty && img.trim() != validCover)
        .toList();

    final allImages = [?validCover, ...additionalImages];

    if (allImages.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  LucideIcons.image,
                  size: 36,
                  color: Color(0xFF94A3B8),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Chưa có ảnh trong bộ sưu tập',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: _textDark,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Hình ảnh salon sẽ được cập nhật sớm.',
                style: TextStyle(fontSize: 13.5, color: _textMuted),
              ),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Salon photos',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: _textDark,
                  letterSpacing: -0.2,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: _coralColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${allImages.length} ảnh',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: _coralColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // 1. Featured Cover Photo Card
          if (validCover != null) ...[
            GestureDetector(
              onTap: () => _showPhotoPreview(context, validCover),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      width: double.infinity,
                      height: 220,
                      color: const Color(0xFFE2E8F0),
                      child: Image.network(
                        validCover,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                              child: Icon(
                                LucideIcons.image,
                                size: 44,
                                color: Color(0xFF94A3B8),
                              ),
                            ),
                      ),
                    ),
                  ),
                  // Cover Image Badge
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.55),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            LucideIcons.sparkles,
                            color: Colors.white,
                            size: 13,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Cover Image',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Tap to zoom hint icon
                  Positioned(
                    bottom: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.5),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        LucideIcons.maximize_2,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
          ],

          // 2. Additional Grid of Photos (if any)
          if (additionalImages.isNotEmpty) ...[
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: additionalImages.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.1,
              ),
              itemBuilder: (context, index) {
                final photoUrl = additionalImages[index];
                return GestureDetector(
                  onTap: () => _showPhotoPreview(context, photoUrl),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      color: const Color(0xFFE2E8F0),
                      child: Image.network(
                        photoUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
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
          ],
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
