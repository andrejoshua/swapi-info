import "constants.dart";

/// Logging interface
/// This eases the logging usage, as the logger mechanism will be centered around this interface
/// If we need to add online logging system (such as Rollbar, New Relic), we can just extend this interface to connect with the online logger
mixin LogListener {
  /// For debug only, kindly not send this to logging service (Sentry/Sonar)
  void debug(
    String message, {
    int stacktraceLevel = kDefaultStackTraceLevel,
  });

  /// For warning level
  /// Use this if there are suspicious codes
  void warning(
    String message, {
    Map<String, dynamic>? data,
    int stacktraceLevel = kDefaultStackTraceLevel,
  });

  /// For info level
  /// Use this to highlight some information
  void info(
    String message, {
    Map<String, dynamic>? data,
    int stacktraceLevel = kDefaultStackTraceLevel,
  });

  /// For error level
  /// Usually this function is combined with [ex]
  void error(
    Exception ex, {
    int stacktraceLevel = kDefaultStackTraceLevel,
  });

  /// For fatal level
  /// After fixing fatal errors that caused error widget to show up or app force close,
  /// send this log to logging service.
  void fatal({
    int stacktraceLevel = kDefaultStackTraceLevel,
  });
}
