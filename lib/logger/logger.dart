import "package:swapiinfo/di.dart";
import "package:swapiinfo/logger/log_listener.dart";

import "constants.dart";

/// Singleton Logger class
/// This logger class acts as a single logging source of truth
/// Before adding the logger type, extend logger listener, then add to getIt
/// Might be roundabout way, but this will be useful once you use multiple online loggers
class Logger implements LogListener {
  static int _instanceLength = 0;
  static Logger? _instance;

  final List<LogListener> availableLogs;

  static Logger get() {
    final List<LogListener> instances = <LogListener>[];
    // List all of the loggers here
    if (getIt.isRegistered<LogListener>(instanceName: kDeveloperLogger)) {
      instances.add(getIt.get<LogListener>(instanceName: kDeveloperLogger));
    }

    if (_instance == null) {
      _instanceLength = instances.length;
      _instance = Logger._(instances);
    } else if (_instanceLength != instances.length) {
      _instanceLength = instances.length;
      _instance = Logger._(instances);
    }

    return _instance!;
  }

  Logger._(this.availableLogs);

  @override
  void debug(String message, {int stacktraceLevel = kDefaultStackTraceLevel}) {
    for (final LogListener element in availableLogs) {
      element.debug(message, stacktraceLevel: stacktraceLevel);
    }
  }

  @override
  void error(Exception ex, {int stacktraceLevel = kDefaultStackTraceLevel}) {
    for (final LogListener element in availableLogs) {
      element.error(ex, stacktraceLevel: stacktraceLevel);
    }
  }

  @override
  void fatal({int stacktraceLevel = kDefaultStackTraceLevel}) {
    for (final LogListener element in availableLogs) {
      element.fatal(stacktraceLevel: stacktraceLevel);
    }
  }

  @override
  void info(String message,
      {Map<String, dynamic>? data,
      int stacktraceLevel = kDefaultStackTraceLevel}) {
    for (final LogListener element in availableLogs) {
      element.info(message, stacktraceLevel: stacktraceLevel);
    }
  }

  @override
  void warning(String message,
      {Map<String, dynamic>? data,
      int stacktraceLevel = kDefaultStackTraceLevel}) {
    for (final LogListener element in availableLogs) {
      element.warning(message, data: data, stacktraceLevel: stacktraceLevel);
    }
  }
}
