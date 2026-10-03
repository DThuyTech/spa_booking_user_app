import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';

class FavoriteStoresEmptyView extends StatelessWidget {
  final bool isSearching;
  final VoidCallback onAction;

  const FavoriteStoresEmptyView({
    super.key,
    required this.isSearching,
    required this.onAction,
  });

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textSubtle = Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: _coralColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isSearching ? LucideIcons.search_x : LucideIcons.heart,
                size: 38,
                color: _coralColor,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              isSearching ? 'No Matching Favorites' : 'No Favorite Salons Yet',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: _textDark,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              isSearching
                  ? 'Try searching with different keywords or clearing your active filters.'
                  : 'Tap the heart icon on any salon to save your favorite beauty spots here.',
              style: const TextStyle(
                fontSize: 14,
                color: _textSubtle,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            AppButton(
              text: isSearching ? 'Clear Search & Filter' : 'Explore Salons',
              backgroundColor: _coralColor,
              onPressed: onAction,
            ),
          ],
        ),
      ),
    );
  }
}
