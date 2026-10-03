import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/booking/booking_list_entity.dart';
import 'booking_model.dart';

part 'booking_list_response_model.freezed.dart';
part 'booking_list_response_model.g.dart';

@freezed
abstract class BookingSummaryModel with _$BookingSummaryModel {
  const factory BookingSummaryModel({
    @Default(0) int total,
    @Default(0) int upcoming,
    @Default(0) int past,
    @Default(0) int cancelled,
  }) = _BookingSummaryModel;

  factory BookingSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$BookingSummaryModelFromJson(json);
}

@freezed
abstract class BookingPaginationModel with _$BookingPaginationModel {
  const factory BookingPaginationModel({
    @Default(0) int total,
    @Default(1) int page,
    @Default(20) int limit,
    @Default(1) int totalPages,
  }) = _BookingPaginationModel;

  factory BookingPaginationModel.fromJson(Map<String, dynamic> json) =>
      _$BookingPaginationModelFromJson(json);
}

@freezed
abstract class BookingListResponseModel with _$BookingListResponseModel {
  const factory BookingListResponseModel({
    BookingSummaryModel? summary,
    @Default([]) List<BookingModel> items,
    BookingPaginationModel? pagination,
  }) = _BookingListResponseModel;

  factory BookingListResponseModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> normalized = Map<String, dynamic>.from(json);
    if (!normalized.containsKey('pagination') || normalized['pagination'] == null) {
      normalized['pagination'] = json;
    }
    final rawSummary = normalized['summary'];
    final rawPagination = normalized['pagination'];
    final rawItems = normalized['items'];

    return BookingListResponseModel(
      summary: rawSummary is Map<String, dynamic>
          ? BookingSummaryModel.fromJson(rawSummary)
          : null,
      items: rawItems is List
          ? rawItems
              .whereType<Map<String, dynamic>>()
              .map(BookingModel.fromJson)
              .toList()
          : const [],
      pagination: rawPagination is Map<String, dynamic>
          ? BookingPaginationModel.fromJson(rawPagination)
          : null,
    );
  }
}

extension BookingListResponseModelX on BookingListResponseModel {
  BookingListResponseEntity toEntity() => BookingListResponseEntity(
        summary: BookingSummaryEntity(
          total: summary?.total ?? 0,
          upcoming: summary?.upcoming ?? 0,
          past: summary?.past ?? 0,
          cancelled: summary?.cancelled ?? 0,
        ),
        items: items.map((m) => m.toEntity()).toList(),
        pagination: BookingPaginationEntity(
          total: pagination?.total ?? 0,
          page: pagination?.page ?? 1,
          limit: pagination?.limit ?? 20,
          totalPages: pagination?.totalPages ?? 1,
        ),
      );
}
