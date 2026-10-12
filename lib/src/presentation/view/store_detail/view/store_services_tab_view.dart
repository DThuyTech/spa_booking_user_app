import 'package:flutter/material.dart';
import 'package:spa_booking/src/core/extensions/double_extensions.dart';
import 'package:spa_booking/src/domain/entities/store/store.dart';
import '../../../../shared/shared.dart';

class StoreServicesTabView extends StatefulWidget {
  final List<ServiceCategoryEntity> categories;
  final List<ServiceEntity> services;
  final ValueChanged<StoreDetailEntity>? onBookService;

  const StoreServicesTabView({
    super.key,
    required this.categories,
    required this.services,
    this.onBookService,
  });

  @override
  State<StoreServicesTabView> createState() => _StoreServicesTabViewState();
}

class _StoreServicesTabViewState extends State<StoreServicesTabView> {
  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
    if (widget.services.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Center(
          child: Text(
            context.l10n.noServicesInCategory,
            style: const TextStyle(fontSize: 13.5, color: _textMuted),
          ),
        ),
      );
    }

    // Group services by category
    final sortedCategories = [...widget.categories]
      ..sort((a, b) => a.displayOrder.compareTo(b.displayOrder));

    final Map<String, List<ServiceEntity>> groupedServices = {};
    for (final cat in sortedCategories) {
      final list = widget.services
          .where((s) => s.categoryId == cat.id)
          .toList();
      if (list.isNotEmpty) {
        groupedServices[cat.name] = list;
      }
    }

    // Add uncategorized if any
    final uncategorized = widget.services
        .where(
          (s) =>
              s.categoryId == null ||
              !sortedCategories.any((cat) => cat.id == s.categoryId),
        )
        .toList();
    if (uncategorized.isNotEmpty) {
      groupedServices['Dịch vụ khác'] = uncategorized;
    }

    if (groupedServices.isEmpty) {
      groupedServices['Dịch vụ'] = widget.services;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...groupedServices.entries.toList().asMap().entries.map((entry) {
            final index = entry.key;
            final categoryName = entry.value.key;
            final services = entry.value.value;

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildExpandableCategoryCard(
                categoryName: categoryName,
                services: services,
                initiallyExpanded: index == 0,
              ),
            );
          }),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildExpandableCategoryCard({
    required String categoryName,
    required List<ServiceEntity> services,
    required bool initiallyExpanded,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.025),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          childrenPadding: const EdgeInsets.only(bottom: 8),
          iconColor: _coralColor,
          collapsedIconColor: const Color(0xFF94A3B8),
          title: Row(
            children: [
              Text(
                categoryName,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: _textDark,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${services.length}',
                  style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF64748B),
                  ),
                ),
              ),
            ],
          ),
          children: [
            const Divider(height: 1, thickness: 0.8, color: Color(0xFFF1F5F9)),
            ...services.asMap().entries.map((entry) {
              final isLast = entry.key == services.length - 1;
              final service = entry.value;

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Service details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                service.name,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: _textDark,
                                  height: 1.3,
                                ),
                              ),
                              if (service.description != null &&
                                  service.description!.trim().isNotEmpty) ...[
                                const SizedBox(height: 3),
                                Text(
                                  service.description!.trim(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: _textMuted,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  const Icon(
                                    LucideIcons.clock,
                                    size: 12,
                                    color: Color(0xFF94A3B8),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${service.durationMinutes} phút',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF64748B),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Price
                        Text(
                          service.basePrice.toVnd(),
                          style: const TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.w700,
                            color: _coralColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!isLast)
                    const Divider(
                      height: 1,
                      indent: 16,
                      endIndent: 16,
                      thickness: 0.5,
                      color: Color(0xFFF8FAFC),
                    ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
