import "package:swapiinfo/di.dart";
import "package:swapiinfo/logger/constants.dart";

import "developer_log_listener.dart";
import "log_listener.dart";

void initializeLogServices() {
  _initializeDevLog();
}

// Adding the LogListener to getIt when app starts
void _initializeDevLog() {
  getIt.registerLazySingleton<LogListener>(() => DeveloperLogListener(),
      instanceName: kDeveloperLogger);
}
