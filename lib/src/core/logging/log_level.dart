enum LogLevel {
  debug(1),
  info(2),
  warning(3),
  error(4);

  final int priority;
  const LogLevel(this.priority);

  bool operator >=(LogLevel other) => priority >= other.priority;
}
