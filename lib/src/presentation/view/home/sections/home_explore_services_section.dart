import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';

class ServiceCategoryItem {
  final String id;
  final String label;
  final IconData icon;

  const ServiceCategoryItem({
    required this.id,
    required this.label,
    required this.icon,
  });
}

class HomeExploreServicesSection extends StatelessWidget {
  final List<ServiceCategoryItem> categories;
  final String selectedCategoryId;
  final ValueChanged<ServiceCategoryItem> onCategorySelected;

  static const Color _coralColor = Color(0xFFFC6E58);
  static const Color _textDark = Color(0xFF1E2022);

  const HomeExploreServicesSection({
    super.key,
    required this.categories,
    required this.selectedCategoryId,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            context.l10n.exploreServices,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: _textDark,
              letterSpacing: -0.3,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 48,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: categories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final item = categories[index];
              final isSelected = item.id == selectedCategoryId;

              return Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => onCategorySelected(item),
                  borderRadius: BorderRadius.circular(24),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.fromLTRB(6, 6, 16, 6),
                    decoration: BoxDecoration(
                      color: isSelected ? _coralColor : Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: isSelected
                            ? _coralColor
                            : const Color(0xFFF1F3F5),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: isSelected
                              ? _coralColor.withValues(alpha: 0.3)
                              : Colors.black.withValues(alpha: 0.03),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // White circle badge covering the icon
                        Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFFF4F6F8),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              item.icon,
                              size: 17,
                              color: isSelected
                                  ? _coralColor
                                  : const Color(0xFF374151),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          item.label,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: isSelected
                                ? FontWeight.w700
                                : FontWeight.w600,
                            color: isSelected ? Colors.white : _textDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
