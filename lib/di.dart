import "package:get_it/get_it.dart";
import "package:injectable/injectable.dart";

import "di.config.dart";

final GetIt getIt = GetIt.instance;

// Function to load the injection
// There is a preResolve method in one of the modules, causing injection to take a bit longer
// The preResolve method is there to load the temporary directory for cache
// However this will not take a significant time
@InjectableInit(
  initializerName: r"$initGetIt", // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureInjection() => $initGetIt(getIt);