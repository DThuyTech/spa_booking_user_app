import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spa_booking/src/presentation/bloc/review/write_review/write_review_bloc.dart';
import 'package:spa_booking/src/presentation/view/store_detail/view/store_content_view.dart';
import '../../../../app/di/dependency_injection.dart';
import '../../../bloc/review/store_reviews/store_reviews_bloc.dart';
import '../../../bloc/store/store_detail/store_detail_bloc.dart';

@RoutePage()
class StoreDetailPage extends StatelessWidget {
  final String storeId;
  const StoreDetailPage({super.key, required this.storeId});

  @override
  Widget build(BuildContext context) {
    return StoreDetailView(storeId: storeId);
  }
}

class StoreDetailView extends StatelessWidget {
  final String storeId;

  const StoreDetailView({super.key, required this.storeId});

  @override
  Widget build(BuildContext context) {
    final effectiveId = storeId;

    return MultiBlocProvider(
      providers: [
        BlocProvider<StoreDetailBloc>(
          create: (_) =>
              sl<StoreDetailBloc>()..add(FetchStoreDetailEvent(effectiveId)),
        ),
        BlocProvider<WriteReviewBloc>(create: (_) => sl<WriteReviewBloc>()),
        BlocProvider<StoreReviewsBloc>(
          create: (_) {
            return sl<StoreReviewsBloc>()
              ..add(FetchStoreReviewsEvent(storeId: effectiveId));
          },
        ),
      ],
      child: StoreDetailContentView(storeId: effectiveId),
    );
  }
}
