import 'package:spa_booking/src/domain/entities/home/greeting.dart';
import 'package:spa_booking/src/data/model/home/greeting_model.dart';

extension GreetingModelMapper on GreetingModel {
  Greeting toEntity() {
    return Greeting(
      id: id,
      title: title,
      message: message,
      timestamp: DateTime.tryParse(createdAt) ?? DateTime.now(),
    );
  }
}
