abstract class TimeService {
  DateTime now();
}

class SystemTimeService implements TimeService {
  const SystemTimeService();

  @override
  DateTime now() => DateTime.now();
}
