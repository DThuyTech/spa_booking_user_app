import 'package:board_oi/src/presentation/view/booking_dashboard/mockup_data/booking_dashboard_mock_data.dart';
import 'package:board_oi/src/presentation/view/booking_dashboard/widgets/booking_dashboard_card.dart';
import 'package:board_oi/src/presentation/view/booking_dashboard/widgets/booking_dashboard_summary_grid.dart';
import 'package:board_oi/src/presentation/view/booking_dashboard/widgets/booking_dashboard_summary_short_bar.dart';
import 'package:board_oi/src/presentation/view/booking_dashboard/widgets/booking_search_filter_bar.dart';
import 'package:board_oi/src/presentation/view/booking_dashboard_detail/view/booking_dashboard_detail_view.dart';
import 'package:board_oi/src/shared/widgets/toast/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class BookingDashboardBodyView extends StatefulWidget {
  const BookingDashboardBodyView({super.key});

  @override
  State<BookingDashboardBodyView> createState() =>
      _BookingDashboardBodyViewState();
}

class _BookingDashboardBodyViewState extends State<BookingDashboardBodyView> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  bool _isScrolled = false;
  String _selectedFilter = 'UPCOMING';
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    final scrolled = _scrollController.offset > 80;
    if (scrolled != _isScrolled) {
      setState(() {
        _isScrolled = scrolled;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _navigateToDetail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const BookingDashboardDetailView()),
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
                  children:
                      [
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
                            color: isSel
                                ? Colors.white
                                : const Color(0xFF475569),
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                          onSelected: (val) {
                            setState(() {
                              _selectedFilter = filter;
                            });
                            Navigator.of(sheetCtx).pop();
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Short View Summary pinned when user scrolls down
        AnimatedCrossFade(
          firstChild: const SizedBox(width: double.infinity, height: 0),
          secondChild: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: BookingDashboardSummaryShortBar(
              upcomingCount: BookingDashboardMockData.upcomingCount,
              todayCount: BookingDashboardMockData.todayCount,
              completedCount: BookingDashboardMockData.completedCount,
              cancelledCount: BookingDashboardMockData.cancelledCount,
              selectedFilter: _selectedFilter,
              onFilterSelect: (filter) {
                setState(() {
                  _selectedFilter = filter;
                });
              },
            ),
          ),
          crossFadeState: _isScrolled
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 250),
        ),

        // Scrollable Body
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Full 2x2 Summary Grid (collapses smoothly as user scrolls)
                BookingDashboardSummaryGrid(
                  upcomingCount: BookingDashboardMockData.upcomingCount,
                  todayCount: BookingDashboardMockData.todayCount,
                  completedCount: BookingDashboardMockData.completedCount,
                  cancelledCount: BookingDashboardMockData.cancelledCount,
                  selectedFilter: _selectedFilter,
                  onFilterSelect: (filter) {
                    setState(() {
                      _selectedFilter = filter;
                    });
                  },
                ),

                const SizedBox(height: 18),

                // Search Bar with Filter Button (Like home page)
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

                // Bookings Sections
                ...BookingDashboardMockData.groups.map((group) {
                  final filteredItems = group.items.where((item) {
                    if (_searchQuery.isEmpty) return true;
                    return item.title.toLowerCase().contains(_searchQuery) ||
                        (item.storeName?.toLowerCase().contains(_searchQuery) ??
                            false) ||
                        (item.staffName?.toLowerCase().contains(_searchQuery) ??
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
                              onView: () => _navigateToDetail(context),
                              onReschedule: () {
                                AppToast.info(
                                  context,
                                  message: 'Reschedule ${item.title}',
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }),

                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
