import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class ProfileMenuItemData {
  final IconData icon;
  final String title;
  final String? trailingText;
  final Color iconColor;
  final VoidCallback? onTap;

  const ProfileMenuItemData({
    required this.icon,
    required this.title,
    this.trailingText,
    this.iconColor = const Color(0xFF3F6874),
    this.onTap,
  });
}

class ProfileMenuSection extends StatelessWidget {
  final String title;
  final List<ProfileMenuItemData> items;

  const ProfileMenuSection({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.8,
              color: Color(0xFFB84A32),
            ),
          ),
        ),

        // Rounded Card Container
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFF0EBE6), width: 1.2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: items.length,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                thickness: 1,
                color: Color(0xFFF5EFEB),
                indent: 48,
                endIndent: 16,
              ),
              itemBuilder: (context, index) {
                final item = items[index];
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: item.onTap,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      child: Row(
                        children: [
                          Icon(item.icon, size: 20, color: item.iconColor),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 14.5,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2C2420),
                              ),
                            ),
                          ),
                          if (item.trailingText != null) ...[
                            Text(
                              item.trailingText!,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF8A7D75),
                              ),
                            ),
                            const SizedBox(width: 6),
                          ],
                          const Icon(
                            LucideIcons.chevron_right,
                            size: 18,
                            color: Color(0xFFD4A394),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
