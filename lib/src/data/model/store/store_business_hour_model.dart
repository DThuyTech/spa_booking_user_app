import 'package:json_annotation/json_annotation.dart';
import 'package:spa_booking/src/domain/entities/store/store_business_hour_enity.dart';

part 'store_business_hour_model.g.dart';

@JsonSerializable()
class StoreBusinessHourModel {
  final int dayOfWeek;
  final String dayName;
  final bool isOpen;
  final List<TimeRangesModel> timeRanges;

  const StoreBusinessHourModel({
    required this.dayOfWeek,
    required this.dayName,
    required this.isOpen,
    required this.timeRanges,
  });

  factory StoreBusinessHourModel.fromJson(Map<String, dynamic> json) {
    int dayOfWeekInt;
    String dayNameStr;

    final rawDay = json['dayOfWeek'];

    if (rawDay is int) {
      dayOfWeekInt = rawDay;
      dayNameStr = json['dayName'] as String? ?? _dayNameFromInt(dayOfWeekInt);
    } else {
      final str = rawDay?.toString().toUpperCase() ?? '';

      switch (str) {
        case 'MONDAY':
          dayOfWeekInt = 1;
          dayNameStr = 'Monday';
          break;

        case 'TUESDAY':
          dayOfWeekInt = 2;
          dayNameStr = 'Tuesday';
          break;

        case 'WEDNESDAY':
          dayOfWeekInt = 3;
          dayNameStr = 'Wednesday';
          break;

        case 'THURSDAY':
          dayOfWeekInt = 4;
          dayNameStr = 'Thursday';
          break;

        case 'FRIDAY':
          dayOfWeekInt = 5;
          dayNameStr = 'Friday';
          break;

        case 'SATURDAY':
          dayOfWeekInt = 6;
          dayNameStr = 'Saturday';
          break;

        case 'SUNDAY':
          dayOfWeekInt = 7;
          dayNameStr = 'Sunday';
          break;

        default:
          dayOfWeekInt = int.tryParse(str) ?? 1;
          dayNameStr = json['dayName'] as String? ?? 'Day $dayOfWeekInt';
      }
    }

    final timeRanges = json['timeRanges'];
    List<TimeRangesModel> timeRangesModel = [];

    if (timeRanges is List && timeRanges.isNotEmpty) {
      timeRangesModel = timeRanges
          .map((e) => TimeRangesModel.fromJson(e))
          .toList();
    }

    return StoreBusinessHourModel(
      dayOfWeek: dayOfWeekInt,
      dayName: dayNameStr,
      isOpen: json['isOpen'] as bool? ?? false,
      timeRanges: timeRangesModel,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dayOfWeek': dayOfWeek,
      'dayName': dayName,
      'isOpen': isOpen,
      'timeRanges': timeRanges,
    };
  }

  StoreBusinessHourEntity toEntity() {
    return StoreBusinessHourEntity(
      dayOfWeek: dayOfWeek,
      dayName: dayName,
      isOpen: isOpen,
      timeRanges: timeRanges.map((e) => e.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class TimeRangesModel {
  final String startTime;
  final String endTime;

  const TimeRangesModel({required this.startTime, required this.endTime});

  factory TimeRangesModel.fromJson(Map<String, dynamic> json) =>
      _$TimeRangesModelFromJson(json);

  Map<String, dynamic> toJson() => _$TimeRangesModelToJson(this);

  TimeRangesEntity toEntity() =>
      TimeRangesEntity(startTime: startTime, endTime: endTime);
}

String _dayNameFromInt(int day) {
  switch (day) {
    case 1:
      return 'Monday';
    case 2:
      return 'Tuesday';
    case 3:
      return 'Wednesday';
    case 4:
      return 'Thursday';
    case 5:
      return 'Friday';
    case 6:
      return 'Saturday';
    case 7:
    case 0:
      return 'Sunday';
    default:
      return 'Day $day';
  }
}
