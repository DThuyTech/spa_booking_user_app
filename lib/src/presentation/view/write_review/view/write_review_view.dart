import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/di/dependency_injection.dart';
import '../../../../shared/design_system/components/navigation/app_app_bar.dart';
import '../../../../shared/widgets/toast/app_toast.dart';
import '../../../bloc/review/write_review/write_review_bloc.dart';
import '../body_view/write_review_body_view.dart';
import '../mockup_data/write_review_mock_data.dart';

@RoutePage()
class WriteReviewPage extends StatelessWidget {
  final String? storeId;
  final String? bookingId;
  final String? salonName;
  final String? logoUrl;

  const WriteReviewPage({
    super.key,
    this.storeId,
    this.bookingId,
    this.salonName,
    this.logoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WriteReviewBloc>(
      create: (_) => sl<WriteReviewBloc>(),
      child: WriteReviewView(
        storeId: storeId,
        bookingId: bookingId,
        salonName: salonName ?? WriteReviewMockData.defaultSalonName,
        logoUrl: logoUrl ?? WriteReviewMockData.defaultLogoUrl,
      ),
    );
  }
}

class WriteReviewView extends StatefulWidget {
  final String? storeId;
  final String? bookingId;
  final String salonName;
  final String logoUrl;

  const WriteReviewView({
    super.key,
    this.storeId,
    this.bookingId,
    this.salonName = WriteReviewMockData.defaultSalonName,
    this.logoUrl = WriteReviewMockData.defaultLogoUrl,
  });

  @override
  State<WriteReviewView> createState() => _WriteReviewViewState();
}

class _WriteReviewViewState extends State<WriteReviewView> {
  late final TextEditingController _reviewController;
  int _selectedRating = 0;
  late List<SpecificRatingDetail> _criteria;
  final List<String> _photoUrls = [];

  static const Color _coralColor = Color(0xFFFF6F59);

  @override
  void initState() {
    super.initState();
    _reviewController = TextEditingController();
    _criteria = List.from(WriteReviewMockData.defaultCriteria);
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  void _onCriteriaChanged(int index, double value) {
    setState(() {
      _criteria[index] = _criteria[index].copyWith(
        value: value,
        statusText: WriteReviewMockData.getStatusForValue(value),
      );
    });
  }

  void _onAddPhoto() {
    setState(() {
      if (_photoUrls.length < 5) {
        _photoUrls.add(
          'https://images.unsplash.com/photo-1560066984-138dadb4c035?auto=format&fit=crop&w=400&q=80',
        );
        AppToast.info(context, message: 'Photo attached');
      } else {
        AppToast.warning(context, message: 'Maximum 5 photos allowed');
      }
    });
  }

  void _onRemovePhoto(int index) {
    setState(() {
      _photoUrls.removeAt(index);
    });
  }

  bool get _hasBloc {
    try {
      BlocProvider.of<WriteReviewBloc>(context);
      return true;
    } catch (_) {
      return false;
    }
  }

  void _onSubmit() {
    if (_selectedRating == 0) {
      AppToast.warning(context, message: 'Please select a star rating');
      return;
    }

    if (_hasBloc) {
      context.read<WriteReviewBloc>().add(
            SubmitReviewEvent(
              storeId: widget.storeId ?? '',
              bookingId: widget.bookingId ?? '',
              rating: _selectedRating,
              comment: _reviewController.text.trim(),
              images: _photoUrls,
            ),
          );
      return;
    }

    AppToast.success(
      context,
      message: 'Thank you! Your review for ${widget.salonName} was submitted.',
    );
    Navigator.of(context).maybePop(true);
  }

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppAppBar(
        title: 'Write a Review',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TextButton(
              onPressed: _onSubmit,
              style: TextButton.styleFrom(
                foregroundColor: _coralColor,
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              child: const Text('Post'),
            ),
          ),
        ],
      ),
      body: WriteReviewBodyView(
        salonName: widget.salonName,
        logoUrl: widget.logoUrl,
        selectedRating: _selectedRating,
        onRatingChanged: (rating) {
          setState(() {
            _selectedRating = rating;
          });
        },
        reviewController: _reviewController,
        criteria: _criteria,
        onCriteriaChanged: _onCriteriaChanged,
        photoUrls: _photoUrls,
        onAddPhoto: _onAddPhoto,
        onRemovePhoto: _onRemovePhoto,
        onSubmitReview: _onSubmit,
      ),
    );

    if (!_hasBloc) return scaffold;

    return BlocConsumer<WriteReviewBloc, WriteReviewState>(
      listener: (context, state) {
        if (state.status == WriteReviewStatus.success) {
          AppToast.success(
            context,
            message:
                'Thank you! Your review for ${widget.salonName} was submitted.',
          );
          Navigator.of(context).maybePop(true);
        } else if (state.status == WriteReviewStatus.failure) {
          AppToast.error(
            context,
            message: state.failure?.message ?? 'Failed to submit review',
          );
        }
      },
      builder: (context, state) {
        if (state.status == WriteReviewStatus.loading) {
          return Stack(
            children: [
              scaffold,
              Container(
                color: Colors.black.withValues(alpha: 0.2),
                child: const Center(
                  child: CircularProgressIndicator(color: _coralColor),
                ),
              ),
            ],
          );
        }
        return scaffold;
      },
    );
  }
}
