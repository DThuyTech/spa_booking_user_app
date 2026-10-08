import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spa_booking/src/shared/shared.dart';
import 'package:spa_booking/src/presentation/view/insights/body_view/my_insights_body_view.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/di/dependency_injection.dart';
import '../../../bloc/insights/spending_analytics_bloc.dart';
import '../../../bloc/insights/spending_analytics_event.dart';

@RoutePage()
class MyInsightsPage extends StatelessWidget {
  const MyInsightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SpendingAnalyticsBloc>(
      create: (_) =>
          sl<SpendingAnalyticsBloc>()
            ..add(const ChangeSpendingAnalyticsPeriodEvent('This Month')),
      child: const MyInsightsView(),
    );
  }
}

class MyInsightsView extends StatefulWidget {
  const MyInsightsView({super.key});

  @override
  State<MyInsightsView> createState() => _MyInsightsViewState();
}

class _MyInsightsViewState extends State<MyInsightsView> {
  String _selectedPeriod = 'This Month';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppAppBar(
        title: 'My Insights',
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: PopupMenuButton<String>(
              initialValue: _selectedPeriod,
              onSelected: (val) {
                setState(() {
                  _selectedPeriod = val;
                });
                try {
                  context.read<SpendingAnalyticsBloc>().add(
                    ChangeSpendingAnalyticsPeriodEvent(val),
                  );
                } catch (_) {}
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'This Month',
                  child: Text(context.l10n.thisMonth),
                ),
                PopupMenuItem(
                  value: 'Last 3 Months',
                  child: Text(context.l10n.last3Months),
                ),
                PopupMenuItem(
                  value: 'This Year',
                  child: Text(context.l10n.thisYear),
                ),
              ],
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _selectedPeriod,
                      style: const TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF334155),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Icon(
                      LucideIcons.calendar,
                      size: 14,
                      color: Color(0xFFBA4A32),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: const SafeArea(top: false, child: MyInsightsBodyView()),
    );
  }
}
