import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:spa_booking/src/core/error/failure.dart';
import 'package:spa_booking/src/domain/entities/review/review_entity.dart';
import 'package:spa_booking/src/domain/usecases/review/create_booking_review_usecase.dart';
import 'package:spa_booking/src/domain/usecases/review/create_store_review_usecase.dart';
import 'package:spa_booking/src/presentation/bloc/review/write_review/write_review_bloc.dart';

class MockCreateStoreReviewUseCase extends Mock
    implements CreateStoreReviewUseCase {}

class MockCreateBookingReviewUseCase extends Mock
    implements CreateBookingReviewUseCase {}

void main() {
  late MockCreateStoreReviewUseCase mockStoreReviewUseCase;
  late MockCreateBookingReviewUseCase mockBookingReviewUseCase;
  late WriteReviewBloc bloc;

  final testReview = ReviewEntity(
    id: 'rev_123',
    customerName: 'Linh Nguyen',
    rating: 5,
    comment: 'Great service!',
    createdAt: DateTime.now(),
  );

  setUp(() {
    mockStoreReviewUseCase = MockCreateStoreReviewUseCase();
    mockBookingReviewUseCase = MockCreateBookingReviewUseCase();
    bloc = WriteReviewBloc(
      createStoreReviewUseCase: mockStoreReviewUseCase,
      createBookingReviewUseCase: mockBookingReviewUseCase,
    );
  });

  tearDown(() {
    bloc.close();
  });

  group('WriteReviewBloc Test Suite', () {
    test('initial status is WriteReviewStatus.initial', () {
      expect(bloc.state.status, equals(WriteReviewStatus.initial));
    });

    blocTest<WriteReviewBloc, WriteReviewState>(
      'calls CreateBookingReviewUseCase when storeId is empty and succeeds',
      build: () {
        when(
          () => mockBookingReviewUseCase(
            bookingId: 'bk_123',
            rating: 5,
            comment: 'Great service!',
            images: any(named: 'images'),
          ),
        ).thenAnswer((_) async => Right(testReview));
        return bloc;
      },
      act: (b) => b.add(
        const SubmitReviewEvent(
          bookingId: 'bk_123',
          rating: 5,
          comment: 'Great service!',
        ),
      ),
      expect: () => [
        const WriteReviewState(status: WriteReviewStatus.loading),
        WriteReviewState(
          status: WriteReviewStatus.success,
          submittedReview: testReview,
        ),
      ],
      verify: (_) {
        verify(
          () => mockBookingReviewUseCase(
            bookingId: 'bk_123',
            rating: 5,
            comment: 'Great service!',
            images: any(named: 'images'),
          ),
        ).called(1);
        verifyNever(
          () => mockStoreReviewUseCase(
            storeId: any(named: 'storeId'),
            bookingId: any(named: 'bookingId'),
            rating: any(named: 'rating'),
            comment: any(named: 'comment'),
            images: any(named: 'images'),
          ),
        );
      },
    );

    blocTest<WriteReviewBloc, WriteReviewState>(
      'calls CreateStoreReviewUseCase when storeId is provided and succeeds',
      build: () {
        when(
          () => mockStoreReviewUseCase(
            storeId: 'store_123',
            bookingId: 'bk_123',
            rating: 5,
            comment: 'Great service!',
            images: any(named: 'images'),
          ),
        ).thenAnswer((_) async => Right(testReview));
        return bloc;
      },
      act: (b) => b.add(
        const SubmitReviewEvent(
          storeId: 'store_123',
          bookingId: 'bk_123',
          rating: 5,
          comment: 'Great service!',
        ),
      ),
      expect: () => [
        const WriteReviewState(status: WriteReviewStatus.loading),
        WriteReviewState(
          status: WriteReviewStatus.success,
          submittedReview: testReview,
        ),
      ],
      verify: (_) {
        verify(
          () => mockStoreReviewUseCase(
            storeId: 'store_123',
            bookingId: 'bk_123',
            rating: 5,
            comment: 'Great service!',
            images: any(named: 'images'),
          ),
        ).called(1);
      },
    );

    blocTest<WriteReviewBloc, WriteReviewState>(
      'emits failure when review submission fails',
      build: () {
        when(
          () => mockBookingReviewUseCase(
            bookingId: 'bk_123',
            rating: 5,
            comment: 'Great service!',
            images: any(named: 'images'),
          ),
        ).thenAnswer(
          (_) async => const Left(ServerFailure('Booking not eligible')),
        );
        return bloc;
      },
      act: (b) => b.add(
        const SubmitReviewEvent(
          bookingId: 'bk_123',
          rating: 5,
          comment: 'Great service!',
        ),
      ),
      expect: () => [
        const WriteReviewState(status: WriteReviewStatus.loading),
        const WriteReviewState(
          status: WriteReviewStatus.failure,
          failure: ServerFailure('Booking not eligible'),
        ),
      ],
    );
  });
}
