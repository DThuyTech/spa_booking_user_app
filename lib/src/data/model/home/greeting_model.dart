import 'package:freezed_annotation/freezed_annotation.dart';

part 'greeting_model.freezed.dart';
part 'greeting_model.g.dart';

@freezed
abstract class GreetingModel with _$GreetingModel {
  const factory GreetingModel({
    required String id,
    required String title,
    required String message,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _GreetingModel;

  factory GreetingModel.fromJson(Map<String, dynamic> json) =>
      _$GreetingModelFromJson(json);
}
