import 'package:board_oi/src/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../widgets/home_category_item.dart';
import '../widgets/home_section_header.dart';

/// Horizontal category selection section for salon service offerings.
class HomeCategorySection extends StatelessWidget {
  final ValueChanged<String>? onCategorySelected;
  final VoidCallback? onSeeAllTap;

  const HomeCategorySection({
    super.key,
    this.onCategorySelected,
    this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final categories = [
      (label: l10n.categoryHaircut, icon: LucideIcons.scissors),
      (label: l10n.categorySpa, icon: LucideIcons.sparkles),
      (label: l10n.categoryNails, icon: LucideIcons.heart),
      (label: l10n.categoryFacial, icon: LucideIcons.flower_2),
      (label: l10n.categoryColoring, icon: LucideIcons.palette),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeSectionHeader(
          title: l10n.services,
          actionLabel: l10n.seeAll,
          onActionTap: onSeeAllTap,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 94,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: categories.length,
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final cat = categories[index];
              return HomeCategoryItem(
                label: cat.label,
                icon: cat.icon,
                onTap: () => onCategorySelected?.call(cat.label),
              );
            },
          ),
        ),
      ],
    );
  }
}
