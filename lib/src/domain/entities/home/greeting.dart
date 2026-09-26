import 'package:freezed_annotation/freezed_annotation.dart';

part 'greeting.freezed.dart';

@freezed
abstract class Greeting with _$Greeting {
  const factory Greeting({
    required String id,
    required String title,
    required String message,
    required DateTime timestamp,
  }) = _Greeting;
}
