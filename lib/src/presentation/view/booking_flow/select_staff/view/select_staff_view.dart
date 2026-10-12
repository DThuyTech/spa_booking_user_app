import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_booking/src/app/di/dependency_injection.dart';
import 'package:spa_booking/src/domain/entities/store/staff_entity.dart';
import 'package:spa_booking/src/presentation/bloc/store/store_staff/store_staff_bloc.dart';
import 'package:spa_booking/src/shared/shared.dart';
import '../../booking_schedule/view/booking_schedule_view.dart';
import '../../models/booking_models.dart';

class SelectStaffView extends StatelessWidget {
  final String? storeId;
  final String salonName;
  final List<BookingServiceItem> selectedServices;
  final String? initialSelectedStaffId;

  const SelectStaffView({
    super.key,
    this.storeId,
    required this.salonName,
    required this.selectedServices,
    this.initialSelectedStaffId,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveStoreId = storeId;
    final hasStaffBloc =
        context.findAncestorWidgetOfExactType<BlocProvider<StoreStaffBloc>>() !=
        null;
    final canResolveStaff = sl.isRegistered<StoreStaffBloc>();

    if (!hasStaffBloc &&
        canResolveStaff &&
        effectiveStoreId != null &&
        effectiveStoreId.isNotEmpty) {
      return BlocProvider<StoreStaffBloc>(
        create: (_) =>
            sl<StoreStaffBloc>()
              ..add(FetchStaffEvent(storeId: effectiveStoreId)),
        child: _SelectStaffContentView(
          storeId: effectiveStoreId,
          salonName: salonName,
          selectedServices: selectedServices,
          initialSelectedStaffId: initialSelectedStaffId,
        ),
      );
    }

    return _SelectStaffContentView(
      storeId: effectiveStoreId,
      salonName: salonName,
      selectedServices: selectedServices,
      initialSelectedStaffId: initialSelectedStaffId,
    );
  }
}

class _SelectStaffContentView extends StatefulWidget {
  final String? storeId;
  final String salonName;
  final List<BookingServiceItem> selectedServices;
  final String? initialSelectedStaffId;

  const _SelectStaffContentView({
    this.storeId,
    required this.salonName,
    required this.selectedServices,
    this.initialSelectedStaffId,
  });

  @override
  State<_SelectStaffContentView> createState() =>
      _SelectStaffContentViewState();
}

class _SelectStaffContentViewState extends State<_SelectStaffContentView> {
  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);
  static const Color _textMuted = Color(0xFF64748B);

  // Map lưu chuyên viên được chọn cho từng dịch vụ: { serviceId : staffProfileId? }
  // staffProfileId == null nghĩa là "Bất kỳ chuyên viên nào (Tự động)"
  final Map<String, String?> _selectedStaffPerService = {};

  @override
  void initState() {
    super.initState();
    for (final service in widget.selectedServices) {
      // Mặc định ban đầu là null ("Bất kỳ chuyên viên nào (Tối ưu)")
      // Tránh việc tự ý gán thợ không có kỹ năng cho dịch vụ này
      _selectedStaffPerService[service.id] = null;
    }
  }

  String? get _primaryStaffId {
    // Trả về staff được chọn đầu tiên nếu có, hoặc null nếu tất cả là bất kỳ ai
    for (final staffId in _selectedStaffPerService.values) {
      if (staffId != null && staffId.isNotEmpty) {
        return staffId;
      }
    }
    return null;
  }

  void _onQuickBook() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BookingScheduleView(
          storeId: widget.storeId,
          salonName: widget.salonName,
          selectedServices: widget.selectedServices,
          selectedStaffId: null,
          selectedStaffPerService: const {},
          isQuickBook: true,
        ),
      ),
    );
  }

  void _onContinueToSchedule() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BookingScheduleView(
          storeId: widget.storeId,
          salonName: widget.salonName,
          selectedServices: widget.selectedServices,
          selectedStaffId: _primaryStaffId,
          selectedStaffPerService: _selectedStaffPerService,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isVi = Localizations.localeOf(context).languageCode == 'vi';
    final hasStaffBloc =
        context.findAncestorWidgetOfExactType<BlocProvider<StoreStaffBloc>>() !=
        null;

    List<StaffEntity> allStaff = [];
    bool isLoading = false;

    if (hasStaffBloc) {
      final state = context.watch<StoreStaffBloc>().state;
      isLoading = state.isLoading;
      allStaff = state.staffList;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppAppBar(
        title: isVi ? 'Chọn chuyên viên' : 'Select Specialist',
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrow_left, color: _textDark),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: Column(
        children: [
          // 1. Banner tóm tắt số dịch vụ & tổng tiền

          // 2. Danh sách dịch vụ và chuyên viên tương ứng
          Expanded(
            child: isLoading && allStaff.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(color: _coralColor),
                  )
                : ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    children: [
                      // Tiêu đề nhỏ hướng dẫn
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12, left: 2),
                        child: Text(
                          isVi
                              ? 'Chỉ định chuyên viên cho từng dịch vụ đã chọn:'
                              : 'Assign specialist for each selected service:',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF475569),
                          ),
                        ),
                      ),

                      // Duyệt qua từng dịch vụ đã chọn
                      ...widget.selectedServices.map(
                        (service) => _buildServiceStaffAssignmentCard(
                          service: service,
                          allStaff: allStaff,
                          isVi: isVi,
                        ),
                      ),

                      const SizedBox(height: 16),
                    ],
                  ),
          ),

          // 3. Bottom Bar: Đặt Nhanh & Xem Khung Giờ
          _buildBottomActionBar(isVi),
        ],
      ),
    );
  }

  // MARK: - Card Gán Chuyên Viên Cho Từng Dịch Vụ
  Widget _buildServiceStaffAssignmentCard({
    required BookingServiceItem service,
    required List<StaffEntity> allStaff,
    required bool isVi,
  }) {
    // Lọc ra các thợ có khả năng làm dịch vụ này dựa vào capableServiceIds
    final capableStaff = allStaff.where((s) {
      if (s.capableServiceIds.isEmpty) {
        return true; // fallback nếu chưa cấu hình
      }
      return s.capableServiceIds.contains(service.id);
    }).toList();

    // Nếu không ai có capableServiceIds khớp, fallback hiển thị allStaff để khách không bị khóa
    final staffToDisplay = capableStaff.isNotEmpty ? capableStaff : allStaff;

    final rawSelectedStaffId = _selectedStaffPerService[service.id];
    // Chỉ giữ staffId nếu nhân viên đó thực sự có trong danh sách thợ làm được dịch vụ này
    final currentSelectedStaffId =
        (rawSelectedStaffId != null &&
            staffToDisplay.any((s) => s.staffProfileId == rawSelectedStaffId))
        ? rawSelectedStaffId
        : null;

    // Tìm tên chuyên viên đang được chọn để hiển thị label
    String selectedStaffNameDisplay = isVi
        ? 'Bất kỳ ai (Tối ưu)'
        : 'Any Specialist';
    if (currentSelectedStaffId != null) {
      final found = staffToDisplay.cast<StaffEntity?>().firstWhere(
        (s) => s?.staffProfileId == currentSelectedStaffId,
        orElse: () => null,
      );
      if (found != null) {
        selectedStaffNameDisplay = found.fullName;
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.025),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header: Thông tin dịch vụ
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: _textDark,
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        const Icon(
                          LucideIcons.clock,
                          size: 11,
                          color: _textMuted,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          service.duration,
                          style: const TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w500,
                            color: _textMuted,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '•  ${service.priceDisplay}',
                          style: const TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF334155),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Badge trạng thái thợ đang chọn
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: currentSelectedStaffId == null
                      ? const Color(0xFFF1F5F9)
                      : _coralColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  selectedStaffNameDisplay,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: currentSelectedStaffId == null
                        ? const Color(0xFF64748B)
                        : _coralColor,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),
          const Divider(color: Color(0xFFF8FAFC), height: 1, thickness: 1),
          const SizedBox(height: 6),

          // 2. Danh sách chuyên viên dạng List Items (Avatar, Tên, Checkbox)
          Column(
            children: [
              // Tuỳ chọn mặc định: Bất kỳ ai
              _buildStaffListItem(
                title: isVi ? 'Bất kỳ chuyên viên nào' : 'Any Specialist',
                subtitle: isVi
                    ? 'Hệ thống tự ghép chuyên viên tối ưu nhất'
                    : 'Auto-assign best available specialist',
                icon: LucideIcons.shuffle,
                isSelected: currentSelectedStaffId == null,
                onTap: () {
                  setState(() {
                    _selectedStaffPerService[service.id] = null;
                  });
                },
              ),

              // Danh sách từng thợ có kỹ năng làm dịch vụ này
              ...staffToDisplay.map((staff) {
                final isStaffSelected =
                    currentSelectedStaffId == staff.staffProfileId;

                return Column(
                  children: [
                    const Divider(
                      color: Color(0xFFF8FAFC),
                      height: 1,
                      indent: 46,
                    ),
                    _buildStaffListItem(
                      title: staff.fullName,
                      subtitle:
                          '★ ${staff.rating.toStringAsFixed(1)}${staff.role != null && staff.role!.isNotEmpty ? ' • ${staff.role}' : ''}',
                      photoUrl: staff.avatarUrl,
                      isSelected: isStaffSelected,
                      onTap: () {
                        setState(() {
                          _selectedStaffPerService[service.id] =
                              staff.staffProfileId;
                        });
                      },
                    ),
                  ],
                );
              }),
            ],
          ),
        ],
      ),
    );
  }

  // MARK: - List Item Chuyên Viên (Avatar + Tên + Checkbox)
  Widget _buildStaffListItem({
    required String title,
    String? subtitle,
    IconData? icon,
    String? photoUrl,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Row(
            children: [
              // 1. Avatar tròn hoặc Icon
              if (icon != null)
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? _coralColor.withValues(alpha: 0.12)
                        : const Color(0xFFF1F5F9),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: 16,
                    color: isSelected ? _coralColor : const Color(0xFF64748B),
                  ),
                )
              else if (photoUrl != null && photoUrl.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: Image.network(
                    photoUrl,
                    width: 34,
                    height: 34,
                    fit: BoxFit.cover,
                    errorBuilder: (_, _, _) =>
                        _buildMiniFallbackAvatar(title, isSelected),
                  ),
                )
              else
                _buildMiniFallbackAvatar(title, isSelected),

              const SizedBox(width: 12),

              // 2. Họ tên & Phụ đề
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 13.5,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w600,
                        color: isSelected ? _textDark : const Color(0xFF334155),
                        letterSpacing: -0.1,
                      ),
                    ),
                    if (subtitle != null && subtitle.isNotEmpty) ...[
                      const SizedBox(height: 1),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? _coralColor : _textMuted,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              const SizedBox(width: 10),

              // 3. Checkbox nhỏ gọn (20px)
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMiniFallbackAvatar(String name, bool isSelected) {
    final initials = name.trim().isNotEmpty
        ? name
              .trim()
              .split(' ')
              .map((e) => e.isNotEmpty ? e[0] : '')
              .take(2)
              .join()
              .toUpperCase()
        : 'NV';

    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isSelected
            ? _coralColor.withValues(alpha: 0.15)
            : const Color(0xFFE2E8F0),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: isSelected ? _coralColor : const Color(0xFF475569),
        ),
      ),
    );
  }

  // MARK: - Bottom Action Bar
  Widget _buildBottomActionBar(bool isVi) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 14,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Nút 1: Đặt Nhanh Giờ Sớm Nhất
            Flexible(
              child: SizedBox(
                width: double.infinity,
                height: 44,
                child: OutlinedButton.icon(
                  onPressed: _onQuickBook,

                  label: Text(
                    isVi ? 'Đặt nhanh' : 'Quick-book',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFB45309),
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFFBEB),
                    padding: EdgeInsets.zero,
                    side: const BorderSide(
                      color: Color(0xFFFDE68A),
                      width: 1.2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 4),
            // Nút 2: Tiếp Tục Chọn Ngày & Giờ
            Flexible(
              child: SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  onPressed: _onContinueToSchedule,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _coralColor,
                    padding: EdgeInsets.zero,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    isVi ? 'Xem khung giờ khả dụng' : 'View available slots',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
