import 'package:equatable/equatable.dart';

sealed class WriteReviewEvent extends Equatable {
  const WriteReviewEvent();

  @override
  List<Object?> get props => [];
}

class SubmitReviewEvent extends WriteReviewEvent {
  final String storeId;
  final String bookingId;
  final int rating;
  final String comment;
  final List<String> images;

  const SubmitReviewEvent({
    this.storeId = '',
    required this.bookingId,
    required this.rating,
    required this.comment,
    this.images = const [],
  });

  @override
  List<Object?> get props => [storeId, bookingId, rating, comment, images];
}
