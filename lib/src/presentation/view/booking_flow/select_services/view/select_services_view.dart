import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:spa_booking/src/shared/design_system/components/navigation/app_app_bar.dart';
import '../../../../../shared/design_system/components/buttons/app_icon_button.dart';
import '../../booking_schedule/view/booking_schedule_view.dart';
import '../../models/booking_models.dart';
import '../body_view/select_services_body_view.dart';
import '../mockup_data/select_services_mock_data.dart';

@RoutePage()
class SelectServicesPage extends StatelessWidget {
  final String salonName;

  const SelectServicesPage({super.key, this.salonName = 'LUXE SALON'});

  @override
  Widget build(BuildContext context) {
    return SelectServicesView(salonName: salonName);
  }
}

class SelectServicesView extends StatefulWidget {
  final String salonName;

  const SelectServicesView({super.key, this.salonName = 'LUXE SALON'});

  @override
  State<SelectServicesView> createState() => _SelectServicesViewState();
}

class _SelectServicesViewState extends State<SelectServicesView> {
  late final TextEditingController _customerSearchController;
  late List<BookingServiceItem> _services;
  String _selectedCategory = 'All';
  String? _selectedStaffId = 'staff_sa';

  static const Color _coralColor = Color(0xFFFF6F59);
  static const Color _textDark = Color(0xFF1E2022);

  @override
  void initState() {
    super.initState();
    _customerSearchController = TextEditingController();
    _services = List.from(SelectServicesMockData.services);
  }

  @override
  void dispose() {
    _customerSearchController.dispose();
    super.dispose();
  }

  void _onServiceToggle(BookingServiceItem service) {
    setState(() {
      final index = _services.indexWhere((s) => s.id == service.id);
      if (index != -1) {
        final current = _services[index];
        _services[index] = current.copyWith(isSelected: !current.isSelected);
      }
    });
  }

  int get _selectedCount => _services.where((s) => s.isSelected).length;

  int get _totalPrice => _services
      .where((s) => s.isSelected)
      .fold(0, (sum, item) => sum + item.price);

  String get _formattedTotalPrice => _formatVnd(_totalPrice);

  String _formatVnd(int amount) {
    final str = amount.toString();
    final buffer = StringBuffer();
    int count = 0;
    for (int i = str.length - 1; i >= 0; i--) {
      buffer.write(str[i]);
      count++;
      if (count % 3 == 0 && i > 0) {
        buffer.write(',');
      }
    }
    return '${buffer.toString().split('').reversed.join('')} VND';
  }

  void _onConfirmBooking() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BookingScheduleView(
          salonName: widget.salonName,
          selectedServices: _services.where((s) => s.isSelected).toList(),
          selectedStaffId: _selectedStaffId,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppAppBar(
        centerTitle: false,
        showBackButton: false,
        titleWidget: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Booking',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: _textDark,
              ),
            ),
            SizedBox(height: 2),
            Row(
              children: [
                Icon(LucideIcons.calendar, size: 13, color: Color(0xFF71717A)),
                SizedBox(width: 4),
                Text(
                  'Sarah • 10:00 AM - 10:30 AM (30 min)',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF71717A),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: AppIconButton(
              icon: LucideIcons.x,
              dimension: 40,
              iconSize: 18,
              backgroundColor: const Color(0xFFF1F5F9),
              iconColor: _textDark,
              borderRadius: BorderRadius.circular(20),
              onPressed: () => Navigator.of(context).maybePop(),
            ),
          ),
        ],
      ),
      body: SelectServicesBodyView(
        selectedServiceCount: _selectedCount,
        selectedDurationTotal: '1h30m',
        selectedPriceTotal: _formattedTotalPrice,
        customerSearchController: _customerSearchController,
        selectedCategory: _selectedCategory,
        onCategorySelected: (cat) {
          setState(() {
            _selectedCategory = cat;
          });
        },
        services: _services,
        onServiceToggle: _onServiceToggle,
        staffMembers: SelectServicesMockData.staffMembers,
        selectedStaffId: _selectedStaffId,
        onStaffSelected: (staff) {
          setState(() {
            _selectedStaffId = staff.id;
          });
        },
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 14,
          bottom: MediaQuery.of(context).padding.bottom > 0
              ? MediaQuery.of(context).padding.bottom + 8
              : 16,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Total Est.',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  _formattedTotalPrice,
                  style: const TextStyle(
                    fontSize: 17.5,
                    fontWeight: FontWeight.w800,
                    color: _textDark,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: _onConfirmBooking,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _coralColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Confirm Booking'),
                    SizedBox(width: 6),
                    Icon(LucideIcons.arrow_right, size: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
