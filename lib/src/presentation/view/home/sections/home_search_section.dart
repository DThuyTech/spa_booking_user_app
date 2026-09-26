import 'package:flutter/material.dart';
import '../widgets/home_search_bar.dart';

/// Search input section on the Home dashboard.
class HomeSearchSection extends StatelessWidget {
  final VoidCallback? onSearchTap;
  final VoidCallback? onFilterTap;

  const HomeSearchSection({
    super.key,
    this.onSearchTap,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return HomeSearchBar(
      onTap: onSearchTap,
      onFilterTap: onFilterTap,
    );
  }
}
