import 'package:flutter/material.dart';
import 'package:spa_booking/src/shared/shared.dart';
import '../../models/booking_models.dart';

class SelectServicesBodyView extends StatelessWidget {
  final int selectedServiceCount;
  final String selectedDurationTotal;
  final String selectedPriceTotal;
  final TextEditingController? customerSearchController;
  final String? selectedCategory;
  final ValueChanged<String>? onCategorySelected;
  final List<BookingServiceItem> services;
  final ValueChanged<BookingServiceItem> onServiceToggle;
  final List<BookingStaffItem>? staffMembers;
  final String? selectedStaffId;
  final ValueChanged<BookingStaffItem>? onStaffSelected;
  final List<String>? categories;

  const SelectServicesBodyView({
    super.key,
    required this.selectedServiceCount,
    required this.selectedDurationTotal,
    required this.selectedPriceTotal,
    this.customerSearchController,
    this.selectedCategory,
    this.onCategorySelected,
    required this.services,
    required this.onServiceToggle,
    this.staffMembers,
    this.selectedStaffId,
    this.onStaffSelected,
    this.categories,
  });

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
    final isVi = Localizations.localeOf(context).languageCode == 'vi';

    // Group services by category
    final Map<String, List<BookingServiceItem>> categoryGroups = {};
    for (final service in services) {
      final cat = service.category.trim().isNotEmpty
          ? service.category.trim()
          : (isVi ? 'Dịch vụ chung' : 'General Services');
      categoryGroups.putIfAbsent(cat, () => []).add(service);
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Tóm tắt lựa chọn (Summary Card nhỏ gọn)
          _buildSummaryCard(isVi),

          const SizedBox(height: 12),

          // 2. Danh sách dịch vụ nhóm theo Category dạng Expandable Cards
          if (categoryGroups.isEmpty) ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 36),
              alignment: Alignment.center,
              child: Column(
                children: [
                  const Icon(
                    LucideIcons.scissors,
                    size: 32,
                    color: Color(0xFFCBD5E1),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    isVi ? 'Không có dịch vụ nào' : 'No services available',
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ),
          ] else ...[
            ...categoryGroups.entries.toList().asMap().entries.map((entry) {
              final index = entry.key;
              final catName = entry.value.key;
              final catServices = entry.value.value;
              final hasSelectedInGroup = catServices.any((s) => s.isSelected);

              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _buildExpandableCategoryCard(
                  categoryName: catName,
                  services: catServices,
                  initiallyExpanded: index == 0 || hasSelectedInGroup,
                  isVi: isVi,
                ),
              );
            }),
          ],

          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // MARK: - Expandable Category Card (Compact & Clean)
  Widget _buildExpandableCategoryCard({
    required String categoryName,
    required List<BookingServiceItem> services,
    required bool initiallyExpanded,
    required bool isVi,
  }) {
    final selectedInCatCount = services.where((s) => s.isSelected).length;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: selectedInCatCount > 0
              ? _coralColor.withValues(alpha: 0.35)
              : const Color(0xFFF1F5F9),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Theme(
        data: ThemeData(
          dividerColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          tilePadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
          childrenPadding: const EdgeInsets.only(bottom: 4),
          iconColor: _coralColor,
          collapsedIconColor: const Color(0xFF94A3B8),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  categoryName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: _textDark,
                    letterSpacing: -0.2,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Badge tổng số dịch vụ trong nhóm
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${services.length}',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF64748B),
                  ),
                ),
              ),
              if (selectedInCatCount > 0) ...[
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: _coralColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    isVi
                        ? 'Đã chọn $selectedInCatCount'
                        : '$selectedInCatCount picked',
                    style: const TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w700,
                      color: _coralColor,
                    ),
                  ),
                ),
              ],
            ],
          ),
          children: [
            const Divider(color: Color(0xFFF8FAFC), height: 1, thickness: 1),
            ...services.asMap().entries.map((entry) {
              final itemIndex = entry.key;
              final service = entry.value;
              final isLast = itemIndex == services.length - 1;

              return Column(
                children: [
                  _buildCompactServiceRow(service, isVi),
                  if (!isLast)
                    const Divider(
                      color: Color(0xFFF8FAFC),
                      height: 1,
                      indent: 44,
                      endIndent: 14,
                    ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  // MARK: - Compact Service Row (Simple, Small Font, Reduced Space)
  Widget _buildCompactServiceRow(BookingServiceItem service, bool isVi) {
    final isSelected = service.isSelected;

    return Material(
      color: isSelected
          ? _coralColor.withValues(alpha: 0.035)
          : Colors.transparent,
      child: InkWell(
        onTap: () => onServiceToggle(service),
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          child: Row(
            children: [
              // Checkbox nhỏ gọn (20px)
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: isSelected ? _coralColor : Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: isSelected ? _coralColor : const Color(0xFFCBD5E1),
                    width: 1.5,
                  ),
                ),
                child: isSelected
                    ? const Icon(Icons.check, size: 13, color: Colors.white)
                    : null,
              ),
              const SizedBox(width: 12),

              // Tên dịch vụ & Thời lượng
              Expanded(
                child: Text(
                  service.name,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                    color: isSelected ? _textDark : const Color(0xFF334155),
                    letterSpacing: -0.1,
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Icon(
                      LucideIcons.clock,
                      size: 11,
                      color: Color(0xFF94A3B8),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      service.duration,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF94A3B8),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 10),

              // Giá dịch vụ (Nhỏ gọn, rõ ràng)
              Text(
                service.priceDisplay,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: isSelected ? _coralColor : _textDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // MARK: - Summary Card (Compact)
  Widget _buildSummaryCard(bool isVi) {
    final selectedItems = services.where((s) => s.isSelected).toList();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.025),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: selectedItems.isEmpty
          ? Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    LucideIcons.sparkles,
                    size: 16,
                    color: Color(0xFF94A3B8),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isVi
                            ? 'Bạn chưa chọn dịch vụ nào'
                            : 'No service selected',
                        style: const TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w700,
                          color: _textDark,
                        ),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        isVi
                            ? 'Chọn ít nhất 1 dịch vụ bên dưới để tiếp tục'
                            : 'Select at least 1 service below to continue',
                        style: const TextStyle(
                          fontSize: 11.5,
                          color: _textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header: Số lượng dịch vụ + Tổng thời lượng
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isVi
                          ? 'Đã chọn $selectedServiceCount dịch vụ'
                          : '$selectedServiceCount services selected',
                      style: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w700,
                        color: _textDark,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          LucideIcons.clock,
                          size: 12,
                          color: _textMuted,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          selectedDurationTotal,
                          style: const TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w600,
                            color: _textMuted,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Danh sách tóm tắt từng dịch vụ đã chọn (nhỏ gọn)
                ...selectedItems.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '• ${item.name}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF475569),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          item.priceDisplay,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF334155),
                          ),
                        ),
                      ],
                    ),
                  );
                }),

                const SizedBox(height: 6),
                // Divider nét đứt (Dashed Divider)
                _buildDashedDivider(),
                const SizedBox(height: 8),

                // Dòng Tổng cộng
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isVi ? 'Tổng ước tính:' : 'Estimated Total:',
                      style: const TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w700,
                        color: _textDark,
                      ),
                    ),
                    Text(
                      selectedPriceTotal,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: _coralColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }

  Widget _buildDashedDivider() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 4.0;
        const dashSpace = 3.0;
        final count = (boxWidth / (dashWidth + dashSpace)).floor();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(count, (_) {
            return const SizedBox(
              width: dashWidth,
              height: 1,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Color(0xFFCBD5E1)),
              ),
            );
          }),
        );
      },
    );
  }
}
