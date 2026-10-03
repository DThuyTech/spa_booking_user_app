import 'package:fpdart/fpdart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failure.dart';
import '../../../../domain/entities/review/review_entity.dart';
import '../../../../domain/usecases/review/create_booking_review_usecase.dart';
import '../../../../domain/usecases/review/create_store_review_usecase.dart';
import 'write_review_event.dart';
import 'write_review_state.dart';

export 'write_review_event.dart';
export 'write_review_state.dart';

class WriteReviewBloc extends Bloc<WriteReviewEvent, WriteReviewState> {
  final CreateStoreReviewUseCase? createStoreReviewUseCase;
  final CreateBookingReviewUseCase? createBookingReviewUseCase;

  WriteReviewBloc({
    this.createStoreReviewUseCase,
    this.createBookingReviewUseCase,
  }) : super(const WriteReviewState()) {
    on<SubmitReviewEvent>(_onSubmitReview);
  }

  Future<void> _onSubmitReview(
    SubmitReviewEvent event,
    Emitter<WriteReviewState> emit,
  ) async {
    emit(state.copyWith(status: WriteReviewStatus.loading, failure: null));

    final Either<Failure, ReviewEntity> result;
    if (event.storeId.isEmpty && createBookingReviewUseCase != null) {
      result = await createBookingReviewUseCase!(
        bookingId: event.bookingId,
        rating: event.rating,
        comment: event.comment,
        images: event.images,
      );
    } else if (createStoreReviewUseCase != null) {
      result = await createStoreReviewUseCase!(
        storeId: event.storeId,
        bookingId: event.bookingId,
        rating: event.rating,
        comment: event.comment,
        images: event.images,
      );
    } else if (createBookingReviewUseCase != null) {
      result = await createBookingReviewUseCase!(
        bookingId: event.bookingId,
        rating: event.rating,
        comment: event.comment,
        images: event.images,
      );
    } else {
      emit(state.copyWith(
        status: WriteReviewStatus.failure,
        failure: const ServerFailure('No use case available to submit review'),
      ));
      return;
    }

    result.fold(
      (Failure failure) => emit(state.copyWith(
        status: WriteReviewStatus.failure,
        failure: failure,
      )),
      (submitted) => emit(state.copyWith(
        status: WriteReviewStatus.success,
        submittedReview: submitted,
        failure: null,
      )),
    );
  }
}
