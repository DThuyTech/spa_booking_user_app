import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/entities/review/review_entity.dart';

part 'write_review_state.freezed.dart';

enum WriteReviewStatus { initial, loading, success, failure }

@freezed
abstract class WriteReviewState with _$WriteReviewState {
  const WriteReviewState._();

  const factory WriteReviewState({
    @Default(WriteReviewStatus.initial) WriteReviewStatus status,
    ReviewEntity? submittedReview,
    Failure? failure,
  }) = _WriteReviewState;

  bool get isInitial => status == WriteReviewStatus.initial;
  bool get isLoading => status == WriteReviewStatus.loading;
  bool get isSuccess => status == WriteReviewStatus.success;
  bool get isFailure => status == WriteReviewStatus.failure;
}
