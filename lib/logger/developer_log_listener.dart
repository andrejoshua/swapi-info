import "dart:developer" as developer;

import "package:stack_trace/stack_trace.dart";

import "constants.dart";
import "log_listener.dart";

/// A logger extension, uses dart developer as engine
class DeveloperLogListener implements LogListener {
  @override
  void debug(String message, {int stacktraceLevel = kDefaultStackTraceLevel}) {
    developer.log(message,
        name: "DEBUG",
        stackTrace: Trace.current(stacktraceLevel),
        level: 1,
        time: DateTime.now());
  }

  @override
  void error(Exception ex, {int stacktraceLevel = kDefaultStackTraceLevel}) {
    developer.log(
      ex.toString(),
      error: ex,
      name: "ERROR",
      stackTrace: Trace.current(stacktraceLevel),
      level: 4,
      time: DateTime.now(),
    );
  }

  @override
  void fatal({int stacktraceLevel = kDefaultStackTraceLevel}) {
    developer.log(
      "FATAL ERROR",
      name: "FATAL",
      stackTrace: Trace.current(stacktraceLevel),
      level: 5,
      time: DateTime.now(),
    );
  }

  @override
  void info(String message,
      {Map<String, dynamic>? data,
      int stacktraceLevel = kDefaultStackTraceLevel}) {
    developer.log(
      message,
      name: "INFO",
      stackTrace: Trace.current(stacktraceLevel),
      level: 2,
      time: DateTime.now(),
    );
  }

  @override
  void warning(String message,
      {Map<String, dynamic>? data,
      int stacktraceLevel = kDefaultStackTraceLevel}) {
    developer.log(
      message,
      name: "WARNING",
      stackTrace: Trace.current(stacktraceLevel),
      level: 3,
      time: DateTime.now(),
    );
  }
}
