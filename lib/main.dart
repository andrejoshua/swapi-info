import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:stack_trace/stack_trace.dart";
import "package:swapiinfo/di.dart";
import "package:swapiinfo/ui/app.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp]);

  Chain.capture(() {
    configureInjection();

    runApp(MyApp());
  });
}
