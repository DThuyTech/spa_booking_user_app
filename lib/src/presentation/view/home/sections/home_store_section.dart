import 'package:board_oi/src/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import '../widgets/home_section_header.dart';
import '../widgets/home_store_card.dart';

/// Section showing recommended or nearby salons, with contract-first placeholder support.
class HomeStoreSection extends StatelessWidget {
  final VoidCallback? onStoreTap;

  const HomeStoreSection({super.key, this.onStoreTap});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeSectionHeader(title: l10n.recommendedSalons),
        const SizedBox(height: 8),
        HomeStoreCard(onTap: onStoreTap),
      ],
    );
  }
}
