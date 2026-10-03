import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import '../../../../domain/entities/booking/booking_entity.dart';
import '../../../../shared/utils/app_toast_helper.dart';
import '../../../bloc/booking/booking_dashboard/booking_dashboard_bloc.dart';
import '../../booking_dashboard_detail/view/booking_dashboard_detail_view.dart';
import '../mockup_data/booking_dashboard_mock_data.dart';
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
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetCtx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Filter Bookings',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(LucideIcons.x, size: 20),
                      onPressed: () => Navigator.of(sheetCtx).pop(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    'All',
                    'UPCOMING',
                    'TODAY',
                    'COMPLETED',
                    'CANCELLED',
                  ].map((filter) {
                    final isSel = _selectedFilter == filter;
                    return ChoiceChip(
                      label: Text(filter),
                      selected: isSel,
                      selectedColor: const Color(0xFFFA7762),
                      backgroundColor: const Color(0xFFF1F5F9),
                      labelStyle: TextStyle(
                        color: isSel ? Colors.white : const Color(0xFF475569),
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                      onSelected: (val) {
                        Navigator.of(sheetCtx).pop();
                        _onFilterSelect(filter);
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  List<BookingDashboardGroup> _buildGroups(
    List<BookingEntity> bookings, {
    required bool hasBloc,
  }) {
    if (!hasBloc && bookings.isEmpty) {
      return BookingDashboardMockData.groups;
    }
    if (bookings.isEmpty) {
      return const [];
    }

    // Filter by selected tab
    final now = DateTime.now();
    final todayStr =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

    final filtered = bookings.where((b) {
      if (!hasBloc) {
        final bDateStr =
            '${b.startAt.year}-${b.startAt.month.toString().padLeft(2, '0')}-${b.startAt.day.toString().padLeft(2, '0')}';
        if (_selectedFilter == 'UPCOMING') {
          return b.status == 'CONFIRMED' || b.status == 'PENDING';
        } else if (_selectedFilter == 'TODAY') {
          return bDateStr == todayStr;
        } else if (_selectedFilter == 'COMPLETED' || _selectedFilter == 'PAST') {
          return b.status == 'COMPLETED';
        } else if (_selectedFilter == 'CANCELLED') {
          return b.status == 'CANCELLED';
        }
        return true;
      }

      if (_selectedFilter == 'TODAY') {
        final bDateStr =
            '${b.startAt.year}-${b.startAt.month.toString().padLeft(2, '0')}-${b.startAt.day.toString().padLeft(2, '0')}';
        return bDateStr == todayStr;
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
        staffName:
            b.staffSnapshot != null ? 'Staff: ${b.staffSnapshot!.name}' : null,
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
        case 'TODAY':
          title = 'No bookings today';
          subtitle = 'You have no appointments scheduled for today.';
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
      builder: (context, state) =>
          _buildContent(context, state, hasBloc: true),
    );
  }

  Widget _buildContent(
    BuildContext context,
    BookingDashboardState state, {
    required bool hasBloc,
  }) {
    final bookings = state.items;
    final now = DateTime.now();
    final todayStr =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

    final int upcomingCount;
    final int todayCount;
    final int completedCount;
    final int cancelledCount;

    if (!hasBloc) {
      upcomingCount = BookingDashboardMockData.upcomingCount;
      todayCount = BookingDashboardMockData.todayCount;
      completedCount = BookingDashboardMockData.completedCount;
      cancelledCount = BookingDashboardMockData.cancelledCount;
    } else {
      upcomingCount = state.summary.upcoming;
      todayCount = bookings.where((b) {
        final bDateStr =
            '${b.startAt.year}-${b.startAt.month.toString().padLeft(2, '0')}-${b.startAt.day.toString().padLeft(2, '0')}';
        return bDateStr == todayStr;
      }).length;
      completedCount = state.summary.past;
      cancelledCount = state.summary.cancelled;
    }

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
                    FetchCustomerBookingsEvent(
                      tab: apiTab,
                      isRefresh: true,
                    ),
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
                  todayCount: todayCount,
                  completedCount: completedCount,
                  cancelledCount: cancelledCount,
                  selectedFilter: _selectedFilter,
                  onFilterSelect: _onFilterSelect,
                ),

                const SizedBox(height: 18),

                // Search Bar with Filter Button
                BookingSearchFilterBar(
                  controller: _searchController,
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
                      return item.title
                              .toLowerCase()
                              .contains(_searchQuery) ||
                          (item.storeName
                                  ?.toLowerCase()
                                  .contains(_searchQuery) ??
                              false) ||
                          (item.staffName
                                  ?.toLowerCase()
                                  .contains(_searchQuery) ??
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
                                onView: () => _navigateToDetail(
                                  context,
                                  item.id,
                                ),
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
                      todayCount: todayCount,
                      completedCount: completedCount,
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

