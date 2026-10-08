import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../domain/entities/booking/booking_entity.dart';
import '../../../../shared/utils/app_toast_helper.dart';
import '../../../bloc/booking/booking_dashboard/booking_dashboard_bloc.dart';
import '../../booking_dashboard_detail/view/booking_dashboard_detail_view.dart';
import '../models/booking_dashboard_models.dart';
import '../widgets/booking_dashboard_card.dart';
import '../widgets/booking_dashboard_summary_grid.dart';
import '../widgets/booking_dashboard_summary_short_bar.dart';
import '../widgets/booking_search_filter_bar.dart';

class BookingDashboardBodyView extends StatefulWidget {
  final String? initialTab;

  const BookingDashboardBodyView({super.key, this.initialTab});

  @override
  State<BookingDashboardBodyView> createState() =>
      _BookingDashboardBodyViewState();
}

class _BookingDashboardBodyViewState extends State<BookingDashboardBodyView> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  bool _isScrolled = false;
  late String _selectedFilter;
  String _selectedStatus = 'ALL';
  DateTime? _selectedDate;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    final tab = widget.initialTab ?? 'UPCOMING';
    _selectedFilter = tab == 'PAST' ? 'COMPLETED' : tab;
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    final scrolled = _scrollController.offset > 170;
    if (scrolled != _isScrolled) {
      setState(() {
        _isScrolled = scrolled;
      });
    }

    if (_scrollController.hasClients &&
        _scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200) {
      try {
        context.read<BookingDashboardBloc>().add(const LoadMoreBookingsEvent());
      } catch (_) {}
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onFilterSelect(String filter) {
    if (_selectedFilter == filter) return;
    setState(() {
      _selectedFilter = filter;
    });
    try {
      final apiTab = filter == 'COMPLETED'
          ? 'PAST'
          : (filter == 'All' ? 'ALL' : filter);
      context.read<BookingDashboardBloc>().add(ChangeBookingTabEvent(apiTab));
    } catch (_) {}
  }

  void _navigateToDetail(BuildContext context, String bookingId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BookingDashboardDetailView(bookingId: bookingId),
      ),
    );
  }

  void _showFilterSheet() {
    final l10n = context.l10n;
    String tempStatus = _selectedStatus;
    DateTime? tempDate = _selectedDate;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetCtx) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            final formattedDateStr = tempDate != null
                ? '${tempDate!.year}-${tempDate!.month.toString().padLeft(2, '0')}-${tempDate!.day.toString().padLeft(2, '0')}'
                : null;

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Handle bar
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE2E8F0),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Header Row with Title, Reset & Close
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          l10n.filterBookings,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                setSheetState(() {
                                  tempStatus = 'ALL';
                                  tempDate = null;
                                });
                              },
                              child: Text(
                                l10n.resetFilter,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFFA7762),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(LucideIcons.x, size: 20),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: () => Navigator.of(sheetCtx).pop(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Section 1: Status Filter
                    Text(
                      l10n.statusLabel,
                      style: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF475569),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children:
                          [
                            {'code': 'ALL', 'label': l10n.all},
                            {'code': 'PENDING', 'label': l10n.statusPending},
                            {
                              'code': 'CONFIRMED',
                              'label': l10n.statusConfirmed,
                            },
                            {
                              'code': 'COMPLETED',
                              'label': l10n.statusCompleted,
                            },
                            {
                              'code': 'CANCELLED',
                              'label': l10n.statusCancelled,
                            },
                          ].map((s) {
                            final code = s['code']!;
                            final label = s['label']!;
                            final isSel = tempStatus == code;

                            return ChoiceChip(
                              label: Text(label),
                              selected: isSel,
                              selectedColor: const Color(0xFFFA7762),
                              backgroundColor: const Color(0xFFF1F5F9),
                              labelStyle: TextStyle(
                                color: isSel
                                    ? Colors.white
                                    : const Color(0xFF475569),
                                fontWeight: isSel
                                    ? FontWeight.w700
                                    : FontWeight.w500,
                                fontSize: 12.5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                  color: isSel
                                      ? const Color(0xFFFA7762)
                                      : const Color(0xFFE2E8F0),
                                ),
                              ),
                              onSelected: (_) {
                                setSheetState(() {
                                  tempStatus = code;
                                });
                              },
                            );
                          }).toList(),
                    ),

                    const SizedBox(height: 20),

                    // Section 2: Date / DateTime Filter
                    Text(
                      l10n.dateLabel,
                      style: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF475569),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () async {
                        final picked = await showDatePicker(
                          context: context,
                          initialDate: tempDate ?? DateTime.now(),
                          firstDate: DateTime(2024),
                          lastDate: DateTime(2030),
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: const ColorScheme.light(
                                  primary: Color(0xFFFA7762),
                                  onPrimary: Colors.white,
                                  onSurface: Color(0xFF1E293B),
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (picked != null) {
                          setSheetState(() {
                            tempDate = picked;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8FAFC),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              LucideIcons.calendar,
                              size: 18,
                              color: Color(0xFFFA7762),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                formattedDateStr ?? l10n.selectDate,
                                style: TextStyle(
                                  fontSize: 13.5,
                                  color: formattedDateStr != null
                                      ? const Color(0xFF1E293B)
                                      : const Color(0xFF94A3B8),
                                  fontWeight: formattedDateStr != null
                                      ? FontWeight.w600
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                            if (tempDate != null)
                              GestureDetector(
                                onTap: () {
                                  setSheetState(() {
                                    tempDate = null;
                                  });
                                },
                                child: const Icon(
                                  LucideIcons.x,
                                  size: 16,
                                  color: Color(0xFF94A3B8),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 26),

                    // Apply Button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFA7762),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(sheetCtx).pop();
                          setState(() {
                            _selectedStatus = tempStatus;
                            _selectedDate = tempDate;
                          });

                          try {
                            final dateParam = tempDate != null
                                ? '${tempDate!.year}-${tempDate!.month.toString().padLeft(2, '0')}-${tempDate!.day.toString().padLeft(2, '0')}'
                                : null;
                            context.read<BookingDashboardBloc>().add(
                              FetchCustomerBookingsEvent(
                                status: tempStatus == 'ALL' ? null : tempStatus,
                                date: dateParam,
                                isRefresh: true,
                              ),
                            );
                          } catch (_) {}
                        },
                        child: Text(
                          l10n.applyFilter,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  List<BookingDashboardGroup> _buildGroups(
    List<BookingEntity> bookings, {
    required bool hasBloc,
  }) {
    if (bookings.isEmpty) {
      return const [];
    }

    final now = DateTime.now();
    final todayStr =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
    final filterDateStr = _selectedDate != null
        ? '${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}'
        : null;

    final filtered = bookings.where((b) {
      final bDateStr =
          '${b.startAt.year}-${b.startAt.month.toString().padLeft(2, '0')}-${b.startAt.day.toString().padLeft(2, '0')}';

      // 1. Date filter if selected
      if (filterDateStr != null && bDateStr != filterDateStr) {
        return false;
      }

      // 2. Status filter if selected (not ALL)
      if (_selectedStatus != 'ALL' &&
          b.status.toUpperCase() != _selectedStatus) {
        return false;
      }

      // 3. Tab filter
      if (!hasBloc) {
        if (_selectedFilter == 'UPCOMING') {
          return b.status == 'CONFIRMED' || b.status == 'PENDING';
        } else if (_selectedFilter == 'ALL') {
          return true;
        } else if (_selectedFilter == 'COMPLETED' ||
            _selectedFilter == 'PAST') {
          return b.status == 'COMPLETED';
        } else if (_selectedFilter == 'CANCELLED') {
          return b.status == 'CANCELLED';
        }
      }

      return true;
    }).toList();

    // Group by booking date
    final dateMap = <String, List<BookingDashboardItem>>{};
    for (final b in filtered) {
      final bDateStr =
          '${b.startAt.year}-${b.startAt.month.toString().padLeft(2, '0')}-${b.startAt.day.toString().padLeft(2, '0')}';
      final header = bDateStr == todayStr ? 'TODAY' : bDateStr;
      final title = b.services.isNotEmpty
          ? b.services.map((i) => i.name).join(', ')
          : 'Salon Appointment';
      final startTimeStr =
          '${b.startAt.hour.toString().padLeft(2, '0')}:${b.startAt.minute.toString().padLeft(2, '0')}';
      final endTimeStr =
          '${b.endAt.hour.toString().padLeft(2, '0')}:${b.endAt.minute.toString().padLeft(2, '0')}';
      final item = BookingDashboardItem(
        id: b.id,
        title: title,
        time: startTimeStr,
        amPm: '',
        storeName: b.store?.name,
        timeRange: '$startTimeStr - $endTimeStr',
        duration: '${b.totalDuration} min',
        staffName: b.staffSnapshot != null
            ? 'Staff: ${b.staffSnapshot!.name}'
            : null,
        status: b.status,
        isHighlighted: b.status == 'CONFIRMED',
      );
      dateMap.putIfAbsent(header, () => []).add(item);
    }

    return dateMap.entries
        .map((e) => BookingDashboardGroup(dateHeader: e.key, items: e.value))
        .toList();
  }

  Widget _buildEmptyState() {
    final String title;
    final String subtitle;

    if (_searchQuery.isNotEmpty) {
      title = 'No results found';
      subtitle = 'We couldn\'t find any bookings matching "$_searchQuery"';
    } else {
      switch (_selectedFilter) {
        case 'UPCOMING':
          title = 'No upcoming bookings';
          subtitle = 'You have no upcoming appointments scheduled.';
          break;
        case 'ALL':
          title = 'No bookings found';
          subtitle = 'You have no bookings recorded yet.';
          break;
        case 'COMPLETED':
        case 'PAST':
          title = 'No past bookings';
          subtitle = 'Your completed appointments will appear here.';
          break;
        case 'CANCELLED':
          title = 'No cancelled bookings';
          subtitle = 'You don\'t have any cancelled appointments.';
          break;
        default:
          title = 'No bookings found';
          subtitle = 'You haven\'t made any bookings yet.';
      }
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                color: Color(0xFFFFF1EE),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                LucideIcons.calendar,
                size: 32,
                color: Color(0xFFFA7762),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF64748B),
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool hasBloc = false;
    try {
      BlocProvider.of<BookingDashboardBloc>(context);
      hasBloc = true;
    } catch (_) {
      hasBloc = false;
    }

    if (!hasBloc) {
      return _buildContent(
        context,
        const BookingDashboardState(),
        hasBloc: false,
      );
    }

    return BlocConsumer<BookingDashboardBloc, BookingDashboardState>(
      listener: (context, state) {
        if (state.isFailure && state.failure != null) {
          AppToastHelper.showError(context, error: state.failure);
        }
      },
      builder: (context, state) => _buildContent(context, state, hasBloc: true),
    );
  }

  Widget _buildContent(
    BuildContext context,
    BookingDashboardState state, {
    required bool hasBloc,
  }) {
    final l10n = context.l10n;
    final bookings = state.items;

    final int upcomingCount = hasBloc ? state.summary.upcoming : 0;
    final int allCount = hasBloc ? state.summary.total : 0;
    final int pastCount = hasBloc ? state.summary.past : 0;
    final int cancelledCount = hasBloc ? state.summary.cancelled : 0;

    final groups = _buildGroups(bookings, hasBloc: hasBloc);

    final totalMatchingItems = groups.fold<int>(0, (prev, group) {
      final matching = group.items.where((item) {
        if (_searchQuery.isEmpty) return true;
        return item.title.toLowerCase().contains(_searchQuery) ||
            (item.storeName?.toLowerCase().contains(_searchQuery) ?? false) ||
            (item.staffName?.toLowerCase().contains(_searchQuery) ?? false);
      }).length;
      return prev + matching;
    });

    return Stack(
      children: [
        // Scrollable Body
        RefreshIndicator(
          color: const Color(0xFFFA7762),
          onRefresh: () async {
            try {
              final apiTab = _selectedFilter == 'COMPLETED'
                  ? 'PAST'
                  : (_selectedFilter == 'All' ? 'ALL' : _selectedFilter);
              context.read<BookingDashboardBloc>().add(
                FetchCustomerBookingsEvent(tab: apiTab, isRefresh: true),
              );
            } catch (_) {}
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Full 2x2 Summary Grid
                BookingDashboardSummaryGrid(
                  upcomingCount: upcomingCount,
                  allCount: allCount,
                  pastCount: pastCount,
                  cancelledCount: cancelledCount,
                  selectedFilter: _selectedFilter,
                  onFilterSelect: _onFilterSelect,
                ),

                const SizedBox(height: 18),

                // Search Bar with Filter Button
                BookingSearchFilterBar(
                  controller: _searchController,
                  hintText: l10n.searchBookingsPlaceholder,
                  onChanged: (val) {
                    setState(() {
                      _searchQuery = val.trim().toLowerCase();
                    });
                  },
                  onFilterTap: _showFilterSheet,
                ),

                const SizedBox(height: 22),

                if (state.isLoading && bookings.isEmpty)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 40),
                      child: CircularProgressIndicator(
                        color: Color(0xFFFA7762),
                      ),
                    ),
                  )
                else if (totalMatchingItems == 0)
                  _buildEmptyState()
                else ...[
                  // Bookings Sections
                  ...groups.map((group) {
                    final filteredItems = group.items.where((item) {
                      if (_searchQuery.isEmpty) return true;
                      return item.title.toLowerCase().contains(_searchQuery) ||
                          (item.storeName?.toLowerCase().contains(
                                _searchQuery,
                              ) ??
                              false) ||
                          (item.staffName?.toLowerCase().contains(
                                _searchQuery,
                              ) ??
                              false);
                    }).toList();

                    if (filteredItems.isEmpty) {
                      return const SizedBox.shrink();
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Section Header
                          Text(
                            group.dateHeader,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF64748B),
                              letterSpacing: 0.6,
                            ),
                          ),
                          const SizedBox(height: 12),

                          // Section Items
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: filteredItems.length,
                            separatorBuilder: (_, _) =>
                                const SizedBox(height: 14),
                            itemBuilder: (context, index) {
                              final item = filteredItems[index];
                              return BookingDashboardCard(
                                item: item,
                                onView: () =>
                                    _navigateToDetail(context, item.id),
                                onReschedule: () {
                                  AppToastHelper.showInfo(
                                    context,
                                    message:
                                        'Reschedule ${item.title} (#${item.id})',
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  }),
                ],

                const SizedBox(height: 100),
              ],
            ),
          ),
        ),

        // Pinned Compact Overview Header (Fixed on top when scrolling down)
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AnimatedSlide(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeInOut,
            offset: _isScrolled ? Offset.zero : const Offset(0, -1.2),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _isScrolled ? 1.0 : 0.0,
              child: IgnorePointer(
                ignoring: !_isScrolled,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
                  child: SafeArea(
                    bottom: false,
                    top: false,
                    child: BookingDashboardSummaryShortBar(
                      upcomingCount: upcomingCount,
                      allCount: allCount,
                      pastCount: pastCount,
                      cancelledCount: cancelledCount,
                      selectedFilter: _selectedFilter,
                      onFilterSelect: _onFilterSelect,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
